import 'package:bokkia/core/extenstions/navigator.dart';
import 'package:bokkia/core/utils/app_colors.dart';
import 'package:bokkia/features/welcom/welcom.dart';
import 'package:flutter/material.dart';

class ButtonBack extends StatelessWidget {
  const ButtonBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
