import 'package:bokkia/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.size,
    required this.onpressed,
    this.color,
  });
  final Size? size;
  final Function() onpressed;
  final Color? color;
  final Text text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 5,
        backgroundColor: color ?? AppColors.primaryColor,
        side: BorderSide.none,
        minimumSize: size ?? Size(double.infinity, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
      ),
      onPressed: onpressed,
      child: text,
    );
  }
}
