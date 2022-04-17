
 import 'package:flutter/cupertino.dart';
import 'package:pharmacy/home_test.dart';
import 'package:pharmacy/moduels/cart/cart.dart';
import 'package:pharmacy/moduels/favorite/favorite.dart';
import 'package:pharmacy/moduels/home/home.dart';
import 'package:pharmacy/moduels/profile/profile.dart';
import 'package:pharmacy/moduels/search/search.dart';

class MyProvider extends ChangeNotifier{
  List<Widget> _favoriteList =[];
  List <Widget> get favoriteList => _favoriteList;
  void addToList(Widget prodect){
    _favoriteList.add(prodect);
    notifyListeners();
  }
  void removeFav(Widget prodect){
    _favoriteList.remove(prodect);
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
