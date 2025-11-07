import 'package:bokkia/core/extenstions/Navigator.dart';
import 'package:flutter/material.dart';

class splachScreen extends StatefulWidget {
  const splachScreen({super.key});

  @override
  State<splachScreen> createState() => _splachScreenState();
}

class _splachScreenState extends State<splachScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3));
    context.PushReplacement(widget);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(children: [
          
        ],
      ));
  }
}
