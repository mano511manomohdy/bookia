import 'package:bokkia/core/utils/app_colors.dart';
import 'package:bokkia/core/utils/text_style.dart';
import 'package:bokkia/core/widgets/custom_button.dart';
import 'package:bokkia/features/Home/presentation/widgets/best_seller_books.dart';
import 'package:bokkia/features/Home/presentation/widgets/home_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          children: [
            SvgPicture.asset("assets/images/book.svg", height: 40),
            Gap(5),
            Text("Bookia", style: getBodyTextStyle(context, fontsize: 20)),
          ],
        ),
        actions: [
          SvgPicture.asset("assets/icons/search.svg", height: 25),
          Gap(10),
          SvgPicture.asset("assets/icons/notification.svg", height: 25),
          Gap(10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [HomeSlider(), Gap(10), BestSellerBooks()],
        ),
      ),
    );
  }
}
