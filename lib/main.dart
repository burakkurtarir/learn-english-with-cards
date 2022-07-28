import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_english_with_cards/feature/cards/view/cards_view.dart';
import 'package:learn_english_with_cards/feature/splash/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn English',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.robotoCondensed().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashView(),
    );
  }
}
