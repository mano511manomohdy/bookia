import 'package:bokkia/core/constants/logo.dart';
import 'package:bokkia/core/extenstions/navigator.dart';
import 'package:bokkia/core/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3));
    context.pushReplacement(widget);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Row(
              children: [
                SvgPicture.asset(Logo.logo),
                Text("Bookia", style: getHeadLineTextStyle(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
