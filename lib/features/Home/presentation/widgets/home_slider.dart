import 'package:bokkia/core/utils/app_colors.dart';
import 'package:bokkia/features/Home/presentation/cubit/home_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          current is HomeSlideLoading ||
          current is HomeSliderFailure ||
          current is HomeSliderSuccess,
      builder: (context, state) {
        if (state is HomeSlideLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is HomeSliderSuccess) {
          var data = HomeCubit.sliders?.data?.sliders ?? [];
          return Column(
            children: [
              CarouselSlider.builder(
                itemCount: data.length,
                itemBuilder: (context, index, realIndex) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: data[index].image.toString(),
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 150,
                  viewportFraction: 0.9,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  enlargeFactor: 0.3,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  scrollDirection: Axis.horizontal,
                ),
              ),
              Gap(10),
              SmoothPageIndicator(
                controller: PageController(
                  initialPage: currentIndex,
                ), // PageController
                count: data.length,

                effect: ExpandingDotsEffect(
                  dotColor: AppColors.gray,
                  activeDotColor: AppColors.primaryColor,
                  dotWidth: 7,
                  dotHeight: 7,
                  expansionFactor: 5,
                  spacing: 10,
                ), // your preferred effect
                onDotClicked: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ],
          );
        } else if (state is HomeSliderFailure) {
          var error = state.error;
          return Center(child: Text(error));
        }
        return Container();
      },
    );
  }
}
