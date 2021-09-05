import 'package:flutter/material.dart';

class ItemList extends StatefulWidget {
  const ItemList({Key? key}) : super(key: key);

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Items List"),
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                margin: EdgeInsets.only(left: 70, right: 70, top: 20),
                child: Column(
                  children: [
                    Padding(padding: const EdgeInsets.all(16)),
                    Text(
                      "Item List1",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),

              // color: Colors.grey[100],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                margin: EdgeInsets.only(left: 70, right: 70, top: 20),
                child: Column(
                  children: [
                    Padding(padding: const EdgeInsets.all(16)),
                    Text(
                      "Item List2",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),

              // color: Colors.grey[100],
            ),
            Container(
                padding: const EdgeInsets.all(8),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  margin: EdgeInsets.only(left: 70, right: 70, top: 20),
                  child: Column(
                    children: [
                      Padding(padding: const EdgeInsets.all(16)),
                      Text(
                        "Item List3",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                )),
            Container(
              padding: const EdgeInsets.all(8),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                margin: EdgeInsets.only(left: 70, right: 70, top: 20),
                child: Column(
                  children: [
                    Padding(padding: const EdgeInsets.all(16)),
                    Text(
                      "Item List4",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),

              // Container(
              //   padding: const EdgeInsets.all(8),
              //   child: Card(
              //     shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(15)),
              //     margin: EdgeInsets.only(left: 70, right: 70, top: 20),
              //     child: Column(
              //       children: [
              //         Padding(padding: const EdgeInsets.all(16)),
              //         Text(
              //           "Item List5",
              //           style: TextStyle(
              //             color: Colors.black,
              //             fontSize: 25,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),

              //   // color: Colors.grey[100],
              // ),
              // Container(
              //   padding: const EdgeInsets.all(8),
              //   child: Column(
              //     children: [
              //       Image.asset(
              //         'assets/images/shinkurt.jpg',
              //         height: 150,
              //         width: double.infinity,
              //       ),
              //       TextButton(
              //         onPressed: () {},
              //         child: Text('Karot'),
              //       ),
              //     ],
              //   ),
              //   // color: Colors.grey[100],
              // ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                margin: EdgeInsets.only(left: 70, right: 70, top: 20),
                child: Column(
                  children: [
                    Padding(padding: const EdgeInsets.all(16)),
                    Text(
                      "",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                margin: EdgeInsets.only(left: 70, right: 70, top: 20),
                child: Column(
                  children: [
                    Padding(padding: const EdgeInsets.all(16)),
                    Text(
                      "",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: ItemList(),
        ),
      ),
    ),
  );
}
