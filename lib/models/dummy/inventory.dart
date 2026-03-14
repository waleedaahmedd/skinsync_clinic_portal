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
