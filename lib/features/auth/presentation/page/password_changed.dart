import 'package:bokkia/core/extenstions/navigator.dart';
import 'package:bokkia/core/utils/app_colors.dart';
import 'package:bokkia/core/utils/text_style.dart';
import 'package:bokkia/core/widgets/custom_button.dart';
import 'package:bokkia/features/auth/presentation/page/login.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PasswordChanged extends StatelessWidget {
  const PasswordChanged({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                fit: BoxFit.cover,
                "assets/images/Successmark-2.png",
                width: 130,
                height: 130,
              ),
            ),
            Gap(35),
            Text(
              "Password Changed!",
              style: getHeadLineTextStyle(
                context,
                fontWeight: FontWeight.w400,
                fontsize: 26,
              ),
            ),
            Gap(10),
            Text(
              textAlign: TextAlign.center,
              "Your password has been changed successfully.",
              style: getSmallTextStyle(context),
            ),
            Gap(40),
            CustomButton(
              text: Text(
                "Back to Login",
                style: getBodyTextStyle(context, color: AppColors.whiteColor),
              ),
              onpressed: () {
                context.pushReplacement(Login());
              },
            ),
          ],
        ),
      ),
    );
  }
}
