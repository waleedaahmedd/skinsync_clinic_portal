class InventoryHistory {
  final DateTime date;
  final int quantity;
  final bool isAdded; // true if added/bought, false if sold/removed

  InventoryHistory({
    required this.date,
    required this.quantity,
    required this.isAdded,
  });
}

class InventoryItem {
  final String name;
  int quantity;
  final double price;
  final String image;
  final String description;
  final List<InventoryHistory> history;

  InventoryItem({
    required this.name,
    required this.quantity,
    required this.price,
    required this.image,
    required this.description,
    this.history = const [],
  });

  InventoryItem copyWith({List<InventoryHistory>? history}) {
    return InventoryItem(
      name: name,
      quantity: quantity,
      price: price,
      image: image,
      description: description,
      history: history ?? this.history,
    );
  }
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
