import 'package:cart_stepper/cart_stepper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../moduels/product_details/product_details.dart';
import '../provider/provider.dart';


class Add_remove extends StatefulWidget {
  String productId;
   Add_remove(this.productId) ;

  @override
  State<Add_remove> createState() => _Add_removeState();
}

class _Add_removeState extends State<Add_remove> {
  int _counter =1;

  @override
  Widget build(BuildContext context) {
    return CartStepperInt(
      axis:Axis.horizontal ,
      elevation: 3,
      radius: Radius.circular(5),
      count: _counter,
      size: 30,
      activeBackgroundColor: Colors.white,

      didChangeCount: (count) {
        if (count < 1) {
         FirebaseFirestore.instance.collection('products').doc(widget.productId).update({
           FirebaseAuth.instance.currentUser!.uid+"+c":FieldValue.delete()

         }) ;

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('تم الحذف من العربة'),
            backgroundColor: Colors.orangeAccent,
          ));
          return;
        }
        setState(() {
          _counter = count;
        });
      },
    );
  }
}





