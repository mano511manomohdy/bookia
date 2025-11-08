import 'package:bokkia/core/services/dio_provider.dart';
import 'package:bokkia/core/utils/app_theme.dart';
import 'package:bokkia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bokkia/features/intro/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  DioProvider.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        theme: Apptheme.lightTheme,
        darkTheme: Apptheme.darkTheme,
        home: SplachScreen(),
      ),
    );
  }
}
