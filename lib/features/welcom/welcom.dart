import 'package:bokkia/core/constants/assets.dart';
import 'package:bokkia/core/utils/app_colors.dart';
import 'package:bokkia/core/utils/text_style.dart';
import 'package:bokkia/core/widgets/custom_button.dart';
import 'package:bokkia/core/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Welcom extends StatelessWidget {
  const Welcom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Logo.welcom,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 22,
            left: 22,
            child: Column(
              children: [
                Spacer(flex: 1),
                logo(),
                Text("Order Your Book Now!", style: getTitleTextStyle(context)),
                Spacer(flex: 2),
                CustomButton(
                  size: Size(double.infinity, 56),
                  text: Text(
                    "Login",
                    style: getBodyTextStyle(
                      context,
                      fontsize: 14,
                      color: AppColors.whiteColor,
                    ),
                  ),
                  onpressed: () {},
                  color: AppColors.primaryColor,
                ),
                Gap(10),
                CustomButton(
                  size: Size(double.infinity, 56),
                  text: Text(
                    "Register",
                    style: getBodyTextStyle(context, fontsize: 14),
                  ),
                  onpressed: () {},
                  color: AppColors.whiteColor,
                ),
                Spacer(flex: 1),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
