import 'package:flutter/material.dart';
import 'package:learn_english_with_cards/feature/cards/view/cards_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 2), () {
      print('i am splash');
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const CardsView()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: Image.asset("assets/images/splash.png")),
    );
  }
}
