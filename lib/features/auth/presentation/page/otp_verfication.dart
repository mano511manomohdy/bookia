import 'package:bokkia/core/extenstions/navigator.dart';
import 'package:bokkia/core/utils/app_colors.dart';
import 'package:bokkia/core/utils/text_style.dart';
import 'package:bokkia/core/widgets/back_button.dart';
import 'package:bokkia/core/widgets/custom_button.dart';
import 'package:bokkia/features/auth/presentation/page/new_password.dart';
import 'package:bokkia/features/auth/presentation/widget/bottom_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerfication extends StatelessWidget {
  const OtpVerfication({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: ButtonBack()),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("OTP Verification", style: getHeadLineTextStyle(context)),
            Gap(10),
            Text(
              "Enter the verification code we just sent on your email address.",
              style: getBodyTextStyle(context, fontWeight: FontWeight.w400),
            ),
            Gap(32),
            Center(
              child: PinCodeTextField(
                appContext: context,
                length: 4,
                keyboardType: TextInputType.number,
                animationType: AnimationType.scale,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 60,
                  fieldWidth: 70,
                  activeFillColor: Colors.white,
                  selectedFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  activeColor: AppColors.primaryColor,
                  inactiveColor: AppColors.primaryColor,
                ),
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                onCompleted: (v) {
                  print("Completed: $v");
                },
                onChanged: (value) {},
              ),
            ),

            Gap(38),
            CustomButton(
              size: Size(double.infinity, 56),
              text: Text(
                "Verfiy",
                style: getBodyTextStyle(context, color: AppColors.whiteColor),
              ),
              onpressed: () {
                context.pushReplacement(NewPassword());
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: BottomAuth(
          onPressed: () {},
          text: "ReSend",
          promptText: "Didn’t received code?",
        ),
      ),
    );
  }
}
