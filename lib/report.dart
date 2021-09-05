import 'package:flutter/material.dart';

class YellowBird extends StatefulWidget {
  const YellowBird({Key? key}) : super(key: key);

  @override
  _ListItem createState() => _ListItem();
}

class _ListItem extends State<YellowBird> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("Report"),
            ),
            body: CustomScrollView(
              primary: false,
              slivers: <Widget>[
                SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverGrid.count(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Card(
                          // shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(15)),
                          // margin: EdgeInsets.only(left: 70, right: 70, top: 20),
                          child: Column(
                            children: [
                              Padding(padding: const EdgeInsets.all(16)),
                              Text(
                                "Name: Onion",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                "Location: Merkato", /*style: Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 5))*/
                              ),
                              Text("Date: --/--/----"),
                              Text("Price: 1birr"),
                              TextButton(
                                  onPressed: () {}, child: Text('Report'))
                            ],
                          ),
                        ),
                        // color: Colors.grey[100],
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Card(
                          // shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(15)),
                          // margin: EdgeInsets.only(left: 70, right: 70, top: 20),
                          child: Column(
                            children: [
                              Padding(padding: const EdgeInsets.all(16)),
                              Text(
                                "Name: Onion",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              Text("Location: Merkato"),
                              Text("Date: --/--/----"),
                              Text("Price: 1birr"),
                              TextButton(
                                  onPressed: () {}, child: Text('Report'))
                            ],
                          ),
                        ),
                        // color: Colors.grey[100],
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Card(
                          // shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(15)),
                          // margin: EdgeInsets.only(left: 70, right: 70, top: 20),
                          child: Column(
                            children: [
                              Padding(padding: const EdgeInsets.all(16)),
                              Text(
                                "Name: Onion",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              Text("Location: Merkato"),
                              Text("Date: --/--/----"),
                              Text("Price: 1birr"),
                              TextButton(
                                  onPressed: () {}, child: Text('Report'))
                            ],
                          ),
                        ),
                        // color: Colors.grey[100],
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Card(
                          // shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(15)),
                          // margin: EdgeInsets.only(left: 70, right: 70, top: 20),
                          child: Column(
                            children: [
                              Padding(padding: const EdgeInsets.all(16)),
                              Text(
                                "Name: Onion",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              Text("Location: Merkato"),
                              Text("Date: --/--/----"),
                              Text("Price: 1birr"),
                              TextButton(
                                  onPressed: () {}, child: Text('Report'))
                            ],
                          ),
                        ),
                        // color: Colors.grey[100],
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Card(
                          // shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(15)),
                          // margin: EdgeInsets.only(left: 70, right: 70, top: 20),
                          child: Column(
                            children: [
                              Padding(padding: const EdgeInsets.all(16)),
                              Text(
                                "Name: Onion",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              Text("Location: Merkato"),
                              Text("Date: --/--/----"),
                              Text("Price: 1birr"),
                              TextButton(
                                  onPressed: () {}, child: Text('Report'))
                            ],
                          ),
                        ),
                        // color: Colors.grey[100],
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        child: Card(
                          // shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(15)),
                          // margin: EdgeInsets.only(left: 70, right: 70, top: 20),
                          child: Column(
                            children: [
                              Padding(padding: const EdgeInsets.all(16)),
                              Text(
                                "Name: Onion",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                              Text("Location: Merkato"),
                              Text("Date: --/--/----"),
                              Text("Price: 1birr"),
                              TextButton(
                                  onPressed: () {}, child: Text('Report'))
                            ],
                          ),
                        ),
                        // color: Colors.grey[100],
                      ),
                    ],
                  ),
                ),
              ],
            )));
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: YellowBird(),
        ),
      ),
    ),
  );
}
