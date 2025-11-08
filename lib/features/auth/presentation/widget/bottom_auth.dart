import 'package:bokkia/core/utils/app_colors.dart';
import 'package:bokkia/core/utils/text_style.dart';
import 'package:flutter/material.dart';

class bottom_auth extends StatelessWidget {
  const bottom_auth({super.key, this.text, required this.onPressed});
  final String? text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don’t have an account?", style: getBodyTextStyle(context)),
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
