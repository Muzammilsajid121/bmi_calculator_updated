import 'package:bmi_calculator_updated/UI/splash_screen.dart';
import 'package:flutter/material.dart';
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
            //Text Themes
        //
        textTheme: TextTheme(
            //Body Small
            bodySmall: GoogleFonts.roboto(
                fontSize: 14, color: const Color(0xff39AFEA)),
            //Body Medium
            bodyMedium: GoogleFonts.roboto(
                fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),
            //
            //Body Large
            bodyLarge: GoogleFonts.roboto(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
            //title Medium
            titleMedium: GoogleFonts.montserrat(
                fontSize: 24, color: Colors.black, fontWeight: FontWeight.w700),
            //title Large
            titleLarge: GoogleFonts.montserrat(
                fontSize: 34,
                fontWeight: FontWeight.w700,
                color: const Color(0xff39AFEA))),
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,

      ),

      home: const SplashScreen(),
    );
  }
}

