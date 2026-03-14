import 'dart:convert';

import 'package:skinsync_clinic_portal/models/responses/base_response_model.dart';
import 'package:skinsync_clinic_portal/models/responses/clinic_products_response.dart';

class AddInventoryResponse extends BaseApiResponseModel<ClinicProduct?> {
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
            : ClinicProduct.fromJson(json["data"]),
        isSuccess: json["is_success"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "is_success": isSuccess,
    "message": message,
  };
}
