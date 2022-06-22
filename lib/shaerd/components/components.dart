import 'package:cart_stepper/cart_stepper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../moduels/product_details/product_details.dart';
import '../provider/provider.dart';

Widget prodectWidget() =>
    Consumer<MyProvider>(builder: (context, myProvider, child) {
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
                  child: InkWell(
                    onTap: () async {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => product_details()));
                    },
                    child: Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              FavoriteButton(
                                valueChanged: (x) {
                                  null;
                                },
                                iconSize: 45,
                              ),
                              SizedBox(
                                width: 10,
                              )
                            ],
                          ),
                          //  SizedBox(height: 5,),

                          Container(
                            width: 100,
                            height: 80,
                            decoration: BoxDecoration(
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
                                  '15 \n جنية',
                                  maxLines: 2,
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                  textDirection: TextDirection.ltr,
                                )),
                                Spacer(),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    'اسبرين',
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
                              'اضف الى العربة',
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
                ),
              ),
            );
          });
    });


class Add_remove extends StatefulWidget {
  const Add_remove({Key? key}) : super(key: key);

  @override
  State<Add_remove> createState() => _Add_removeState();
}

class _Add_removeState extends State<Add_remove> {
  int _counter =1;

  @override
  Widget build(BuildContext context) {
    return CartStepperInt(

      axis:Axis.horizontal ,
      elevation: 3,
      radius: Radius.circular(5),

      count: _counter,
      size: 30,
      activeBackgroundColor: Colors.white,
      didChangeCount: (count){
        setState(() {
          _counter=count;
        });
      }

    );
  }
}





