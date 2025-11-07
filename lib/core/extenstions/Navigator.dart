import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  PushTo(Widget widget) {
    Navigator.push(this, MaterialPageRoute(builder: (context) => widget));
  }

  PushReplacement(Widget widget) {
    Navigator.pushReplacement(
      this,
      MaterialPageRoute(builder: (context) => widget),
    );
  }
}
