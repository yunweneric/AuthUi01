import 'package:flutter/material.dart';
import 'package:flutter_openui/screens/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        textTheme: TextTheme(
          displayMedium: GoogleFonts.lato(fontSize: 28, fontWeight: FontWeight.w800),
          bodyMedium: GoogleFonts.lato(fontSize: 16),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
