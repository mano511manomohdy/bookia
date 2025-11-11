import 'package:bokkia/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum ToastType { success, error }

showLoadingDialog(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    barrierColor: Colors.black26.withOpacity(0.8),
    context: context,
    builder: (ocntext) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          "assets/images/loading.json",
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ],
    ),
  );
}

showToast(
  BuildContext context,
  String massage, [
  ToastType type = ToastType.error,
]) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: 2),
      content: Text(massage),
      backgroundColor: type == ToastType.success
          ? AppColors.primaryColor
          : Colors.red,
    ),
  );
}
