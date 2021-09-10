import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:asbeza_mobile_app/item/models/models.dart';

class ItemDataProvider {
  static final String _baseUrl = "http://10.0.2.2:5000/asbeza/api/v1/items";

  // method for creating item
  Future<Item> create(Item item) async {
    final http.Response response = await http.post(Uri.parse(_baseUrl),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "name": item.name,
          "max_price": item.max_price,
          "min_price": item.min_price
        }));

    if (response.statusCode == 200) {
      return Item.fromJson(jsonDecode(response.body));
    }
    {
      throw Exception("Failed to create item");
    }
  }

  // Future<Item> fetchByCode() async {
  //   final response = await http.get(Uri.parse(_baseUrl));

  //   if (response.statusCode == 200) {
  //     return Course.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception("Fetching Course by code failed");
  //   }
  // }

  // method to fetch all items to display
  Future<List<Item>> fetchAll() async {
    final response = await http.get(Uri.parse(_baseUrl));
    if (response.statusCode == 200) {
      final items = jsonDecode(response.body) as List;
      return items.map((c) => Item.fromJson(c)).toList();
    } else {
      throw Exception("Could not fetch items");
    }
  }

  // method to update item info by admin
  Future<Item> update(int id, Item item) async {
    final response = await http.put(Uri.parse("$_baseUrl/$id"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "id": item.id,
          "name": item.name,
          "max_price": item.max_price,
          "min_price": item.min_price
        }));

    if (response.statusCode == 200) {
      return Item.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Could not update the item");
    }
  }

  // method to delete an item by admin
  Future<void> delete(int id) async {
    final response = await http.delete(Uri.parse("$_baseUrl/$id"));
    if (response.statusCode != 200) {
      throw Exception("Failed to delete the item");
    }
  }
}
