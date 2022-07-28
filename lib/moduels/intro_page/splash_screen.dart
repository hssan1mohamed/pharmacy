import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';



class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: PlayAnimation<double>(
          tween: Tween<double>(begin: size.height *0.02,end: size.height*0.3),
          duration: Duration(seconds: 3),
          curve: Curves.easeInOut,
          builder: (context,child,value){
            return Container(
              width: value,
              height: value,
              child: child,
            );
        },
          child: Image.asset('assets/images/img1.jpg'),

        ),
      ),
    );
  }
}
