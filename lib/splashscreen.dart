import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:uts_pm2_silvianurb/home.dart';
import 'package:lottie/lottie.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Lottie.asset(
        'assets/Animation_splash.json',
        height: 250,
        width: 250,
      ),
      nextScreen: const MyHomePage(title: 'Flutter Demo Home Page'),
      splashIconSize: 250,
      duration: 6000,
    );
  }
}
