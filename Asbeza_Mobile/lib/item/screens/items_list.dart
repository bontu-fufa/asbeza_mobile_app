import 'package:asbeza_mobile_app/item/blocs/blocs.dart';
import 'package:asbeza_mobile_app/item/screens/item_add_update.dart';
import 'package:asbeza_mobile_app/app_route.dart';
import 'package:asbeza_mobile_app/todo/blocs/blocs.dart';
import 'package:asbeza_mobile_app/todo/models/models.dart';
import 'package:asbeza_mobile_app/todo/models/todo_model.dart';
import 'package:asbeza_mobile_app/todo/screens/goods_list.dart';
import 'package:asbeza_mobile_app/user_homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItemList extends StatefulWidget {
  static const routeName = 'itemList';
  const ItemList({Key? key}) : super(key: key);

  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late Future<int> _user_id;
  late int id;

  @override
  void initState() {
    _user_id = _prefs.then((SharedPreferences prefs) {
      return (prefs.getInt('user_id') ?? 0);
    });

    _user_id.then((value) {
      id = value;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Items List"),
        ),
        backgroundColor: Colors.grey[300],
        body: BlocBuilder<ItemBloc, ItemState>(
          builder: (_, state) {
            if (state is ItemOperationFailure) {
              return Center(child: Text("Could not fetch items"));
            }

            if (state is ItemOperationSuccess) {
              final items = state.items;
              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        PostItemPriceScreen.routeName,
                        arguments: ItemArgument(
                            edit: true, item: items.elementAt(index)),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 8),
                      padding: const EdgeInsets.all(8),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            children: [
                              BlocBuilder<ItemBloc, ItemState>(
                                builder: (ctx, itemState) {
                                  return Text(
                                    "${items.elementAt(index).name}",
                                    style: TextStyle(fontSize: 24),
                                  );
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        WidgetSpan(
                                          child: Icon(Icons.north, size: 14),
                                        ),
                                        TextSpan(
                                            text:
                                                "${items.elementAt(index).max_price}",
                                            style:
                                                TextStyle(color: Colors.black)),
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
                                            text:
                                                "${items.elementAt(index).min_price}",
                                            style:
                                                TextStyle(color: Colors.black)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  BlocListener<TodoBloc, TodoState>(
                                    listener: (ctx, state) {
                                      if (state is TodoCreated) {
                                        // TODO: navigate to todo list page
                                        print(state.todo.item.name);
                                        
                                        Navigator.of(context).pushReplacementNamed(
                                          UserHomepage.routeName, arguments: 1
                                        );
                                      }
                                    },
                                    child: ElevatedButton(
                                      child: Text("Add to list"),
                                      onPressed: () {
                                        final purchaseItem = PurchaseItem(
                                            id: items.elementAt(index).id,
                                            name: items.elementAt(index).name,
                                            max_price: items
                                                .elementAt(index)
                                                .max_price,
                                            min_price: items
                                                .elementAt(index)
                                                .min_price);

                                        final todo = Todo(
                                            isPurchased: false,
                                            userId: id,
                                            item: purchaseItem);
                                        BlocProvider.of<TodoBloc>(context).add(
                                          AddTodoEvent(userId: id, todo: todo),
                                        );
                                      },
                                    ),
                                  ),
                                  ElevatedButton(
                                    child: Text("Report"),
                                    onPressed: () {},
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
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
