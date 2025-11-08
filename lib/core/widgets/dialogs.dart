import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

showLoadingDialog(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    barrierColor: Colors.black26,
    context: context,
    builder: (ocntext) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset(
          "assets/lottie/loading.json",
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
      ],
    ),
  );
}

showErrorToast(BuildContext context, String massage) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: 2),
      content: Text(massage),
      backgroundColor: Colors.red,
    ),
  );
}
