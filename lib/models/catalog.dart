class Item {
  final int id;
  final String name;
  final String desc;
  final int price;
  final String color;
  final String image;

  Item(this.id, this.name, this.desc, this.price, this.color, this.image);
}
class CatalogModel {
  static final items = [
    Item(
        001,
        "iphone 13 pro ultra max",
        "Apple iphone 13th generation",
        999,
        "#33505a",
        "https://m.media-amazon.com/images/I/61i8Vjb17SL._SX522_.jpg"
    )
  ];
}