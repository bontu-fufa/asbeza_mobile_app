import 'package:flutter/material.dart';

class SendReport extends StatefulWidget {
  const SendReport({Key? key}) : super(key: key);

  @override
  _SendReportState createState() => _SendReportState();
}

class _SendReportState extends State<SendReport> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Report"),
            ),
            body: Container()));
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: SendReport(),
        ),
      ),
    ),
  );
}
