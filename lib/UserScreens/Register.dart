import 'dart:io';
import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class Register extends StatefulWidget {
  Register({Key key}) : super(key: key);
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final formGlobalKey = GlobalKey<FormState>();
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  // final TextEditingController agecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController passwordconfirm = TextEditingController();
  bool value = false;
  bool showpass = true;
  String imgpath;
  String slctimge = '';
  @override
  Widget build(BuildContext context) {
    //
    final a = SnackBar(
      duration: Duration(seconds: 5),
      action: SnackBarAction(
        label: "Dismiss",
        onPressed: () {},
      ),
      content: Text("1- " +
          emailcontroller.text +
          " is not a valid email \nor it is already exists"),
    );
    final b = SnackBar(
        duration: Duration(seconds: 5),
        action: SnackBarAction(
          label: "Dismiss",
          onPressed: () {},
        ),
        content: Text("2-Something went wrong"));
    final c = SnackBar(
      duration: Duration(seconds: 5),
      action: SnackBarAction(
        label: "Dismiss",
        onPressed: () {},
      ),
      content: Text("3-Maybe your internet connection is unstable"),
    );

    // Future<void> register() async {
    //   FirebaseAuth auth = FirebaseAuth.instance;
    //   FirebaseFirestore prson = FirebaseFirestore.instance;
    //   final String username = namecontroller.text;
    //   final String email = emailcontroller.text;
    //   final String password = passwordcontroller.text;
    //   final String confirmpass = passwordconfirm.text;

    //   try {
    //     final UserCredential user = await auth.createUserWithEmailAndPassword(
    //         email: email, password: password);
    //     // ignore: unused_local_variable
    //     firebase_storage.FirebaseStorage storage =
    //         firebase_storage.FirebaseStorage.instance;
    //     firebase_storage.Reference ref = firebase_storage
    //         .FirebaseStorage.instance
    //         .ref(user.user.email + " " + user.user.uid);
    //     File file = File(imgpath);
    //     await ref.putFile(file);
    //     String url = await ref.getDownloadURL();

    //     if (passwordcontroller.text == passwordconfirm.text) {
    //       prson.collection("users").doc(user.user.email).set({
    //         "username": username,
    //         "email": email,
    //         "password": password,
    //         "profile": url,
    //         "confirm": confirmpass,
    //         "uid": user.user.uid,
    //       });
    //     }
    //   } catch (e) {
    //     ScaffoldMessenger.of(context)
    //       ..hideCurrentSnackBar()
    //       ..showSnackBar(a)
    //       ..showSnackBar(b)
    //       ..showSnackBar(c);
    //   }
    // }

    return Stack(
      children: [
        Image.asset(
          "assets/Mount.jpeg",
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Create Account",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
            ),
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        alignment: Alignment.topLeft,
                        child: Column(
                          children: [
                            Text(
                              "Create An Account",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Alice",
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Enter Your Name,Email/Phone Number \nAnd Password",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () async {
                          // final ImagePicker picker = ImagePicker();
                          // final image = await picker.getImage(
                          //     source: ImageSource.gallery);
                          // setState(() {
                          //   imgpath = image.path;
                          //   slctimge = image.path;
                          // });
                        },
                        child: CircleAvatar(
                            radius: 70,
                            backgroundImage: slctimge != ''
                                ? Image.file(File(slctimge)).image
                                : AssetImage(
                                    'assets/Profile.png',
                                  )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        key: formGlobalKey,
                        child: Container(
                          width: MediaQuery.of(context).size.width - 30,
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Card(
                                  margin: EdgeInsets.only(
                                      left: 2, right: 2, bottom: 8),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  color: Colors.white60,
                                  child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 20),
                                      child: TextFormField(
                                          validator: (name) {
                                            if (namecontroller.text.length >= 5)
                                              return null;
                                            else
                                              return 'Name must be longer than 5 characters';
                                          },
                                          controller: namecontroller,
                                          scrollPadding: EdgeInsets.all(20),
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          decoration: InputDecoration(
                                            icon: Icon(
                                              Icons.person,
                                              color: Colors.blueAccent,
                                              size: 25,
                                            ),
                                            hintText: 'Name',
                                            hintStyle: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                            border: InputBorder.none,
                                          )))),
                              Card(
                                  margin: EdgeInsets.only(
                                      left: 2, right: 2, bottom: 8),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  color: Colors.white60,
                                  child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 20),
                                      child: TextFormField(
                                          validator: (name) {
                                            if (emailcontroller.text.length >=
                                                5)
                                              return null;
                                            else
                                              return 'Enter a valid email';
                                          },
                                          controller: emailcontroller,
                                          scrollPadding: EdgeInsets.all(20),
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          decoration: InputDecoration(
                                            icon: Icon(
                                              Icons.email,
                                              color: Colors.blueAccent,
                                              size: 25,
                                            ),
                                            hintText: 'Email or Phone number',
                                            hintStyle: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                            border: InputBorder.none,
                                          )))),
                              Card(
                                  margin: EdgeInsets.only(
                                      left: 2, right: 2, bottom: 8),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  color: Colors.white60,
                                  child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 20),
                                      child: TextFormField(
                                          validator: (password) {
                                            if (passwordcontroller.text.length <
                                                8)
                                              return 'Password must be longer than 8 characters';
                                            else
                                              return null;
                                          },
                                          controller: passwordcontroller,
                                          scrollPadding: EdgeInsets.all(20),
                                          obscureText: showpass,
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          decoration: InputDecoration(
                                            icon: Icon(
                                              Icons.security,
                                              color: Colors.blueAccent,
                                              size: 25,
                                            ),
                                            hintText: 'Password',
                                            hintStyle: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                            border: InputBorder.none,
                                          )))),
                              Card(
                                  margin: EdgeInsets.only(
                                      left: 2, right: 2, bottom: 8),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  color: Colors.white60,
                                  child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 20),
                                      child: TextFormField(
                                          validator: (password) {
                                            if (passwordcontroller.text ==
                                                passwordconfirm.text)
                                              return null;
                                            else
                                              return 'Password is incorect';
                                          },
                                          controller: passwordconfirm,
                                          scrollPadding: EdgeInsets.all(20),
                                          obscureText: showpass,
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          decoration: InputDecoration(
                                            icon: Icon(
                                              Icons.security,
                                              color: Colors.blueAccent,
                                              size: 25,
                                            ),
                                            suffixIcon: Checkbox(
                                                value: this.value,
                                                onChanged: (bool value) {
                                                  setState(() {
                                                    this.value = value;
                                                    showpass = !value;
                                                  });
                                                }),
                                            hintText: 'Confirm Password',
                                            hintStyle: TextStyle(
                                                fontSize: 12,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                            border: InputBorder.none,
                                          )))),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      OutlinedButton.icon(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.blueAccent),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                        onPressed: () async {
                          if (formGlobalKey.currentState.validate()) {
                            formGlobalKey.currentState.save();
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                "/Home", (route) => false);
                          }
                          // await register();
                        },
                        icon: Icon(Icons.app_registration),
                        label: Text(
                          "Submit",
                          style: TextStyle(
                              fontSize: 24,
                              fontFamily: "Alice",
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "OR",
                        style: TextStyle(
                            color: Colors.grey.shade300,
                            fontSize: 20,
                            fontFamily: "Alice",
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 25,
                            backgroundImage: AssetImage("assets/Google.png"),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: AssetImage("assets/FB.png"),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}