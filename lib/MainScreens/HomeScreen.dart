import 'package:flutter/material.dart';
import 'package:kamran/MainScreens/Drwer.dart';
import 'package:kamran/Pages/GridListView.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          GridListView(),
        ],
      ),
    );
  }
}
