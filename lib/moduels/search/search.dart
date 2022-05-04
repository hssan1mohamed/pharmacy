

import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/shaerd/components/components.dart';
import 'package:provider/provider.dart';

import '../../shaerd/provider/provider.dart';
import '../product_details/product_details.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Widget> prodect = [product()];

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
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.cyan.shade300,
            title: Container(
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

                    hintText: 'البحث',
                    contentPadding: EdgeInsets.all(8)),
                onChanged: (value) {
                  setState(() {
                    search = prodect
                        .where((element) => element == (value.toLowerCase()))
                        .cast<String>()
                        .toList();
                    if (_textEditingController!.text.isNotEmpty &&
                        search!.length == 0) {
                      print(' prodect Search length ${search!.length}');
                    }
                  });
                },
              ),
            )),
        body: _textEditingController!.text.isNotEmpty && search!.length == 0
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    children: [
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/images/search.png')),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'المنتج غير موجود \nالرجاء اعادة المحاولة مجددا',
                          style: TextStyle(
                              color: Colors.cyan,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : ListView.builder(
                itemCount: _textEditingController!.text.isNotEmpty
                    ? search!.length
                    : prodect.length,
                itemBuilder: (ctx, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: product(),
                  );
                }));
  }
}

Widget product() {
  return Consumer<MyProvider>(builder: (context, myProvider, child)
  {
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
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => product_details()));
            },
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      SizedBox(width: 10,),
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
                                  color: Colors.red, fontWeight: FontWeight.bold),
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
}



