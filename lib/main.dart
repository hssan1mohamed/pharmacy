import 'package:flutter/material.dart';
import 'package:pharmacy/moduels/home_test.dart';
import 'package:pharmacy/moduels/home/home.dart';
import 'package:pharmacy/moduels/on_boarding/on_boarding_screen.dart';
import 'package:pharmacy/moduels/profile/profile.dart';
import 'package:pharmacy/shaerd/provider/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider
      (create: (context)=>MyProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'pharmacy',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        home: const OnBoardingScreen(),
      ),
    );
  }
}
