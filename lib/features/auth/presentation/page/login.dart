import 'package:bokkia/core/extenstions/navigator.dart';
import 'package:bokkia/core/utils/app_colors.dart';
import 'package:bokkia/core/utils/text_style.dart';
import 'package:bokkia/core/widgets/custom_button.dart';
import 'package:bokkia/core/widgets/social_account.dart';
import 'package:bokkia/features/auth/presentation/page/register.dart';
import 'package:bokkia/features/welcom/welcom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          padding: EdgeInsets.only(left: 2.5),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.bordercolor, width: 2),
            color: AppColors.whiteColor,
          ),
          child: IconButton(
            onPressed: () {
              context.pushReplacement(Welcom());
            },
            icon: Icon(Icons.arrow_back_ios, color: AppColors.darkcolor),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Welcome back! Glad to see you, Again!",
                style: getHeadLineTextStyle(context),
              ),
              Gap(32),
              TextFormField(
                decoration: InputDecoration(
                  fillColor: AppColors.accentcolor,
                  filled: true,
                  hintText: "Enter your email",
                  hintStyle: getSmallTextStyle(context, color: AppColors.gray),
                ),
              ),
              Gap(15),
              TextFormField(
                decoration: InputDecoration(
                  fillColor: AppColors.accentcolor,
                  filled: true,
                  hintText: "Enter your password",
                  hintStyle: getSmallTextStyle(context, color: AppColors.gray),
                  suffixIconConstraints: BoxConstraints(minWidth: 30),
                  suffixIcon: Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: SvgPicture.asset(
                      fit: BoxFit.cover,
                      "assets/icons/fluent_eye-20-filled.svg",
                    ),
                  ),
                ),
              ),
              Gap(13),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("Forget Password ?", style: getBodyTextStyle(context)),
                ],
              ),
              Gap(30),
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
                onpressed: () {
                  // context.pushTo();
                },
                color: AppColors.primaryColor,
              ),
              Gap(44),
              Row(
                children: [
                  Expanded(child: Divider(color: AppColors.gray)),
                  Gap(10),
                  Text("Or Login with", style: getSmallTextStyle(context)),
                  Gap(10),
                  Expanded(child: Divider(color: AppColors.gray)),
                ],
              ),
              Gap(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Social_Account(image: "assets/icons/facebook_ic.svg"),
                  Social_Account(image: "assets/icons/google_ic.svg"),
                  Social_Account(image: "assets/icons/cib_apple.svg"),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don’t have an account?", style: getBodyTextStyle(context)),
            TextButton(
              child: Text(
                "Register Now",
                style: getBodyTextStyle(context, color: AppColors.primaryColor),
              ),
              onPressed: () {
                context.pushReplacement(Register());
              },
            ),
          ],
        ),
      ),
    );
  }
}
