import 'package:flutter/material.dart';
import 'package:asbeza_mobile_app/report/models/reports_model.dart';

//to be deleted
void main() {
  runApp(
    MaterialApp(
      home: UserReportsListScreen(),
    ),
  );
}

class UserReportsListScreen extends StatefulWidget {
  const UserReportsListScreen({Key? key}) : super(key: key);

  @override
  _ReportsListScreenState createState() => _ReportsListScreenState();
}

class _ReportsListScreenState extends State<UserReportsListScreen> {
  @override
  Widget build(BuildContext context) {
    var reports = <Report>[
      Report(
        itemName: 'Row Coffee',
        description:
            "Nullam sit amet diam id tortor sagittis sodales. Praesent laoreet at nisi eget ultrices. Cras id lobortis ipsum. Nullam suscipit magna in elit fermentum, quis pulvinar nisi blandit.",
        date: DateTime.now(),
        location: 'Addis Ababa',
        status: "pending",
        reporter: "Abebe",
        likeCount: 34,
      ),
      Report(
        itemName: 'Row Coffee',
        description:
            "Nullam sit amet diam id tortor sagittis sodales. Praesent laoreet at nisi eget ultrices. Cras id lobortis ipsum. Nullam suscipit magna in elit fermentum, quis pulvinar nisi blandit.",
        date: DateTime.now(),
        location: 'Addis Ababa',
        status: "pending",
        reporter: "Abebe",
        likeCount: 34,
      ),
      Report(
        itemName: 'Row Coffee',
        description:
            "Nullam sit amet diam id tortor sagittis sodales. Praesent laoreet at nisi eget ultrices. Cras id lobortis ipsum. Nullam suscipit magna in elit fermentum, quis pulvinar nisi blandit.",
        date: DateTime.now(),
        location: 'Addis Ababa',
        status: "pending",
        reporter: "Abebe",
        likeCount: 34,
      ),
      Report(
        itemName: 'Row Coffee',
        description:
            "Nullam sit amet diam id tortor sagittis sodales. Praesent laoreet at nisi eget ultrices. Cras id lobortis ipsum. Nullam suscipit magna in elit fermentum, quis pulvinar nisi blandit.",
        date: DateTime.now(),
        location: 'Addis Ababa',
        status: "pending",
        reporter: "Abebe",
        likeCount: 34,
      ),
    ];
    var reportList = _build_report(reports, context);

    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          // leading: BackButton(color: Colors.white),
          centerTitle: true,
          title: const Text('All Reports')),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ...reportList,
            ],
          ),
        ),
      ),
    );
  }
}

_build_report(List<Report> reports, BuildContext context) {
  List<Widget> list = [];
  // to be replaced
  var is_not_selected = false;
  //
  for (var i = 0; i < reports.length; i++) {
    var report = reports[i];
    list.add(Container(
      padding: EdgeInsets.only(top: 5.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 4.0, color: Colors.lightBlue.shade900),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                report.itemName,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Row(
                children: [
                  Text(report.likeCount.toString(),
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.blue[300],
                      )),
                  is_not_selected
                      ? Icon(
                          Icons.arrow_circle_up_rounded,
                          color: Colors.blue[300],
                          size: 16,
                          //if not selected
                        )
                      : Icon(
                          Icons.arrow_circle_up_outlined,
                          color: Colors.green[900],
                          size: 16,
                          //if not selected
                        )
                ],
              )
            ],
          ),
          Text(
            report.date.toString().split(" ")[0],
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            report.description,
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
        ],
      ),
    ));
  }
  return list;
}
