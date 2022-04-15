
 import 'package:flutter/cupertino.dart';
import 'package:pharmacy/moduels/cart/cart.dart';
import 'package:pharmacy/moduels/favorite/favorite.dart';
import 'package:pharmacy/moduels/home/home.dart';
import 'package:pharmacy/moduels/profile/profile.dart';
import 'package:pharmacy/moduels/search/search.dart';

class MyProvider extends ChangeNotifier{
  int currentIndex = 0;
  List <Widget> bootomScreen =[
   HomeScreen(),
    FavoriteScreen(),
    CartScreen(),
    SearchScreen(),
    ProfileScreen(),

  ];
  void changeBottom(int index){
    currentIndex =index;
    notifyListeners();
  }
}