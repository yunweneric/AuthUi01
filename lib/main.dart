import 'package:flutter/material.dart';
import 'package:flutter_openui/screens/splash_screen.dart';
import 'package:flutter_openui/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Francobolli',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.white),
        useMaterial3: true,
        primaryColor: AppColors.primary,
        primaryColorLight: AppColors.white,
        primaryColorDark: AppColors.black,
        scaffoldBackgroundColor: AppColors.white,
        textTheme: TextTheme(
          displayLarge: GoogleFonts.lato(fontSize: 60, fontWeight: FontWeight.w900),
          displayMedium: GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.w900),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
