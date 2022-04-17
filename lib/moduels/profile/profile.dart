import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.only(top: 50, bottom: 15),
                alignment: Alignment.center,
                child: const Text(
                  'Profile',
                  style: TextStyle(
                      color: Colors.cyan,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                )),
            Container(
              padding: const EdgeInsets.only(
                  top: 10, left: 15, right: 15, bottom: 25),
              child: Image.asset('assets/images/profile.png'),
            ),
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: const Text(
                'Welcome \n \n MR/ Hassan Mohamed',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 25,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Card(
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.cyan)),
              child: Container(
                margin: const EdgeInsets.only(left: 25, right: 25),
                padding: const EdgeInsets.only(top: 25, bottom: 25),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('Name : \n\nHassan Mohamed',
                          style: TextStyle(color: Colors.cyan, fontSize: 18)),
                      Divider(),
                      Text('Address : \n \nQena - Abnod',
                          style: TextStyle(color: Colors.cyan, fontSize: 18)),
                    ]),
              ),
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  'Sign Out',
                  style: TextStyle(
                      color: Colors.cyan,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
