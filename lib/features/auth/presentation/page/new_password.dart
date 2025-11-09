import 'package:bokkia/core/extenstions/navigator.dart';
import 'package:bokkia/core/utils/app_colors.dart';
import 'package:bokkia/core/utils/text_style.dart';
import 'package:bokkia/core/widgets/back_button.dart';
import 'package:bokkia/core/widgets/custom_button.dart';
import 'package:bokkia/features/auth/presentation/page/otp_verfication.dart';
import 'package:bokkia/features/auth/presentation/page/password_changed.dart';
import 'package:bokkia/features/auth/presentation/widget/password_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key, this.email, this.otp});
  final String? email;
  final int? otp;

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    TextEditingController password = TextEditingController();
    TextEditingController confirmPassword = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: ButtonBack(
          onPressed: () {
            context.pushReplacement(OtpVerfication());
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Create new password", style: getHeadLineTextStyle(context)),
              Gap(10),
              Text(
                "Your new password must be unique from those previously used.",
                style: getBodyTextStyle(context, fontWeight: FontWeight.w400),
              ),
              Gap(32),
              PasswordWidget(passwordController: password),
              Gap(15),
              PasswordWidget(passwordController: confirmPassword),
              Gap(38),
              CustomButton(
                size: Size(double.infinity, 56),
                text: Text(
                  "Reset Password",
                  style: getBodyTextStyle(context, color: AppColors.whiteColor),
                ),
                onpressed: () {
                  if (formkey.currentState!.validate()) {
                    context.pushReplacement(PasswordChanged());
                  } else {
                    return "Enter valid password";
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
