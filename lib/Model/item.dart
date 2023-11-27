class Item {
  final String image;
  final double price;
  final String name;
  int qty;

  Item(
      {required this.image,
      required this.price,
      required this.name,
      this.qty = 0});
}
