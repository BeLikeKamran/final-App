import 'package:flutter/material.dart';
import 'package:kamran/MainScreens/HomeScreen.dart';
import 'package:kamran/MainScreens/CartScreen.dart';
import 'package:kamran/MainScreens/FavoriteScreen.dart';
import 'package:kamran/UserScreens/UserProfile.dart';

class NavigationBar extends StatefulWidget {
  const NavigationBar({Key key}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int pagindex = 0;
  List<Widget> pag = [HomeScreen(), CartScreen(), FvrtScreeen(), Profile()];

  void _onItemTapped(int index) {
    setState(() {
      pagindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pag[pagindex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: pagindex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "Add To Cart"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
        ],
      ),
    );
  }
}
