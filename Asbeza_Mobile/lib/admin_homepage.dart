import 'package:flutter/material.dart';

//to be deleted
void main() {
  runApp(AdminHomepage());
}

class AdminHomepage extends StatefulWidget {
  @override
  _AdminHomepageState createState() => _AdminHomepageState();
  // _MyAppState createState() => _MyAppState();
}

class _AdminHomepageState extends State<AdminHomepage> {
  static const routeName = '/adminHomepage';

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
              icon: Icon(Icons.report),
              label: 'Reports',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Users ',
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
