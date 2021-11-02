import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Drwer extends StatefulWidget {
  const Drwer({
    Key key,
  }) : super(key: key);

  @override
  _DrwerState createState() => _DrwerState();
}

class _DrwerState extends State<Drwer> {
  @override
  Widget build(
    BuildContext context,
  ) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    final user = FirebaseAuth.instance.currentUser;

    if (FirebaseAuth.instance.currentUser == null) {
      return Drawer(
          child: Center(
        child: CircularProgressIndicator(
          semanticsLabel: 'Waiting',
          semanticsValue: 'Wait',
        ),
      ));
    } else
      return Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width - 120,
          child: Drawer(
              child: Column(
            children: [
              FutureBuilder<DocumentSnapshot>(
                future: users
                    .doc(
                      user.email, //colection me email use kia hai uid ki jaga is laiy //
                    )
                    .get(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return UserAccountsDrawerHeader(
                      currentAccountPictureSize: Size.fromRadius(30),
                      currentAccountPicture: CircleAvatar(
                          child: CircleAvatar(
                        radius: 8,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )),
                      accountName: Text(""),
                      accountEmail: Text(""),
                    );
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return UserAccountsDrawerHeader(
                      currentAccountPictureSize: Size.fromRadius(30),
                      currentAccountPicture: CircleAvatar(
                          child: CircleAvatar(
                        radius: 8,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )),
                      accountName: Text(""),
                      accountEmail: Text(""),
                    );
                  }

                  if (snapshot.connectionState == ConnectionState.done) {
                    Map<String, dynamic> data = snapshot.data.data();
                    return UserAccountsDrawerHeader(
                      currentAccountPictureSize: Size.fromRadius(30),
                      // otherAccountsPicturesSize: Size.fromRadius(20),
                      currentAccountPicture: CircleAvatar(
                          backgroundImage: NetworkImage(data["profile"])),
                      // otherAccountsPictures: [
                      //   CircleAvatar(
                      //       backgroundImage: AssetImage("assets/Iron Man.jpg")),
                      //   CircleAvatar(
                      //       backgroundImage: AssetImage("assets/The Hulk.jpg"))
                      // ],

                      accountName: Text(data['username']),
                      accountEmail: Text(data["email"]),
                    );
                  }

                  return Container();
                },
              ),
            ],
          )));
  }
}
