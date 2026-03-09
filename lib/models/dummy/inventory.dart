class InventoryItem {
  final String name;
  int quantity;
  final double price;
  final String image;

  InventoryItem({
    required this.name,
    required this.quantity,
    required this.price,
    required this.image,
  });
}

class Product {
  final String name;
  final double defaultPrice;
  final String image;

  Product({
    required this.name,
    required this.defaultPrice,
    required this.image,
  });
}
