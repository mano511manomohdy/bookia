import 'package:bokkia/core/extenstions/navigator.dart';
import 'package:bokkia/core/utils/app_colors.dart';
import 'package:bokkia/core/utils/text_style.dart';
import 'package:bokkia/core/widgets/back_button.dart';
import 'package:bokkia/core/widgets/custom_button.dart';
import 'package:bokkia/features/auth/presentation/page/login.dart';
import 'package:bokkia/features/auth/presentation/widget/bottom_auth.dart';
import 'package:bokkia/features/auth/presentation/widget/email_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: backButton()),

      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Forgot Password?", style: getHeadLineTextStyle(context)),
            Gap(10),
            Text(
              "Don't worry! It occurs. Please enter the email address linked with your account.",
              style: getBodyTextStyle(context, fontWeight: FontWeight.w400),
            ),
            Gap(30),
            email_widget(emailController: emailController),
            Gap(38),
            CustomButton(
              size: Size(double.infinity, 56),
              text: Text(
                "SendCode",
                style: getBodyTextStyle(context, color: AppColors.whiteColor),
              ),
              onpressed: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: bottom_auth(
          text: "Login",
          onPressed: () {
            context.pushReplacement(Login());
          },
        ),
      ),
    );
  }
}
