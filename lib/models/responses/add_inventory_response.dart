import 'dart:convert';

import 'package:skinsync_clinic_portal/models/responses/base_response_model.dart';

class AddInventoryResponse extends BaseApiResponseModel<InventoryData?> {
  AddInventoryResponse({
    super.data,
    required super.isSuccess,
    required super.message,
  });

  factory AddInventoryResponse.fromRawJson(String str) =>
      AddInventoryResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddInventoryResponse.fromJson(Map<String, dynamic> json) =>
      AddInventoryResponse(
        data: json["data"] == null
            ? null
            : InventoryData.fromJson(json["data"]),
        isSuccess: json["is_success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "is_success": isSuccess,
    "message": message,
  };
}

class InventoryData {
  final int? clinicProductId;
  final int? productId;
  final String? image;
  final String? name;
  final String? unit;
  final int? totalQuantity;

  InventoryData({
    this.clinicProductId,
    this.productId,
    this.image,
    this.name,
    this.unit,
    this.totalQuantity,
  });

  factory InventoryData.fromRawJson(String str) =>
      InventoryData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory InventoryData.fromJson(Map<String, dynamic> json) => InventoryData(
    clinicProductId: json["clinic_product_id"],
    productId: json["product_id"],
    image: json["image"],
    name: json["name"],
    unit: json["unit"],
    totalQuantity: json["total_quantity"],
  );

  Map<String, dynamic> toJson() => {
    "clinic_product_id": clinicProductId,
    "product_id": productId,
    "image": image,
    "name": name,
    "unit": unit,
    "total_quantity": totalQuantity,
  };
}
