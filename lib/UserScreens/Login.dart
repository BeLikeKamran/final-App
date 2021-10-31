// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formGlobalKey = GlobalKey<FormState>();
  final TextEditingController emailcontroller = TextEditingController();
  // final TextEditingController phonecontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  bool value = false;
  bool showpass = true;

  @override
  Widget build(BuildContext context) {
    //
    // final a = SnackBar(
    //   duration: Duration(seconds: 3),
    //   action: SnackBarAction(
    //     label: "Dismiss",
    //     onPressed: () {},
    //   ),
    //   content: Text("1- Enter Valid Email"),
    // );
    // final b = SnackBar(
    //   duration: Duration(seconds: 3),
    //   action: SnackBarAction(
    //     label: "Dismiss",
    //     onPressed: () {},
    //   ),
    //   content: Text("2- Enter Valid Password"),
    // );
    // final c = SnackBar(
    //   duration: Duration(seconds: 30),
    //   action: SnackBarAction(
    //     label: "Sign Up",
    //     onPressed: () {},
    //   ),
    //   content: Text("3- Not A User? \nCreate New Account!"),
    // );
    //
    // Future<void> login() async {
    //   FirebaseAuth auth = FirebaseAuth.instance;
    //   FirebaseFirestore prson = FirebaseFirestore.instance;
    //   final String email = emailcontroller.text;
    //   final String password = passwordcontroller.text;

    //   try {
    //     final UserCredential user = await auth.signInWithEmailAndPassword(
    //         email: email, password: password);
    //     final DocumentSnapshot snapshot =
    //         await prson.collection("users").doc(user.user.email).get();
    //     // ignore: unused_local_variable
    //     final data = snapshot.data();
    //   } catch (e) {
    //     ScaffoldMessenger.of(context)
    //       ..hideCurrentSnackBar()
    //       ..showSnackBar(a)
    //       ..showSnackBar(b)
    //       ..showSnackBar(c);
    //   }
    // }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
              child: Column(children: [
                Text(
                  "{ Welcome }",
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
                  "Enter Your Email / Phone Number",
                  style: TextStyle(color: Colors.black, fontSize: 15),
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
                                    if (emailcontroller.text.length >= 5)
                                      return null;
                                    else
                                      return 'Enter a valid email';
                                  },
                                  controller: emailcontroller,
                                  scrollPadding: EdgeInsets.all(20),
                                  textAlignVertical:
                                      TextAlignVertical.center,
                                  decoration: InputDecoration(
                                    hintText: 'Email or Phone number',
                                    icon: Icon(
                                      Icons.email,
                                      color: Colors.blueAccent,
                                      size: 25,
                                    ),
                                    hintStyle: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    border: InputBorder.none,
                                  ),
                                ))),
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
                                      suffixIcon: Checkbox(
                                          value: this.value,
                                          onChanged: (bool value) {
                                            setState(() {
                                              this.value = value;
                                              showpass = !value;
                                            });
                                          }),
                                      hintText: 'Password',
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
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blueAccent),
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
                    // await login();
                  },
                  icon: Icon(Icons.login),
                  label: Text(
                    "Login",
                    style: TextStyle(
                        fontSize: 24,
                        fontFamily: "Alice",
                        color: Colors.white),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}