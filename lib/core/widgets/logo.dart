import 'package:bokkia/core/constants/assets.dart';
import 'package:bokkia/core/utils/app_colors.dart';
import 'package:bokkia/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class logo extends StatelessWidget {
  const logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(Logo.logo, width: 100, height: 100),
        Text(
          "Bookia",
          style: getHeadLineTextStyle(context, color: AppColors.darkcolor),
        ),
      ],
    );
  }
}
