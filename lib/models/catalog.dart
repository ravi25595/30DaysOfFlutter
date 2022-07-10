class Item {
  final String id;
  final String name;
  final String desc;
  final int price;
  final String color;
  final String image;

  Item(this.id, this.name, this.desc, this.price, this.color, this.image);
}

final products = [
  Item(
    "id",
    "iphone 13 pro ultra max",
    "Apple iphone 13th generation",
    999,
    "#33505a",
    "https://m.media-amazon.com/images/I/61i8Vjb17SL._SX522_.jpg"
  )
];
