import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Cart Screen',
style: TextStyle(
  fontSize: 40,
  fontWeight: FontWeight.bold,
  color: Colors.cyan
),

      ),
    );
  }
}
