import 'package:flutter/material.dart';
import 'package:kamran/MainScreens/Drwer.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Khareedo Online',
            style: TextStyle(
                fontSize: 20, fontFamily: "Alice", fontWeight: FontWeight.bold),
          ),
          toolbarHeight: 35,
          centerTitle: true,
        ),
        drawer: Drwer(),
        body: Container(
          child: Center(
              child: Text(
            "You must login to add orders",
            style: TextStyle(fontSize: 20),
          )),
        ));
  }
}
