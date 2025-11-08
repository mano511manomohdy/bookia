import 'package:bokkia/core/utils/app_theme.dart';
import 'package:bokkia/features/intro/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: Apptheme.lightTheme,
      darkTheme: Apptheme.darkTheme,
      home: SplachScreen(),
    );
  }
}
