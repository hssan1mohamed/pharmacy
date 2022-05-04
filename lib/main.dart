import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/moduels/home/home.dart';
import 'package:pharmacy/moduels/on_boarding/on_boarding_screen.dart';
import 'package:pharmacy/moduels/profile/profile.dart';
import 'package:pharmacy/moduels/sign_in/sign_in.dart';
import 'package:pharmacy/shaerd/provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'layout/home_layout.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? islogin = prefs.getBool("islogin");

  runApp(islogin == null || false ? const MyApp() : const MyApp1());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyProvider(),
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

class MyApp1 extends StatelessWidget {
  const MyApp1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'pharmacy',
        theme: ThemeData(
          primarySwatch: Colors.cyan,
        ),
        home: const HomeLayout(),
      ),
    );
  }
}
