import 'package:bokkia/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.size,
    required this.onpressed,
    this.color,
    this.hasborder = false,
  });
  final Size? size;
  final Function() onpressed;
  final Color? color;
  final Text text;
  final bool hasborder;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? AppColors.primaryColor,
        side: hasborder
            ? BorderSide(color: AppColors.darkcolor, width: 1)
            : BorderSide.none,
        minimumSize: size ?? Size(double.infinity, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8),
        ),
      ),
      onPressed: onpressed,
      child: text,
    );
  }
}
