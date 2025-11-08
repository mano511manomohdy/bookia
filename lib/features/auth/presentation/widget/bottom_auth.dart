import 'package:bokkia/core/utils/app_colors.dart';
import 'package:bokkia/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class BottomAuth extends StatelessWidget {
  const BottomAuth({
    super.key,
    this.text,
    required this.onPressed,
    this.promptText,
  });
  final String? text;
  final void Function() onPressed;
  final String? promptText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          promptText ?? "Don’t have an account?",
          style: getBodyTextStyle(context),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            text ?? "Register Now",
            style: getBodyTextStyle(context, color: AppColors.primaryColor),
          ),
        ),
      ],
    );
  }
}
