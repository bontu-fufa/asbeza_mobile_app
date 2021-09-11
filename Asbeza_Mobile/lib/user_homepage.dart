import 'package:asbeza_mobile_app/app_route.dart';
import 'package:asbeza_mobile_app/auth/screens/profile.dart';
import 'package:asbeza_mobile_app/item/screens/items_list.dart';
import 'package:asbeza_mobile_app/report/screens/reports_list_of_user.dart';
import 'package:asbeza_mobile_app/todo/screens/goods_list.dart';
import 'package:flutter/material.dart';

class UserHomepage extends StatefulWidget {
  static const routeName = '/userHomepage';
  final int ind;

  UserHomepage({required this.ind});

  @override
  _UserHomepageState createState() => _UserHomepageState();
  // _MyAppState createState() => _MyAppState();
}

class _UserHomepageState extends State<UserHomepage> {
  late int _currentIndex;
  final tabs = [
    ItemList(),
    PurchaseGoods(),
    UserReportsListScreen(),
    ProfileApp()
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.ind;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: AsbezaAppRoute.generateRoute,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(centerTitle: true, title: const Text('Track Asbeza')),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: Color(0Xff393E46),
          selectedIconTheme: IconThemeData(size: 28),
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Items',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list_sharp),
              label: 'Purchases',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.report),
              label: 'Reports',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
        body: tabs[_currentIndex],
      ),
    );
  }
}
