import 'package:app/constants.dart';
import 'package:app/pages/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food App UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: GoogleFonts.roboto(
            fontWeight: FontWeight.w500,
            fontSize: 29,
            color: Colors.white,
            letterSpacing: 0.37,
          ),
          bodyText1: GoogleFonts.roboto(
            fontWeight: FontWeight.w700,
            letterSpacing: 0.37,
            fontSize: 30,
          ),
          bodyText2: GoogleFonts.roboto(
            fontSize: 12,
            color: kTextLightColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      home: const HomePage(),
    );
  }
}
