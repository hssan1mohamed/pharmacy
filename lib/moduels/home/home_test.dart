import 'package:carousel_slider/carousel_slider.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pharmacy/shaerd/provider/provider.dart';
import 'package:pharmacy/widgets/product.dart';
import 'package:provider/provider.dart';

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
    Size size =MediaQuery.of(context).size;

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
            child: Grad(),
          ),
        ],
      ),
    );
  }
}

Widget itemName() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.cyan),
            child: Center(
              child: Text(
                'add',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.cyan),
            child: Center(
              child: Text(
                'add',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.cyan),
            child: Center(
              child: Text(
                'add',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.cyan),
            child: Center(
              child: Text(
                'add',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.cyan),
            child: Center(
              child: Text(
                'add',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.cyan),
            child: Center(
              child: Text(
                'add',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.cyan),
            child: Center(
              child: Text(
                'add',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget Grad() {
  return Consumer<MyProvider>(builder: (context, myProvider, child) {
    return GridView.builder(
        physics: ScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 220,
            childAspectRatio: 1.6 / 2,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5),
        itemCount: 8,
        itemBuilder: (BuildContext ctx, index) {
          return Card(
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.cyan)),
            child: Container(
              //   padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: SingleChildScrollView(
                child: Column(

                  children: [
               SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FavoriteButton(
                          valueChanged: (){},
                          iconSize: 45,
                        ),
                        SizedBox(width: 10,)

                      ],
                    ),
                    //  SizedBox(height: 5,),
                    Container(
                      width: 100,
                      height: 80,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT5QiueF_O6Y5HXFJRvxwUstyl3lfEeIImfFw&usqp=CAU'),
                              fit: BoxFit.fill)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: const [
                          Expanded(
                              child: Text(
                                'EGP' '15',
                                style: TextStyle(
                                    color: Colors.red, fontWeight: FontWeight.bold),
                                textDirection: TextDirection.ltr,
                              )),
                          Expanded(
                            flex: 1,
                            child: Text(
                              'hhh',
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
                      onPressed: () async {},
                      child: const Text(
                        'Add to cart',
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.cyan,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.cyan)),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  });
}



