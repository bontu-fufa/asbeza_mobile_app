import 'package:asbeza_mobile_app/item/blocs/blocs.dart';
import 'package:asbeza_mobile_app/item/models/models.dart';
import 'package:asbeza_mobile_app/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostItemPriceScreen extends StatefulWidget {
  static const routeName = 'itemAddUpdate';
  final ItemArgument args;

  PostItemPriceScreen({required this.args});

  @override
  _PostItemPriceScreenState createState() => _PostItemPriceScreenState();
}

class _PostItemPriceScreenState extends State<PostItemPriceScreen> {
  final formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _item = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.args.edit ? "Update Item" : "Add New Item"}'),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
        child: Form(
          key: formKey,
          child: Container(
            child: Column(
              children: [
                TextFormField(
                  initialValue: widget.args.edit ? widget.args.item?.name : '',
                  decoration: InputDecoration(
                    hintText: "Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                  onSaved: (value) {
                    setState(() {
                      if (value != null) {
                        this._item["name"] = value;
                      }
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue:
                      widget.args.edit ? '${widget.args.item?.min_price}' : '',
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Minimum Price Range",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                  validator: (String? minPrice) {
                    if (minPrice == '') {
                      return "Enter minimum price";
                    }
                    final double minPriceDouble = double.parse(minPrice!);
                    if (minPriceDouble < 0) {
                      return "Price cannot be less than zero";
                    }

                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      if (value != null) {
                        this._item["min_price"] = double.parse(value);
                      }
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue:
                      widget.args.edit ? '${widget.args.item?.max_price}' : '',
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: "Maximum Price Range",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                  validator: (String? maxPrice) {
                    if (maxPrice == '') {
                      return "Enter maximum price";
                    }
                    final double maxPriceDouble = double.parse(maxPrice!);
                    if (maxPriceDouble < 0) {
                      return "Price cannot be less than zero";
                    }

                    return null;
                  },
                  onSaved: (value) {
                    setState(() {
                      if (value != null) {
                        this._item["max_price"] = double.parse(value);
                      }
                    });
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                BlocConsumer<ItemBloc, ItemState>(listener: (ctx, itemState) {
                  if (itemState is ItemOperationSuccess) {
                    Navigator.of(context).pop();
                  }
                }, builder: (ctx, itemState) {
                  return GestureDetector(
                    onTap: () {
                      // run validations.
                      // form access.
                      final form = formKey.currentState;
                      final valid = formKey.currentState!.validate();
                      if (!valid) {
                        // do something here.
                        print("something failed");
                        return;
                      }
                      if (form != null) {
                        form.save();
                        final ItemEvent event = widget.args.edit
                            ? ItemUpdate(
                                item: Item(
                                id: widget.args.item?.id,
                                name: this._item["name"],
                                max_price: this._item["max_price"],
                                min_price: this._item["min_price"],
                              ))
                            : ItemCreate(
                                item: Item(
                                id: null,
                                name: this._item["name"],
                                max_price: this._item["max_price"],
                                min_price: this._item["min_price"],
                              ));

                        BlocProvider.of<ItemBloc>(context).add(event);
                      }
                      ;
                    },
                    child: Container(
                      height: 60.0,
                      width: double.infinity,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Text(
                        widget.args.edit ? "Update Item" : "Add Item",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
