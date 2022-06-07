import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../shaerd/provider/provider.dart';
import '../product_details/product_details.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
      body: SingleChildScrollView(child: product()),
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
            return Center(child: CircularProgressIndicator());
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
                      Padding(
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
                    Card(
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
                            child: SingleChildScrollView(
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
                    ListView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.all(15),
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
                            child: SingleChildScrollView(
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      children: [
                                        ListTile(
                                            trailing: Icon(Icons.delete,
                                                color: Colors.red),
                                            title: Text(
                                              title,
                                              style: TextStyle(
                                                color: Colors.cyan,
                                                fontSize: 18,
                                              ),
                                            )),
                                        ListTile(
                                            trailing: Text(
                                                price.toString() + ' جنية '),
                                            title: Text('السعر :')),
                                        ListTile(
                                            trailing: Text('1'),
                                            title: Text('الكمية')),
                                      ],
                                    ),
                                  ),
                                  Expanded(flex: 1, child: Image.network(img))
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    Card(
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.cyan)),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text(
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
