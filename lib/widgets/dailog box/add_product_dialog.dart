import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinsync_clinic_portal/models/responses/catalog_response.dart';
import 'package:skinsync_clinic_portal/utils/enums.dart';
import 'package:skinsync_clinic_portal/utils/validators.dart';
import 'package:skinsync_clinic_portal/view_models/inventory_view_model.dart';

import '../../utils/custom_fonts.dart';
import '../../utils/responsive.dart';
import '../build_textfield.dart';
import '../custom_dropdown_widget.dart';

class AddProductDialog extends ConsumerStatefulWidget {
  const AddProductDialog({super.key});

  @override
  ConsumerState<AddProductDialog> createState() => _AddProductDialogState();
}

class _AddProductDialogState extends ConsumerState<AddProductDialog> {
  CatalogItem? _selectedProduct;
  final TextEditingController _quantityController = TextEditingController(
    text: '1',
  );
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _discountController = TextEditingController(
    text: '0',
  );
  final TextEditingController _discountedPriceController =
      TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  int _quantity = 1;
  DiscountType _discountType = DiscountType.per;
  final _formKey = GlobalKey<FormState>();

  void _onAddToInventory() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    if (_selectedProduct == null) {
      EasyLoading.showError('Please select a product!');
    }
    ref
        .read(inventoryProvider.notifier)
        .addInventoryItem(
          productId: _selectedProduct!.id!,
          quantity: _quantity,
          originalPrice: _priceController.text,
          discount: _discountController.text,
          discountType: _discountType,
          discountedPrice: _discountedPriceController.text,
        );
  }

  void _increment() {
    setState(() {
      _quantity++;
      _quantityController.text = _quantity.toString();
    });
  }

  void _decrement() {
    if (_quantity > 1) {
      setState(() {
        _quantity--;
        _quantityController.text = _quantity.toString();
      });
    }
  }

  void _calculateDiscountedPrice() {
    double originalPrice = double.tryParse(_priceController.text) ?? 0.0;
    double discount = double.tryParse(_discountController.text) ?? 0.0;
    double discountedPrice = originalPrice;

    if (_discountType == DiscountType.per) {
      discountedPrice = originalPrice - (originalPrice * discount / 100);
    } else {
      discountedPrice = originalPrice - discount;
    }

    if (discountedPrice < 0) discountedPrice = 0;

    _discountedPriceController.text = discountedPrice.toStringAsFixed(2);
  }

  void _listener(InventoryState? prev, InventoryState next) {
    if (next.inventoryAdded) {
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _quantityController.dispose();
    _priceController.dispose();
    _discountController.dispose();
    _discountedPriceController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(inventoryProvider, _listener);
    final bool isLandscape = context.isLandscape;
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(
        horizontal: isLandscape ? 100.w : 20.w,
        vertical: 40.h,
      ),
      child: Container(
        width: isLandscape ? 500.w : double.infinity,
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Add Inventory Item", style: CustomFonts.black22w600),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: EdgeInsets.all(4.r),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Icon(
                          Icons.close,
                          size: 20.r,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 24.h),

                Text("Product", style: CustomFonts.black14w500),
                SizedBox(height: 10.h),
                Consumer(
                  builder: (_, ref, _) {
                    final catalog = ref.read(
                      inventoryProvider.select((s) => s.catalog),
                    );
                    return CustomDropdown<CatalogItem>(
                      builder: (catalogItem) => Text(
                        catalogItem.name ?? 'N/A',
                        style: CustomFonts.black14w500,
                      ),
                      hint: 'Select Product',
                      value: _selectedProduct,
                      items: catalog,
                      onChanged: (newCatalog) {
                        setState(() {
                          _selectedProduct = newCatalog;
                        });
                      },
                    );
                  },
                ),
                SizedBox(height: 20.h),
                Text("Quantity", style: CustomFonts.black14w500),
                SizedBox(height: 10.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildQtyBtn(Icons.remove, _decrement),
                    SizedBox(width: 15.w),
                    Expanded(
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Quantity is required!';
                          }
                          final quantity = int.tryParse(value);
                          if (quantity == null || quantity <= 0) {
                            return 'Invalid quantity!';
                          }
                          return null;
                        },
                        controller: _quantityController,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        onChanged: (val) {
                          _quantity = int.tryParse(val) ?? 1;
                        },
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 14.h),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(color: Colors.grey[300]!),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            borderSide: BorderSide(color: Colors.grey[300]!),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15.w),
                    _buildQtyBtn(Icons.add, _increment),
                  ],
                ),

                SizedBox(height: 20.h),
                BuildTextField(
                  label: 'Original Price',
                  controller: _priceController,
                  validator: Validators.empty,
                  hintText: 'Enter original price',
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: true,
                  ),
                  onChanged: (_) => _calculateDiscountedPrice(),
                ),

                SizedBox(height: 20.h),
                Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: BuildTextField(
                        label: 'Discount',
                        controller: _discountController,
                        hintText: 'Enter discount',
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        onChanged: (_) => _calculateDiscountedPrice(),
                      ),
                    ),
                    SizedBox(width: 15.w),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Type", style: CustomFonts.black14w500),
                          SizedBox(height: 10.h),
                          CustomDropdown<DiscountType>(
                            builder: (type) => Text(switch (type) {
                              DiscountType.per => 'Percentage',
                              DiscountType.flat => 'Flat',
                            }, style: CustomFonts.black14w500),
                            hint: 'Select Type',
                            value: _discountType,
                            items: DiscountType.values,
                            onChanged: (val) {
                              if (val != null) {
                                setState(() {
                                  _discountType = val;
                                  _calculateDiscountedPrice();
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20.h),
                BuildTextField(
                  label: 'Discounted Price',
                  validator: (value) {
                    final discountValue = num.tryParse(
                      _discountController.text,
                    );
                    if (discountValue == null || discountValue <= 0) {
                      return null;
                    }
                    return Validators.empty(value);
                  },
                  controller: _discountedPriceController,
                  hintText: '0.00',
                  readOnly: true,
                ),

                SizedBox(height: 32.h),
                SizedBox(
                  width: double.infinity,
                  height: 50.h,
                  child: Consumer(
                    builder: (_, ref, _) {
                      final loading = ref.watch(
                        inventoryProvider.select((s) => s.addProductLoading),
                      );
                      if (loading) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return ElevatedButton(
                        onPressed: _onAddToInventory,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          "Add to Inventory",
                          style: CustomFonts.white14w500,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQtyBtn(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8.r),
      child: Container(
        height: 48.h,
        width: 48.h,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.white,
        ),
        child: Icon(icon, size: 20.r, color: Colors.black),
      ),
    );
  }
}
