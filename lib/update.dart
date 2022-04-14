import 'package:flutter/material.dart';
class Update extends StatelessWidget {
  const Update({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Update',style: TextStyle(
        fontWeight: FontWeight.w900,
        color: Colors.deepPurple
      ),),
    );
  }
}
