import 'package:skinsync_clinic_portal/models/responses/add_inventory_response.dart';
import 'package:skinsync_clinic_portal/services/locator.dart';
import 'package:skinsync_clinic_portal/utils/enums.dart';

import '../models/requests/add_inventory_request.dart';
import '../models/responses/catalog_response.dart';
import 'api_base_helper.dart';

class InventoryService {
  Future<List<CatalogItem>> getCatalog() async {
    final json = await locator<ApiBaseHelper>().get(Endpoint.catalog);
    final response = CatalogResponse.fromJson(json);
    if (!response.isSuccess) {
      throw Exception(response.message);
    }
    return response.data!;
  }

  Future<void> addInventoryItem(AddInventoryRequest request) async {
    final json = await locator<ApiBaseHelper>().post(
      Endpoint.addInventory,
      body: request.toJson(),
    );
    final response = AddInventoryResponse.fromJson(json);
    if (!response.isSuccess) {
      throw Exception(response.message);
    }
  }
}
