import 'package:flutter/material.dart';

//to be deleted
void main() {
  runApp(UserHomepage());
}

class UserHomepage extends StatefulWidget {
  @override
  _UserHomepageState createState() => _UserHomepageState();
  // _MyAppState createState() => _MyAppState();
}

class _UserHomepageState extends State<UserHomepage> {
  static const routeName = '/userHomepage';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text('Track Asbeza')),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Items ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_sharp),
              label: 'My Items ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.report),
              label: 'Reports',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile ',
            ),
          ],
        ),
        body: Container(),
      ),
    );
  }
}
