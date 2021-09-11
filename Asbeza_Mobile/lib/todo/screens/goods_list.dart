import 'package:asbeza_mobile_app/todo/blocs/blocs.dart';
import 'package:asbeza_mobile_app/todo/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PurchaseGoods extends StatefulWidget {
  static const routeName = 'purchaseList';
  @override
  _PurchaseGoodsState createState() => _PurchaseGoodsState();
}

class _PurchaseGoodsState extends State<PurchaseGoods> {
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

      BlocProvider.of<TodoBloc>(context).add(LoadTodo(userId: id));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            // leading: IconButton(
            //   icon: Icon(Icons.arrow_back),
            //   onPressed: () {},
            // ),
            // leading: BackButton(color: Colors.white),
            centerTitle: true,
            title: const Text('Aszeza Goods')),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        body: BlocConsumer<TodoBloc, TodoState>(
            listener: (ctx, state) {},
            builder: (ctx, state) {
              if ((state is TodoLoaded && state.todos.length == 0) ||
                  state is TodoOperationFailed) {
                return Center(child: Text("No list to display"));
              }
              if (state is TodoLoaded) {
                final todos = state.todos;

                return Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                  width: double.infinity,
                  child: ListView.builder(
                    itemCount: todos.length,
                    itemBuilder: (ctx, index) {
                      final todo = todos[index];
                      bool is_purchased = todos[index].isPurchased;

                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        width: double.infinity,
                        color: Colors.blue[100],
                        margin: EdgeInsets.only(bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  todo.name.toUpperCase(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        children: [
                                          WidgetSpan(
                                            child: Icon(Icons.north, size: 14),
                                          ),
                                          TextSpan(
                                              text: "${todo.max_price}",
                                              style: TextStyle(
                                                  color: Colors.black)),
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
                                              text: "${todo.min_price}",
                                              style: TextStyle(
                                                  color: Colors.black)),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    is_purchased = !is_purchased;

                                    TodoAll todoAll = TodoAll(
                                      userId: id,
                                      itemId: todo.itemId,
                                      name: todo.name,
                                      min_price: todo.min_price,
                                      max_price: todo.max_price,
                                      isPurchased: is_purchased,
                                    );

                                    BlocProvider.of<TodoBloc>(context).add(
                                      UpdateTodo(userId: id, todo: todoAll),
                                    );
                                  },
                                  child: Icon(
                                    todo.isPurchased
                                        ? Icons.check_circle
                                        : Icons.check_circle_outline_outlined,
                                    color: Colors.green,
                                    size: 30,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    BlocProvider.of<TodoBloc>(context).add(
                                        DeleteTodo(
                                            userId: id, itemId: todo.itemId));
                                  },
                                  child: Icon(
                                    Icons.delete_forever,
                                    color: Colors.red,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
              if (state is TodoOperationFailed)
                return Text("Unable to load todo");

              if (state is TodoInProgress || state is TodoLoading) {
                return Center(child: CircularProgressIndicator());
              }

              return Center(child: Text("No list to display"));
            }));
  }
}
