import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/dummy/inventory.dart';
import '../../utils/custom_fonts.dart';
import '../../utils/responsive.dart';
import '../build_textfield.dart';

class AddProductDialog extends StatefulWidget {
  final List<Product> products;
  final Function(InventoryItem) onProductAdded;

  const AddProductDialog({
    super.key,
    required this.products,
    required this.onProductAdded,
  });

  @override
  State<AddProductDialog> createState() => _AddProductDialogState();
}

class _AddProductDialogState extends State<AddProductDialog> {
  Product? _selectedProduct;
  final TextEditingController _quantityController = TextEditingController(
    text: '1',
  );
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _searchController = TextEditingController();

  int _quantity = 1;

  @override
  void dispose() {
    _quantityController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    _searchController.dispose();
    super.dispose();
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

  @override
  Widget build(BuildContext context) {
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
                      child: Icon(Icons.close, size: 20.r, color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.h),

              Text("Product", style: CustomFonts.black14w500),
              SizedBox(height: 10.h),
              DropdownButtonFormField2<Product>(
                isExpanded: true,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 16.h),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(color: Colors.grey[400]!),
                  ),
                ),
                hint: Text(
                  'Select Product',
                  style: CustomFonts.grey14w400.copyWith(fontSize: 14.sp),
                ),
                items: widget.products
                    .map(
                      (item) => DropdownMenuItem<Product>(
                        value: item,
                        child: Text(
                          item.name,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedProduct = value;
                    if (value != null) {
                      _priceController.text = value.defaultPrice.toString();
                    }
                  });
                },
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.only(right: 8),
                ),
                iconStyleData: IconStyleData(
                  icon: Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.black45,
                    size: 24.r,
                  ),
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    color: Colors.white,
                  ),
                  elevation: 8,
                ),
                menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
                dropdownSearchData: DropdownSearchData(
                  searchController: _searchController,
                  searchInnerWidgetHeight: 50.h,
                  searchInnerWidget: Container(
                    height: 50.h,
                    padding: EdgeInsets.only(
                      top: 8.h,
                      bottom: 4.h,
                      right: 8.w,
                      left: 8.w,
                    ),
                    child: TextFormField(
                      expands: true,
                      maxLines: null,
                      controller: _searchController,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 10.w,
                          vertical: 8.h,
                        ),
                        hintText: 'Search for an item...',
                        hintStyle: TextStyle(fontSize: 12.sp),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                    ),
                  ),
                  searchMatchFn: (item, searchValue) {
                    return item.value!.name.toLowerCase().contains(
                      searchValue.toLowerCase(),
                    );
                  },
                ),
                onMenuStateChange: (isOpen) {
                  if (!isOpen) _searchController.clear();
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
                label: 'Price',
                controller: _priceController,
                hintText: 'Enter price',
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
              ),

              SizedBox(height: 20.h),
              BuildTextField(
                label: 'Description',
                controller: _descriptionController,
                hintText: 'Enter product description',
                maxLines: 3,
              ),

              SizedBox(height: 32.h),
              SizedBox(
                width: double.infinity,
                height: 50.h,
                child: ElevatedButton(
                  onPressed: () {
                    if (_selectedProduct != null) {
                      final item = InventoryItem(
                        name: _selectedProduct!.name,
                        quantity: _quantity,
                        price:
                            double.tryParse(_priceController.text) ??
                            _selectedProduct!.defaultPrice,
                        image: _selectedProduct!.image,
                        description: _descriptionController.text,
                      );
                      widget.onProductAdded(item);
                      Navigator.pop(context);
                    }
                  },
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
                ),
              ),
            ],
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
