import 'package:flutter/material.dart';
import 'package:asbeza_mobile_app/item/models/item_model.dart';

import 'goods_list_details.dart';

//to be deleted
void main() {
  runApp(
    MaterialApp(
      home: PurcahseGoods(),
    ),
  );
}

class PurcahseGoods extends StatefulWidget {
  @override
  _PurchaseGoodsState createState() => _PurchaseGoodsState();
  // _MyAppState createState() => _MyAppState();
}

class _PurchaseGoodsState extends State<PurcahseGoods> {
  static const routeName = '/goods_list';

  @override
  Widget build(BuildContext context) {
    var items = <Item>[
      Item(name: "banana", min_price: 10, max_price: 25),
      Item(name: "onion", min_price: 10, max_price: 25)
    ];
    var goodsList = _build_goods(items, context);

    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {},
            ),
            // leading: BackButton(color: Colors.white),
            centerTitle: true,
            title: const Text('Aszeza Goods')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [...goodsList],
            ),
          ),
        ));
  }
}

_build_goods(List<Item> items, BuildContext context) {
  List<Widget> list = [];
  print(items.length);
  for (var i = 0; i < items.length; i++) {
    var item = items[i];
    list.add(Container(
      width: double.infinity,
      color: Colors.blue[100],
      margin: EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                print("tapped");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PurcahseGoodsDetails()),
                );
              },
              child: Column(
                children: [
                  Text(
                    item.name.toString().toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '08-10-2021',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Icon(
                  Icons.check_circle_outline_outlined,
                  color: Colors.green,
                  size: 30,
                ),
                Icon(
                  Icons.delete_forever,
                  color: Colors.red,
                  size: 30,
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
  return list;
}
