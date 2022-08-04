import 'package:flutter/material.dart';
import 'package:pharmacy/moduels/on_boarding/on_boarding_screen.dart';
import 'package:splash_screen_view/SplashScreenView.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return  SplashScreenView(
      navigateRoute: OnBoardingScreen(),
      duration: 5000,
      imageSize: 130,
      imageSrc: 'assets/images/logo.png',
      text: "صيدلية الشفاء",
      textType: TextType.ColorizeAnimationText,
      textStyle: TextStyle(
        fontSize: 40.0,
      ),
      colors: [
        Colors.purple,
        Colors.blue,
        Colors.yellow,
        Colors.red,
      ],
      backgroundColor: Colors.white,
    );
  }
}