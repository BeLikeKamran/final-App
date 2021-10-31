import 'package:flutter/material.dart';
import 'package:kamran/MainScreens/Drwer.dart';

class FvrtScreeen extends StatefulWidget {
  const FvrtScreeen({Key key}) : super(key: key);

  @override
  _FvrtScreeenState createState() => _FvrtScreeenState();
}

class _FvrtScreeenState extends State<FvrtScreeen> {
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
            "You must login to add favorite",
            style: TextStyle(fontSize: 20),
          )),
        ));
  }
}
