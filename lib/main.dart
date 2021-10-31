import 'package:flutter/material.dart';
import 'package:kamran/MainScreens/NavigationBar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            primarySwatch: Colors.deepOrange, primaryColor: Colors.deepOrange),
        title: 'Khareedo Online',
        debugShowCheckedModeBanner: false,
        home: NavigationBar());
  }
}
