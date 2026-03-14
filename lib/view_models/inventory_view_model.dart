import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skinsync_clinic_portal/models/requests/add_inventory_request.dart';

import '../models/responses/catalog_response.dart';
import '../services/inventory_service.dart';
import '../services/locator.dart';
import '../utils/enums.dart';
import 'base_view_model.dart';

final inventoryProvider = NotifierProvider.autoDispose(
  () => InventoryViewModel(),
);

class InventoryViewModel extends BaseViewModel<InventoryState> {
  InventoryViewModel() : super(InventoryState());

  Future<void> getCatalog() async {
    return await runSafely(() async {
      state = state.copyWith(loading: true);
      final catalog = await locator<InventoryService>().getCatalog();
      state = state.copyWith(loading: false, catalog: catalog);
    });
  }

  Future<void> addInventoryItem({
    required int productId,
    required int quantity,
    required String originalPrice,
    required String discount,
    required DiscountType discountType,
    required String discountedPrice,
  }) async {
    return await runSafely(() async {
      state = state.copyWith(loading: true);
      await locator<InventoryService>().addInventoryItem(
        AddInventoryRequest(
          productId: productId,
          quantity: quantity,
          originalPrice: num.parse(originalPrice),
          discount: num.parse(discount),
          discountType: discountType,
          discountedPrice: num.parse(discountedPrice),
        ),
      );
      state = state.copyWith(loading: false, inventoryAdded: true);
    });
  }
}

class InventoryState {
  final bool loading;
  final List<CatalogItem> catalog;
  final bool inventoryAdded;

  const InventoryState({
    this.loading = false,
    this.catalog = const [],
    this.inventoryAdded = false,
  });

  InventoryState copyWith({
    bool? loading,
    List<CatalogItem>? catalog,
    bool? inventoryAdded,
  }) {
    return InventoryState(
      loading: loading ?? this.loading,
      catalog: catalog ?? this.catalog,
      inventoryAdded: inventoryAdded ?? false,
    );
  }
}
