
import 'dart:developer';

import 'package:cart_stepper/cart_stepper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/shaerd/components/components.dart';
import 'package:provider/provider.dart';

import '../../shaerd/provider/provider.dart';
import '../product_details/product_details.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);



  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _counter  = 1;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool isEmpty = true;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'عربة التسوق',
          style: TextStyle(
              color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),

          child: product()),
    );
  }
}

Widget product() {
  return Consumer<MyProvider>(builder: (context, myProvider, child) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('products')
            .where(FirebaseAuth.instance.currentUser!.uid + '+c',
                isEqualTo: "1")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData)
            return const Center(child: CircularProgressIndicator());
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if ((snapshot.data! as QuerySnapshot).docs.isEmpty) {
                return Center(
                  child: ListView(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    children: [
                      Padding(
                        padding: EdgeInsets.all(15),
                        child: Image.asset('assets/images/cart.png'),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(25),
                        child: Text(
                          'العربة فارغة  \nآذهب للتسوق آلآن ',
                          style: TextStyle(
                              color: Colors.cyan,
                              fontSize: 25,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [

                    SizedBox(height: 10,),
                    ListView.builder(
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.all(0),
                      itemCount: (snapshot.data! as QuerySnapshot).docs.length,
                      itemBuilder: (ctx, i) {
                        String img =
                            (snapshot.data! as QuerySnapshot).docs[i]['image'];
                        String title =
                            (snapshot.data! as QuerySnapshot).docs[i]['title'];
                        String price =
                            (snapshot.data! as QuerySnapshot).docs[i]['price'];
                        String details = (snapshot.data! as QuerySnapshot)
                            .docs[i]['details'];
                        return Card(
                          child: Container(
                            height: 100,
                            //padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              //color: Colors.grey[400],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(width: 10,),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: [
                                      SizedBox(height: 15,),

                                      Row(

                                        children: [
                                          Text(
                                            title,
                                            style: TextStyle(
                                              color: Colors.cyan,
                                              fontSize: 18,
                                            ),
                                          ),
                                          Spacer(),
                                          Add_remove(),
                                        ],
                                      ),
                                      SizedBox(height: 5,),
                                      Row(
                                        children: [
                                          Text('السعر :'),
                                          Spacer(),
                                          Text(
                                              price.toString() + ' جنية '),
                                        ],

                                      ),
                                      SizedBox(height: 5,),
                                      Row(
                                        children: [
                                          Text('الكمية'),
                                          Spacer(),
                                          Text('1'),
                                        ],
                                      ),
                                      SizedBox(height: 5,),

                                    ],
                                  ),
                                ),
                                Spacer(),
                                Container(
                                    height: 50,
                                    child: Image.network(img)),
                                SizedBox(width: 10,)
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 10,),
                    Card(

                        semanticContainer: true,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.cyan)),
                        child: Container(

                            padding: EdgeInsets.all(10),
                            //width: 100,
                            // height: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const SingleChildScrollView(
                              child: ListTile(
                                  trailing: Text(
                                    '15' + ' جنية ',
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 18,
                                    ),
                                  ),
                                  title: Text(
                                    'الاجمالى :',
                                    style: TextStyle(
                                      color: Colors.cyan,
                                      fontSize: 18,
                                    ),
                                  )),
                            ))),
                    SizedBox(height: 10,),

                    Card(
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.cyan)),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: const Text(
                            'تاكيد الطلب',
                            style: TextStyle(
                              color: Colors.cyan,
                              fontSize: 18,
                            ),
                          ),
                        )),
                  ],
                ),
              );
          }
        });
  });
}
