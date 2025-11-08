import 'package:bokkia/core/utils/app_colors.dart';
import 'package:bokkia/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PasswordWidget extends StatelessWidget {
  const PasswordWidget({super.key, required this.passwordController});

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
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
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
    );
  }
}
