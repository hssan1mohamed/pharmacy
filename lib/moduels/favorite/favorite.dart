import 'package:flutter/material.dart';
import 'package:pharmacy/moduels/home/home_test.dart';

import '../../widgets/product.dart';
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
            'Favorite',
            style: TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        body: isEmpty == true
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          'The list of favorite is empty,\n \nGo to shopping',
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
              )
            : ListView.builder(
                itemCount: 15,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: product(),
                  );
                }));
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
                      onPressed: () async {},
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ))),
              //  SizedBox(height: 5,),
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/drug.png'),
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
}
