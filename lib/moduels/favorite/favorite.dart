import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pharmacy/moduels/home/home_test.dart';
import 'package:provider/provider.dart';

import '../../shaerd/provider/provider.dart';
import '../product_details/product_details.dart';
import '../search/search.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool isEmpty = true;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'المفضلة',
          style: TextStyle(
              color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
        ),
      ),
      body: product("hassan123@ayhoo.com+f"),
    );
  }

  Widget product(String text) {
    return Consumer<MyProvider>(builder: (context, myProvider, child) {
      return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('products')
            .where(FirebaseAuth.instance.currentUser!.uid + '+f',
                isEqualTo: "1")
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if ((snapshot.data! as QuerySnapshot).docs.length == 0) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(18.0),
                          child: Text(
                            'قائمة المفضلة فارغة\n آذهب للتسوق الآن',
                            style: TextStyle(
                                color: Colors.cyan,
                                fontSize: 25,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(height: 100),
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset('assets/images/Favorite.png')),
                      ],
                    ),
                  ),
                );
              }
              return GridView.builder(
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.all(15),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 220,
                      childAspectRatio: 1.5 / 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5),
                  itemCount: (snapshot.data! as QuerySnapshot).docs.length,
                  itemBuilder: (ctx, i) {
                    String img =
                        (snapshot.data! as QuerySnapshot).docs[i]['image'];
                    String title =
                        (snapshot.data! as QuerySnapshot).docs[i]['title'];
                    String price =
                        (snapshot.data! as QuerySnapshot).docs[i]['price'];
                    String details =
                        (snapshot.data! as QuerySnapshot).docs[i]['details'];
                    String productID =
                        (snapshot.data! as QuerySnapshot).docs[i].id;
                    return Card(
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.cyan)),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SingleChildScrollView(
                          child: InkWell(
                            onTap: () async {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => product_details(
                                        title,
                                        details,
                                        img,
                                        price,productID
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
                                     IconButton(onPressed: (){
                                       FirebaseFirestore.instance
                                           .collection('products')
                                           .doc((snapshot.data!
                                       as QuerySnapshot)
                                           .docs[i]
                                           .id)
                                           .update({
                                         FirebaseAuth
                                             .instance.currentUser!.uid +
                                             '+f': FieldValue.delete(),
                                       }).then((value) => Fluttertoast.showToast(
                                           msg: 'تمت الحذف من المفضلة'));
                                     },
                                         icon: Icon(
                                           Icons.delete_forever,
                                           color: Colors.red,
                                         )),
                                      SizedBox(
                                        width: 10,
                                      )
                                    ],
                                  ),
                                  //  SizedBox(height: 5,),

                                  CachedNetworkImage(
                                    width: 100,
                                    height: 80,
                                    imageUrl: img,
                                    placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Text(
                                          price.toString() + ' جنية ',
                                          maxLines: 2,
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
                      ),
                    );
                  });
          }
        },
      );
    });
  }
}
