import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/product.dart';
import 'package:pharmacy/shaerd/components/components.dart';
import 'package:provider/provider.dart';

import '../../shaerd/provider/provider.dart';
import '../product_details/product_details.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String txt = '';
  List<String>? search;
  final FocusNode _textFocusNode = FocusNode();
  TextEditingController? _textEditingController = TextEditingController();
  @override
  void dispose() {
    _textFocusNode.dispose();
    _textEditingController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.cyan.shade300,
            bottom: PreferredSize(
              preferredSize: Size(size.width,size.height *0.08),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(20)),
                  child: TextField(
                    controller: _textEditingController,
                    focusNode: _textFocusNode,
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        prefixIcon: Icon(Icons.search),
                        hintText: 'ابحث هنا ... ',
                        contentPadding: EdgeInsets.all(8)),
                    onChanged: (value) {
                      setState(() {
                        txt = value;
                      });
                    },
                  ),
                ),
              ),

            ),
            title:Text('البحث',style: TextStyle(fontSize: 22,color: Colors.white,fontWeight: FontWeight.bold),),
          centerTitle: true,
        ),
        body: product1(context, txt.toString()));
  }
}
