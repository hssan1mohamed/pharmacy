import 'package:flutter/material.dart';

class product_details extends StatefulWidget {
  const product_details({Key? key}) : super(key: key);

  @override
  State<product_details> createState() => _product_detailsState();
}

class _product_detailsState extends State<product_details> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(children: [
        Container(
          height: height * 0.5,
          width: double.infinity,
        ),
        Container(
          height: height * 0.5,
          width: double.infinity,
        ),
      ]),
    );
  }
}
