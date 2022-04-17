import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/shaerd/provider/provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

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

    Widget container_row(
      String _text,
    ) {
      return Container(
        padding: const EdgeInsets.only(
          right: 15,
          left: 15,
          top: 10,
          bottom: 10,
        ),
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.cyan,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.cyan),
        child: Text(_text, style: TextStyle(color: Colors.white, fontSize: 18)),
      );
    }

    Widget img() {
      return CarouselSlider(
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
      );
    }

    Widget product() {
      return Card(
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: Colors.cyan)),
        child: Container(
          //   padding: EdgeInsets.all(10),
          width: 100,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // SizedBox(height: 5,),
                Container(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                        onPressed: () async {

                        },
                        icon: const Icon(Icons.favorite_outline))),
                //  SizedBox(height: 5,),
                Container(
                  width: 100,
                  height: 100,
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
                        'EGP' + '15',
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
    }

    final List<Map> myProducts = List.generate(
        100000, (index) => {"id": index, "name": "Product $index"}).toList();

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            'Abo El Ezz ',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.cyan),
          ),
          centerTitle: true),
      body: ListView(children: [
        img(),
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              container_row(
                'all',
              ),
              container_row(
                'first',
              ),
              container_row(
                'all',
              ),
              container_row(
                'first',
              ),
              container_row(
                'all',
              ),
              container_row(
                'first',
              ),
              container_row(
                'all',
              ),
              container_row(
                'first',
              )
            ],
          ),
        ),
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
        Container(
          height: height * 0.43,
          width: width * 1,
          padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 0.6,
                  // childAspectRatio: 3 / 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              itemCount: myProducts.length,
              itemBuilder: (BuildContext ctx, index) {
                return product();
              }),
        ),
      ]),
    );
  }
}
