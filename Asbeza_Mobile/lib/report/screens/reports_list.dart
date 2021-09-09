import 'package:flutter/material.dart';

class ReportsListScreen extends StatefulWidget {
  const ReportsListScreen({Key? key}) : super(key: key);

  @override
  _ReportsListScreenState createState() => _ReportsListScreenState();
}

class _ReportsListScreenState extends State<ReportsListScreen> {
  int itemCount = 20;
  List<bool> selected = [];

  @override
  initState() {
    for (var i = 0; i < itemCount; i++) {
      selected.add(false);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reports"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                // Navigator.pushNamed(
                //   context,
                //   TodoDetail.routeName,
                //   arguments: "Todo $index",
                // );
              },
              child: Container(
                color: Colors.grey[300],
                margin: EdgeInsets.only(bottom: 12.0),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "Report description $index lorem ipsum dolor emet lorem ipsum dolor emet lorem ipsum dolor emet lorem ipsum dolor emet",
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selected[index] = !selected.elementAt(index);
                        });
                      },
                      child: selected.elementAt(index)
                          ? Icon(
                              Icons.check_circle_outline_outlined,
                              color: Colors.green,
                            )
                          : Icon(
                              Icons.done,
                              color: Colors.lightGreen[400],
                            ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
