import 'package:flutter/material.dart';
import 'login.dart';
import 'post_item_price.dart';
import 'profile.dart';
import 'reports_list.dart';
import 'signup.dart';

import 'package:flutter/services.dart';

class PostItemPriceScreen extends StatefulWidget {
  const PostItemPriceScreen({Key? key}) : super(key: key);

  @override
  _PostItemPriceScreenState createState() => _PostItemPriceScreenState();
}

class _PostItemPriceScreenState extends State<PostItemPriceScreen> {
  final formKey = GlobalKey<FormState>();
  final minPriceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Item"),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
        child: Form(
          key: formKey,
          child: Container(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    hintText: "Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: minPriceController,
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
                    final double minPriceDouble = double.parse(minPrice!);
                    if (minPriceDouble < 0) {
                      return "Price cannot be less than zero";
                    }

                    return null;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
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
                ),
                SizedBox(height: 30,),
                GestureDetector(
                  onTap: () {
                    // run validations.
                    // form access.
                    final valid = formKey.currentState!.validate();
                    if (!valid) {
                      // do something here.
                      print("something failed");
                      return;
                    }
                    
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
                      "Add Item",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
