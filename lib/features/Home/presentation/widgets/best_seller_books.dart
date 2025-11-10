import 'package:bokkia/core/extenstions/navigator.dart';
import 'package:bokkia/core/utils/app_colors.dart';
import 'package:bokkia/core/utils/text_style.dart';
import 'package:bokkia/core/widgets/custom_button.dart';
import 'package:bokkia/features/Home/presentation/cubit/home_cubit.dart';
import 'package:bokkia/features/Home/presentation/pages/book_details.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class BestSellerBooks extends StatelessWidget {
  const BestSellerBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<HomeCubit, HomeState>(
        buildWhen: (previous, current) =>
            current is HomeBestSellerLoading ||
            current is HomeBestSellerfailure ||
            current is HomeBestSellersuccess,
        builder: (context, state) {
          if (state is HomeBestSellerLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is HomeBestSellersuccess) {
            var data = HomeCubit.bestSeller?.data?.products ?? [];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Best Sellers",
                  style: getTitleTextStyle(context, color: AppColors.darkcolor),
                ),
                Gap(10),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    mainAxisExtent: 280,
                  ),
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        context.pushTo(BookDetails(product: data[index]));
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: AppColors.secondrycolor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Hero(
                                tag: data[index].id ?? '',
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: CachedNetworkImage(
                                    width: double.infinity,
                                    imageUrl: data[index].image.toString(),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),

                            Text(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              data[index].name.toString(),
                              style: getSmallTextStyle(context, fontsize: 18),
                            ),
                            Row(
                              children: [
                                Text("${data[index].priceAfterDiscount} \$"),
                                Spacer(),
                                CustomButton(
                                  size: Size(70, 30),
                                  color: AppColors.darkcolor,
                                  text: Text(
                                    "Buy",
                                    style: getBodyTextStyle(
                                      context,
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                  onpressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          } else if (state is HomeBestSellerfailure) {
            var error = state.error;
            return Center(child: Text(error));
          }
          return Container();
        },
      ),
    );
  }
}
