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
      appBar: AppBar(
          leading: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(Icons.arrow_back, size: 30, color: Colors.white)),
          centerTitle: true,
          title: Text(
            'التفاصيل ',
            style: const TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
          )),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            padding: EdgeInsets.all(25),
            height: height * 0.3,
            width: double.infinity,
            alignment: Alignment.center,
            child: Hero(tag: 'h', child: Image.asset('assets/images/drug.png')),
          ),
          Container(
            height: height * 0.5998,
            width: double.infinity,
            decoration: BoxDecoration(
              // color: Colors.cyan,
              border: Border.all(color: Colors.cyan),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35), topRight: Radius.circular(35)),
            ),
            alignment: Alignment.topRight,
            child: SingleChildScrollView(
              padding: EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ListTile(
                    trailing: Text(
                      'اسبرين ',
                      style: const TextStyle(
                          color: Colors.cyan,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    title: Text(
                      '15 \$ ',
                      style: const TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    trailing: Text(
                      'السعر ',
                      style: const TextStyle(
                          color: Colors.cyan,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(),
                  RaisedButton(
                    color: Colors.white,
                    shape: Border(),
                    onPressed: () {},
                    child: Text(
                      'اضف الى العربة ',
                      style: const TextStyle(
                          color: Colors.cyan,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    trailing: Text(
                      'التفاصيل ',
                      style: const TextStyle(
                          color: Colors.cyan,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Divider(),
                  Text(
                      'لارترترترتؤاءالؤالمنتمنتمن\n رلرتارارلاؤلا\n الؤءابيالر ىلارءلبؤاللاي\n',
                      style: TextStyle(color: Colors.cyan, fontSize: 18)),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
