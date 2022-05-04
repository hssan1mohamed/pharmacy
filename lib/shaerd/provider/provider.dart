
 import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy/moduels/cart/cart.dart';
import 'package:pharmacy/moduels/favorite/favorite.dart';
import 'package:pharmacy/moduels/profile/profile.dart';
import 'package:pharmacy/moduels/search/search.dart';

import '../../moduels/home/home_test.dart';

class MyProvider extends ChangeNotifier{
  IconData nameIcon = Icons.favorite_outline;
  bool favIcon = true;
  void ChangeFavIcon(){
    favIcon = !favIcon;
    nameIcon=
        favIcon? Icons.favorite :Icons.favorite_outline;
    notifyListeners();

  }


  int currentIndex = 0;
  List <Widget> bootomScreen =[
    HomeTest(),
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
