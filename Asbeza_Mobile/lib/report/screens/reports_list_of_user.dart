import 'package:flutter/material.dart';
import 'package:asbeza_mobile_app/report/models/reports_model.dart';

class UserReportsListScreen extends StatefulWidget {
  const UserReportsListScreen({Key? key}) : super(key: key);

  @override
  _ReportsListScreenState createState() => _ReportsListScreenState();
}

class _ReportsListScreenState extends State<UserReportsListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text('Reports')),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        width: double.infinity,
        child: ListView.builder(
          itemCount: reports.length,
          itemBuilder: (ctx, index) {
            return Container(
              child: ,
            );
          },
        )
      ),
    );
  }
}
