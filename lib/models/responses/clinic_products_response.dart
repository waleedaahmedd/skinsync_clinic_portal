import 'package:skinsync_clinic_portal/models/responses/base_response_model.dart';

class ClinicProductsResponse extends BaseApiResponseModel<List<ClinicProduct>> {
  const ClinicProductsResponse({
    required super.isSuccess,
    required super.message,
    super.data,
  });

  factory ClinicProductsResponse.fromJson(Map<String, dynamic> json) {
    return ClinicProductsResponse(
      isSuccess: json["is_success"],
      message: json["message"],
      data: json["data"] != null
          ? List<ClinicProduct>.from(
              json["data"].map((x) => ClinicProduct.fromJson(x)),
            )
          : null,
    );
  }
}

class ClinicProduct {
  final int clinicProductId;
  final int productId;
  final String image;
  final String name;
  final String unit;
  final int totalQuantity;

  ClinicProduct({
    required this.clinicProductId,
    required this.productId,
    required this.image,
    required this.name,
    required this.unit,
    required this.totalQuantity,
  });

  factory ClinicProduct.fromJson(Map<String, dynamic> json) => ClinicProduct(
    clinicProductId: json["clinic_product_id"] ?? 0,
    productId: json["product_id"] ?? 0,
    image: json["image"] ?? "",
    name: json["name"] ?? "",
    unit: json["unit"] ?? "",
    totalQuantity: json["total_quantity"] ?? 0,
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
