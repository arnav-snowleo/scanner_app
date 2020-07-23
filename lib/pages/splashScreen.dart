import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:scan_me/pages/introScreen.dart';

//splashscreen: ^1.2.0

class Splash extends StatefulWidget {
  static const String id = "Splash";
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SplashScreen(
          seconds: 6,
          gradientBackground: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: <Color>[
                Color(0xff492540),
                Color(0xff4d2743),
                Color(0xff5c2d4f),
                Color(0xff693259),
                Color(0xff5c2d4f),
                Color(0xff4d2743),
                Color(0xff492540),
              ]),
          image: Image.asset('assets/images/DotScanner - Copy.png'),
          photoSize: 150,
          loaderColor: Color(0xFF7C006E),
          navigateAfterSeconds: IntroScreen(),
        ),
      ),
    );
  }
}
