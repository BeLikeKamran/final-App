import 'package:flutter/material.dart';
import 'package:kamran/Category/Eletronics/ElectricModel.dart';

class Electronic extends StatefulWidget {
  const Electronic({Key key, this.ele}) : super(key: key);
  final Electric ele;
  @override
  _ElectronicState createState() => _ElectronicState();
}

class _ElectronicState extends State<Electronic> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 200,
                      width: 150,
                      color: Colors.black,
                    ),
                    Container(
                      height: 200,
                      width: 150,
                      color: Colors.black,
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 200,
                      width: 150,
                      color: Colors.black,
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 20,
                            backgroundImage: NetworkImage(widget.ele.imageLink),
                          ),
                          Text(widget.ele.name)
                        ],
                      ),
                    ),
                    Container(
                      height: 200,
                      width: 150,
                      color: Colors.black,
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 200,
                      width: 150,
                      color: Colors.black,
                    ),
                    Container(
                      height: 200,
                      width: 150,
                      color: Colors.black,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      )),
    );
  }
}
