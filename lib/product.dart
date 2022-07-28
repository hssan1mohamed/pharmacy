import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pharmacy/shaerd/provider/provider.dart';
import 'package:provider/provider.dart';

import 'moduels/product_details/product_details.dart';
Widget product1(
  BuildContext context,
  String text,

) {
  return Consumer<MyProvider>(builder: (context, myProvider, child) {

    return StreamBuilder(

      stream: FirebaseFirestore.instance
          .collection('products')
          .where('title', isGreaterThanOrEqualTo: text.toString())
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          default:
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 220,
                      childAspectRatio: 1.5 / 2.2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  itemCount: (snapshot.data! as QuerySnapshot).docs.length,
                  itemBuilder: (ctx, i) {
                    String img = (snapshot.data! as QuerySnapshot)
                        .docs[i]['image']
                        .toString();
                    String title = (snapshot.data! as QuerySnapshot)
                        .docs[i]['title']
                        .toString();
                    String price = (snapshot.data! as QuerySnapshot)
                        .docs[i]['price']
                        .toString();
                    String details = (snapshot.data! as QuerySnapshot)
                        .docs[i]['details']
                        .toString();
                    return Card(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.cyan)),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: () async {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => product_details(
                                      title,
                                      details,
                                      img,
                                      price,
                                    )));
                          },
                          child: Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),

                                    FavoriteButton(

                                      isFavorite:(snapshot.data! as QuerySnapshot)
                                          .docs.contains(FirebaseAuth.instance.currentUser!.uid+"f")
                                          ? true:false,
                                      valueChanged: (x) {
                                        FirebaseFirestore.instance
                                            .collection('products')
                                            .doc((snapshot.data!
                                                    as QuerySnapshot)
                                                .docs[i]
                                                .id)
                                            .update({
                                          FirebaseAuth
                                                  .instance.currentUser!.uid +
                                              '+f': "1",
                                        });
                                        Fluttertoast.showToast(
                                            msg: 'تمت الاضافة للمفضلة');
                                      },
                                      iconSize: 45,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    )
                                  ],
                                ),
                                //  SizedBox(height: 5,),

                                Container(
                                  width: 100,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(img.toString()),
                                          fit: BoxFit.fill)),
                                ),

                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                        price.toString() + ' جنية ',
                                        maxLines: 1,
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                        textDirection: TextDirection.ltr,
                                      )),
                                      Spacer(),
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          title.toString(),
                                          textDirection: TextDirection.rtl,
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Divider(
                                  color: Color(0xFF13b1fb),
                                ),
                                RaisedButton(
                                  onPressed: () async {
                                    FirebaseFirestore.instance
                                        .collection('products')
                                        .doc((snapshot.data! as QuerySnapshot)
                                            .docs[i]
                                            .id)
                                        .update({
                                      FirebaseAuth.instance.currentUser!.uid +
                                          '+c': "1",
                                    });
                                    Fluttertoast.showToast(
                                        msg: 'تمت الاضافة للعربة');
                                  },
                                  child: const Text(
                                    'اضف الى العربة',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  color: Colors.cyan,
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide:
                                          BorderSide(color: Colors.cyan)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            );
        }
      },
    );
  });
}
