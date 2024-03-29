import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class product_details extends StatefulWidget {
  String img;
  String productID;
  String title;
  String details;
  String price;
  product_details(
      this.title,
      this.details,
      this.img,
      this.price,
      this.productID
      );
  //product_details({Key? key}) : super(key: key);

  @override
  State<product_details> createState() => _product_detailsState();
}

class _product_detailsState extends State<product_details> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.arrow_back, size: 30, color: Colors.white)),
          centerTitle: true,
          title: Text(
            widget.title,
            style: const TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
          )),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Container(
            padding: EdgeInsets.all(25),
            height: height * 0.4,
            width: double.infinity,
            alignment: Alignment.center,
            child: Hero(tag: 'h', child: CachedNetworkImage(
              imageUrl: widget.img,
              placeholder: (context, url) => Center(
                  child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>
                  Icon(Icons.error),
            ),),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: height * 0.4798,
              width: double.infinity,
              decoration: BoxDecoration(
                // color: Colors.cyan,
                  border: Border.all(color: Colors.cyan),
                  borderRadius: BorderRadius.circular(20)),
              alignment: Alignment.topLeft,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        widget.title,
                        style: const TextStyle(
                            color: Colors.cyan,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Divider(),
                    ListTile(
                      title: Text(
                        'السعر /  ',
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                            color: Colors.cyan,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        widget.price + ' جنية ',
                        style: const TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Divider(),
                    ListTile(
                      title: Text(
                        'التفاصيل /',
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                            color: Colors.cyan,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Divider(),
                    Text(widget.details,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(color: Colors.cyan, fontSize: 18)),
                    Divider(),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () async {
                          FirebaseFirestore.instance
                              .collection('products')
                              .doc(widget.productID)
                              .update({
                            FirebaseAuth.instance.currentUser!.uid +
                                '+c': "1",
                          });
                          Fluttertoast.showToast(
                              msg: 'تمت الاضافة للعربة');
                        },
                        child: const Text(
                          'اضافة الي العربة',
                          style: TextStyle(color: Colors.white),
                        ),

                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          )
        ]),
      ),
    );
  }
}
