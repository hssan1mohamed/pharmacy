import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/moduels/sign_in/sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart';

class ProfileScreen extends StatefulWidget {
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("الغاء"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("تسجيل الخروج"),
      onPressed: () async {
        try {
          await FirebaseAuth.instance.signOut();
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.remove("islogin");
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => LoginScreen()));
        } catch (e) {
          print(e);
        }
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(
        "تسحيل الخروج",
        textDirection: TextDirection.rtl,
      ),
      content: Text(
        "هل تريد تسجيل الخروج من البرنامج؟",
        textDirection: TextDirection.rtl,
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(
              color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 25, right: 25),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 10,
                left: 15,
                right: 15,
              ),
              child: Image.asset('assets/images/profile.png'),
            ),
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.center,
              child: const Text(
                'Welcome  \n MR/ Hassan Mohamed',
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
                margin: const EdgeInsets.only(left: 20, right: 20),
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      ListTile(
                        leading: Icon(Icons.person),
                        subtitle: Text('name'),
                        title: Text('Hassan Mohamed',
                            style: TextStyle(color: Colors.cyan, fontSize: 18)),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.location_city),
                        subtitle: Text('address'),
                        title: Text('Qena - Abnod',
                            style: TextStyle(color: Colors.cyan, fontSize: 18)),
                      ),
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.phone),
                        subtitle: Text('phone'),
                        title: Text('01114737152',
                            style: TextStyle(color: Colors.cyan, fontSize: 18)),
                      )
                    ]),
              ),
            ),
            TextButton(
                onPressed: () async {
                  showAlertDialog(context);
                },
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
