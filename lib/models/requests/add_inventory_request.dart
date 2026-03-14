import 'package:skinsync_clinic_portal/models/requests/base_request.dart';
import 'package:skinsync_clinic_portal/utils/enums.dart';

class AddInventoryRequest extends BaseRequest {
  final int productId;
  final num quantity;
  final num originalPrice;
  final num discount;
  final DiscountType discountType;
  final num discountedPrice;

  AddInventoryRequest({
    required this.productId,
    required this.quantity,
    required this.originalPrice,
    required this.discount,
    required this.discountType,
    required this.discountedPrice,
  });

  @override
  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "quantity": quantity,
    "original_price": originalPrice,
    "discount": discount,
    "discount_type": discountType.name,
    "discounted_price": discountedPrice,
    "record": 'Buy',
  };
}
