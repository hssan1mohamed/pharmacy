import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  final List<Map> myProducts =
      List.generate(100000, (index) => {"id": index, "name": "Product $index"})
          .toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 0.6,
              // childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
          itemCount: myProducts.length,
          itemBuilder: (BuildContext ctx, index) {
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
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold),
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
          }),
    );
  }
}
