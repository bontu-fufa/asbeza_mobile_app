import 'package:asbeza_mobile_app/auth/data_providers/auth-data-provider.dart';
import 'package:asbeza_mobile_app/auth/models/user_model.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'auth/models/new_user_model.dart';



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => HomePage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
       
            Text("Asbeza Tracking App", style: TextStyle(fontSize: 35, color: Colors.white),)
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final authDataProvider = AuthDataProvider();


  @override
  Widget build(BuildContext context) {
    // authDataProvider.create(NewUser(name: "Jill Doe", email: "jill@gmail.com", password: "jill"))
    // .then((value) {
    //   print(value);
    // });

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Click me"),
          onPressed: () {
            // authDataProvider.create(NewUser(name: "Jill Doe", email: "jill@gmail.com", password: "jill"))
            // .then((value) {
            //   print(value);
            // });

            authDataProvider.fetchByName(User(name: "Jill Doe", password: "jill"))
            .then((value) {
              print(value);
            });
          },
        ),
      ),
    );
  }
}