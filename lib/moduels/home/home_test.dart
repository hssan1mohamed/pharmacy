import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:pharmacy/moduels/favorite/favorite.dart';
import 'package:pharmacy/moduels/product_details/product_details.dart';
import 'package:pharmacy/moduels/search/search.dart';
import 'package:pharmacy/products.dart';
import 'package:pharmacy/shaerd/provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../catigories/catigories.dart';

class HomeTest extends StatelessWidget {
  const HomeTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    IndexedWidgetBuilder itemBuilder;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'الصيدلية',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.cyan),
          ),
          centerTitle: true),
      body: ListView(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 10,
          ),
          Carousel(),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(15),
            child: const Text(
              "الاقسام",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan),
            ),
          ),
          itemName(),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(15),
            child: const Text(
              "كل المنتجات",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: product1(context, ''),
          ),
        ],
      ),
    );
  }
}

Widget Carousel() {
  Widget container(String url) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
       // color: Colors.grey,
      ),
      child: CachedNetworkImage(
        imageUrl: url,
        fit: BoxFit.fill,
        placeholder: (context, url) =>
            Center(child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }

  return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('images').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData)
          return Center(child: CircularProgressIndicator());
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          default:
            return CarouselSlider.builder(
              itemCount: (snapshot.data! as QuerySnapshot).docs.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                String img =
                    (snapshot.data! as QuerySnapshot).docs[itemIndex]['img'];
                return container(img);
              },

              //Slider Container properties
              options: CarouselOptions(
                height: 180.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            );
        }
      });
}

Widget itemName() {
  return Container(
    height: 50,
    width: 100,
    child: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('categories').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              return ListView.builder(
                padding: EdgeInsets.only(left: 15, right: 15),
                itemCount: (snapshot.data! as QuerySnapshot).docs.length,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (ctx, i) {
                  String title =
                      (snapshot.data! as QuerySnapshot).docs[i]['title'];
                  return Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Catigories(title))),
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.cyan),
                        child: Center(
                          child: Text(
                            title,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
          }
        }),
  );
}
