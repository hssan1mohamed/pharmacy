import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Widget> prodect =[product()];

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
                decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: 'Search here',
                    contentPadding: EdgeInsets.all(8)),
                onChanged: (value) {
                  setState(() {
                    search = prodect
                        .where(
                            (element) => element==(value.toLowerCase())).cast<String>()
                        .toList();
                    if (_textEditingController!.text.isNotEmpty &&
                        search!.length == 0) {
                      print(' prodect Search length ${search!.length}');
                    }
                  });
                },
              ),
            )),
        body: _textEditingController!.text.isNotEmpty &&
            search!.length == 0
            ? Center(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.search_off,
                    size: 160,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'No results found,\nPlease try different keyword',
                    style: TextStyle(
                        fontSize: 30, fontWeight: FontWeight.w600),
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