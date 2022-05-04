import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:pharmacy/layout/home_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) async {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) async {
      try {
        var auth = await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: data.name, password: data.password);

        if (auth != null) {
          return null;
        } else {
          return 'User not exists';
        }
      } on FirebaseAuthException catch (error) {
        return error.code;
      }
    });
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) async {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: data.name.toString(),
                password: data.password.toString());

        await FirebaseFirestore.instance
            .collection('users')
            .doc(data.name)
            .set({
          'email': data.name,
          'Password': data.password,
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          return 'The password provided is too weak.';
        } else if (e.code == 'email-already-in-use') {
          return 'The account already exists for that email.';
        } else {
          return e.code;
        }
      }
      // return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      // if (!users.containsKey(name)) {
      //   return 'User not exists';
      // }
      return 'It is not working now';
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Pharmacy',
      logo: AssetImage('assets/images/Favorite.png'),
      onLogin: _authUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool("islogin", true);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => HomeLayout(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    );
  }
}
