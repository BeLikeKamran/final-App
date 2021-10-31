import 'package:flutter/material.dart';
import 'package:kamran/MainScreens/NavigationBar.dart';
import 'package:kamran/UserScreens/Login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final formGlobalKey = GlobalKey<FormState>();

  bool login = false;
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    final user = FirebaseAuth.instance.currentUser;

    if (FirebaseAuth.instance.currentUser == null) {
      return Scaffold(
          appBar: AppBar(
        toolbarHeight: 100,
        title: InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (builder) => Login()));
          },
          borderRadius: BorderRadius.circular(25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white54,
                  child: Icon(
                    Icons.person_add,
                    size: 35,
                    color: Colors.black,
                  )),
              SizedBox(
                width: 10,
              ),
              Text(
                "Tap to login  ",
                style: TextStyle(fontSize: 15),
              )
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(bottom: 45),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.settings_outlined),
            ),
          )
        ],
        bottom: AppBar(
          elevation: 0.0,
          titleTextStyle: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                children: [Text("2"), Text("Pending")],
              ),
              Column(
                children: [Text("14"), Text("Received")],
              )
            ],
          ),
        ),
      ));
    } else
      return SafeArea(
          child: FutureBuilder<DocumentSnapshot>(
              future: users
                  .doc(
                    user.email,
                  )
                  .get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Container();
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Scaffold(
                    body: Container(
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(
                              strokeWidth: 4,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Waiting",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            )
                          ],
                        )),
                  );
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data = snapshot.data.data();
                  return Scaffold(
                      appBar: AppBar(
                        toolbarHeight: 100,
                        title: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (builder) => Login()));
                          },
                          borderRadius: BorderRadius.circular(25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundImage: NetworkImage(
                                  data["profile"],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  Text(
                                    data["username"],
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    data["email"],
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                              OutlinedButton.icon(
                                  style: ButtonStyle(
                                    fixedSize: MaterialStateProperty.all<Size>(
                                        Size.fromRadius(10)),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.blueAccent),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                    ),
                                  ),
                                  onPressed: () async {
                                    await FirebaseAuth.instance.signOut();
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (builder) =>
                                                NavigationBar()),
                                        (route) => false);
                                  },
                                  icon: Icon(Icons.logout),
                                  label: Text("Sign Out"))
                            ],
                          ),
                        ),
                        actions: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 45),
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.settings_outlined),
                            ),
                          )
                        ],
                        bottom: AppBar(
                          elevation: 0.0,
                          titleTextStyle: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w400),
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                children: [Text("2"), Text("Pending")],
                              ),
                              Column(
                                children: [Text("14"), Text("Received")],
                              )
                            ],
                          ),
                        ),
                      ),
                      body: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('My Orders',
                                  style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 15)),
                              SizedBox(
                                width: 50,
                              ),
                              Text("View All >",
                                  style: TextStyle(
                                      color: Colors.purple, fontSize: 15))
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                children: [
                                  Icon(
                                    Icons.credit_card_outlined,
                                    size: 35,
                                    color: Colors.black54,
                                  ),
                                  Text('To Pay')
                                ],
                              ),
                              Column(
                                children: [
                                  Icon(
                                    Icons.shopping_cart_outlined,
                                    size: 35,
                                    color: Colors.black54,
                                  ),
                                  Text('To Ship')
                                ],
                              ),
                              Column(
                                children: [
                                  Icon(
                                    Icons.local_shipping_outlined,
                                    size: 35,
                                    color: Colors.black54,
                                  ),
                                  Text('To Recieve')
                                ],
                              ),
                              Column(
                                children: [
                                  Icon(
                                    Icons.rate_review_sharp,
                                    size: 35,
                                    color: Colors.black54,
                                  ),
                                  Text('To Review')
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Card(
                                  color: Colors.amber,
                                  elevation: 10,
                                  child: Row(
                                    children: [
                                      Icon(Icons.keyboard_return),
                                      Text(
                                        '  My Returns ',
                                        style: TextStyle(fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                                Card(
                                  elevation: 10,
                                  color: Colors.pinkAccent,
                                  child: Row(
                                    children: [
                                      Icon(Icons.cancel),
                                      Text(
                                        '  My Cancellations ',
                                        style: TextStyle(
                                            fontSize: 15, color: Colors.white),
                                      )
                                    ],
                                  ),
                                )
                              ])
                        ],
                      ));
                }
                return Container();
              }));
  }
}
