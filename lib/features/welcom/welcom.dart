import 'package:bokkia/core/constants/assets.dart';
import 'package:bokkia/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Welcom extends StatelessWidget {
  const Welcom({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SvgPicture.asset(Logo.welcom, fit: BoxFit.cover),
          Expanded(
            flex: 1,
            child: Positioned(
              child: Text(
                "Order Your Book Now!",
                style: getBodyTextStyle(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
