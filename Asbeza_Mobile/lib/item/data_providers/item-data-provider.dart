import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:asbeza_mobile_app/item/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
Future addToSession(Map value) async {
  final SharedPreferences prefs = await _prefs;
  return prefs;
}

class ItemDataProvider {
  static final String _baseUrl = "http://10.0.2.2:5000/asbeza/api/v1/items";

  // method for creating item
  Future<Item> create(Item item) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    Future<String> token;
    String tokenString = "";
    token = _prefs.then((SharedPreferences prefs) {
      return (prefs.getString('token') ?? "");
    });
    token.then((value) => tokenString = value);

    print(await tokenString);
    final http.Response response = await http.post(Uri.parse(_baseUrl),
        headers: {
          "Content-Type": "application/json",
          'x-access-token': await tokenString,
        },
        body: jsonEncode({
          "name": item.name,
          "max_price": item.max_price,
          "min_price": item.min_price
        }));

    if (response.statusCode == 200) {
      return Item.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Failed to create item");
    }
  }

  Future<List<Item>> fetchAll() async {

    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    Future<String> token;
    String tokenString = "";
    token = _prefs.then((SharedPreferences prefs) {
      return (prefs.getString('token') ?? "");
    });
    token.then((value) => tokenString = value);

    print(await tokenString);

    final response = await http.get(Uri.parse(_baseUrl), headers: {
      'content-type': 'application/json',
      'x-access-token': await tokenString,
    });
    if (response.statusCode == 200) {
      final items = jsonDecode(response.body) as List;
      print(items);
      return items.map((c) => Item.fromJson(c)).toList();
    } else {
      throw Exception("Could not fetch items");
    }
  }

  // method to update item info by admin
  Future<Item> update(int id, Item item) async {
    
    Future<String> token;
    String tokenString = "";
    token = _prefs.then((SharedPreferences prefs) {
      return (prefs.getString('token') ?? "");
    });
    token.then((value) => tokenString = value);

    print(await tokenString);

    final response = await http.put(Uri.parse("$_baseUrl/$id"),
        headers: {
          "Content-Type": "application/json",
          "X-Access-Token": await tokenString,
        },
        body: jsonEncode({
          "id": item.id,
          "name": item.name,
          "max_price": item.max_price,
          "min_price": item.min_price
        }));
    print(tokenString.runtimeType);
    if (response.statusCode == 200) {
      return Item.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Could not update the item");
    }
  }

  // method to delete an item by admin
  Future<void> delete(int id) async {
    
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    Future<String> token;
    String tokenString = "";
    token = _prefs.then((SharedPreferences prefs) {
      return (prefs.getString('token') ?? "");
    });
    token.then((value) => tokenString = value);

    print(await tokenString);

    final response = await http.delete(Uri.parse("$_baseUrl/$id"), headers: {
      "Content-Type": "application/json",
      'x-access-token': await tokenString,
    });
    if (response.statusCode != 200) {
      throw Exception("Failed to delete the item");
    }
  }
}
