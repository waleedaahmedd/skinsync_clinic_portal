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
  final double originalPrice;
  final double discount;
  final String discountType;
  final double discountedPrice;
  final String image;
  final List<InventoryHistory> history;

  InventoryItem({
    required this.name,
    required this.quantity,
    required this.originalPrice,
    required this.discount,
    required this.discountType,
    required this.discountedPrice,
    required this.image,
    this.history = const [],
  });

  InventoryItem copyWith({List<InventoryHistory>? history}) {
    return InventoryItem(
      name: name,
      quantity: quantity,
      originalPrice: originalPrice,
      discount: discount,
      discountType: discountType,
      discountedPrice: discountedPrice,
      image: image,
      history: history ?? this.history,
    );
  }
}
