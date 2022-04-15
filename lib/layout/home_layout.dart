
import 'package:flutter/material.dart';
import 'package:pharmacy/shaerd/provider/provider.dart';
import 'package:provider/provider.dart';
class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MyProvider>(builder: (context,myProvider,child){
      return Scaffold(
        body: myProvider.bootomScreen[myProvider.currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: myProvider.currentIndex,
          onTap: (index){
            myProvider.changeBottom(index);
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite_outline_sharp),label: 'Favorite'),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'Cart'),
            BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Account'),
          ],


        ),

      );
    });
  }
}
