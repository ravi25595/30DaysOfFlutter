import 'package:flutter_app/models/catalog.dart';

class CartModel {
  //catalog field
  late CatalogModel _catalog;

  //collection of Ids - store Id of each item
  final List<int> _itemIds = [];

  //getCatalog
  CatalogModel get catalog => _catalog;

  //setCatalog
  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  //get the items in cart
  List<Item> get items => _itemIds.map((id) => _catalog.getById(id)).toList();

  //get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //Add item
  void add(Item item) {
    _itemIds.add(item.id);
  }

  //remove item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}
