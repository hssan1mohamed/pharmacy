import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    bool isEmpty = true;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'عربة التسوق',
            style: TextStyle(
                color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
          ),
        ),
        body: isEmpty == true
            ? ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Image.asset('assets/images/cart.png'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(25),
                    child: Text(
                      'العربة فارغة  \nآذهب للتسوق آلآن ',
                      style: TextStyle(
                          color: Colors.cyan,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              )
            : ListView(
          physics: BouncingScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Card(
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.cyan)),
                            child: Container(
                                padding: EdgeInsets.all(10),
                                //width: 100,
                                // height: 250,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: SingleChildScrollView(
                                  child: ListTile(
                                      trailing: Text(
                                        '15\$',
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 18,
                                        ),
                                      ),
                                      title: Text(
                                        'total :',
                                        style: TextStyle(
                                          color: Colors.cyan,
                                          fontSize: 18,
                                        ),
                                      )),
                                ))),
                        product(),
                        product(),
                        product(),
                      ],
                    ),
                  ),
                ],
              ));
  }
}

Widget product() {
  return Card(
    shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(color: Colors.cyan)),
    child: Container(
      padding: EdgeInsets.all(10),
      //width: 100,
      // height: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SingleChildScrollView(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: const [
                  ListTile(
                      trailing: Icon(Icons.delete, color: Colors.red),
                      title: Text(
                        'Panadol',
                        style: TextStyle(
                          color: Colors.cyan,
                          fontSize: 18,
                        ),
                      )),
                  ListTile(trailing: Text('15\$'), title: Text('price :')),
                  ListTile(trailing: Text('1'), title: Text('quantity')),
                ],
              ),
            ),
            Expanded(flex: 1, child: Image.asset('assets/images/drug.png'))
          ],
        ),
      ),
    ),
  );
}
