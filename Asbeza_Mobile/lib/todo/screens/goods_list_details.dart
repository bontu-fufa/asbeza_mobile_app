import 'package:flutter/material.dart';
import 'package:asbeza_mobile_app/item/models/item_model.dart';

//to be deleted
void main() {
  runApp(
    MaterialApp(
      home: PurcahseGoodsDetails(),
    ),
  );
}

class PurcahseGoodsDetails extends StatefulWidget {
  @override
  _PurchaseGoodsDetailsState createState() => _PurchaseGoodsDetailsState();
  // _MyAppState createState() => _MyAppState();
}

class _PurchaseGoodsDetailsState extends State<PurcahseGoodsDetails> {
  static const routeName = '/goods_list_detail';

  @override
  Widget build(BuildContext context) {
    var items = <Item>[Item(name: "banana", min_price: 10, max_price: 25)];
    var goodsList = _build_goods(items);

    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            // leading: BackButton(color: Colors.white),
            centerTitle: true,
            title: const Text('Aszeza Goods details')),
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

_build_goods(List<Item> items) {
  List<Widget> list = [];
  for (var i = 0; i < items.length; i++) {
    var item = items[i];
    list.add(Container(
      width: double.infinity,
      color: Colors.blue[100],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Center(
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
              Text('min price : ' + item.min_price.toString()),
              Text('max price : ' + item.max_price.toString()),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    ));

    return list;
  }
}
