import 'package:asbeza_mobile_app/item/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemList extends StatefulWidget {
  static const routeName = 'itemAddUpdate';
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
        body: BlocBuilder<ItemBloc, ItemState>(
          builder: (_, state) {
            if (state is ItemOperationFailure) {
              return Center(child: Text("Could not fetch items"));
            }

            if (state is ItemOperationSuccess) {
              final items = state.items;
              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (_, index) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    child: ListTile(
                      title: Text("${items.elementAt(index).name}"),
                      subtitle: Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(Icons.north, size: 14),
                                ),
                                TextSpan(
                                  text: "${items.elementAt(index).max_price}",
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Icon(Icons.south, size: 14),
                                ),
                                TextSpan(
                                  text: "${items.elementAt(index).min_price}",
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }

            return CircularProgressIndicator();
          },
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
