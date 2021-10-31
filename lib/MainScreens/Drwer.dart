import 'package:flutter/material.dart';

class Drwer extends StatefulWidget {
  const Drwer({Key key}) : super(key: key);

  @override
  _DrwerState createState() => _DrwerState();
}

class _DrwerState extends State<Drwer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width - 90,
      color: Colors.white,
      child: Drawer(),
    );
  }
}
