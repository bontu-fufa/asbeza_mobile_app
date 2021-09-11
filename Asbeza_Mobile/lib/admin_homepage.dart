import 'package:asbeza_mobile_app/item/screens/admin_item_list.dart';
import 'package:asbeza_mobile_app/item/screens/user_item_list.dart';
import 'package:asbeza_mobile_app/report/screens/reports_list_all.dart';
import 'package:flutter/material.dart';

class AdminHomepage extends StatefulWidget {
  static const routeName = '/adminHomepage';
  
  @override
  _AdminHomepageState createState() => _AdminHomepageState();
  // _MyAppState createState() => _MyAppState();
}

class _AdminHomepageState extends State<AdminHomepage> {

  int _currentIndex = 0;
  final tabs = [
    AdminItemList(),
    ReportsListScreen(),
    UserItemList()
  ];

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(centerTitle: true, title: const Text('Track Asbeza')),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Items',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.report),
              label: 'Reports',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Users',
            )
          ],
        ),
        body: tabs[_currentIndex],
      ),
    );
  }
}
