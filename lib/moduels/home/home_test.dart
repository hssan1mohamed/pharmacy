import 'package:carousel_slider/carousel_slider.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pharmacy/moduels/product_details/product_details.dart';
import 'package:pharmacy/shaerd/provider/provider.dart';
import 'package:pharmacy/widgets/product.dart';
import 'package:provider/provider.dart';

import '../../shaerd/components/components.dart';

class HomeTest extends StatelessWidget {
  const HomeTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List imgs = [
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcP_KqqYxJF7MBsD6j5svjS84mOdPgSrRJjg&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBiLksanWFFnR0bvwAPwPIgt2v0McmsUgiYg&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVqUvJVBXyvjMRAEQe60Xj9357mZd-DKFBrw&usqp=CAU',
    ];

    Widget container(String url) {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.all(2.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          image: DecorationImage(
            image: NetworkImage(url),
            fit: BoxFit.fill,
          ),
        ),
      );
    }

    IndexedWidgetBuilder itemBuilder;
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Pharmacy',
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
          CarouselSlider(
            items: [
              container(imgs[0]),
              container(imgs[1]),
              container(imgs[2]),
            ],
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
          ),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(15),
            child: const Text(
              "Catigores",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan),
            ),
          ),
          itemName(),
          Container(
            alignment: Alignment.centerLeft,
            padding: const EdgeInsets.all(15),
            child: const Text(
              "all product",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: prodectWidget(),
          ),
        ],
      ),
    );
  }
}

Widget itemName() {
  Widget cont() {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.cyan),
      child: Center(
        child: Text(
          'add',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          cont(),
          SizedBox(
            width: 10,
          ),
          cont(),
          SizedBox(
            width: 10,
          ),
          cont(),
          SizedBox(
            width: 10,
          ),
          cont(),
          SizedBox(
            width: 10,
          ),
          cont(),
          SizedBox(
            width: 10,
          ),
          cont(),
          SizedBox(
            width: 10,
          ),
          cont(),
        ],
      ),
    ),
  );
}

