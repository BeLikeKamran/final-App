import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kamran/MainScreens/NavigationBar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        // Initialize FlutterFire:

        future: _initialization,
        builder: (context, snapshot) {
          // Check for errors

          if (snapshot.hasError) {
            return Container(
              color: Colors.white,
              child: Center(child: CircularProgressIndicator()),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: Colors.white,
              child: Center(child: CircularProgressIndicator()),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
                theme: ThemeData(
                    primarySwatch: Colors.deepOrange,
                    primaryColor: Colors.deepOrange),
                title: 'Khareedo Online',
                debugShowCheckedModeBanner: false,
                home: NavigationBar());
          }
          return Container(
            color: Colors.white,
            child: Center(child: CircularProgressIndicator()),
          );
        });
  }
}
