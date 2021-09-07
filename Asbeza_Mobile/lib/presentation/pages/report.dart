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
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Description:",
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(70, 10, 50, 10),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 60.0),
                        hintText: 'Describtion',
                      ),
                    ),
                  ),
                  Text("Location:",
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(70, 10, 50, 10),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Location',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(200, 20, 100, 30),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Submit',
                      ),
                      style: ElevatedButton.styleFrom(
                          onPrimary: Colors.white,
                          side: BorderSide(color: Colors.black, width: 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          minimumSize: Size(150, 50),
                          padding: EdgeInsets.only(
                              left: 80, right: 80, top: 15, bottom: 15)),
                    ),
                  )
                ],
              ),
            )

            ));
  }
}));
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
