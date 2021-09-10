import 'package:asbeza_mobile_app/item/data_providers/item-data-provider.dart';
import 'package:asbeza_mobile_app/item/models/models.dart';

class ItemRepository {
  final ItemDataProvider dataProvider;
  ItemRepository({required this.dataProvider});

  Future<Item> create(Item item) async {
    return this.dataProvider.create(item);
  }

  Future<Item> update(int id, Item item) async {
    return this.dataProvider.update(id, item);
  }

  Future<List<Item>> fetchAll() async {
    return this.dataProvider.fetchAll();
  }

  Future<void> delete(int id) async {
    this.dataProvider.delete(id);
  }
}
