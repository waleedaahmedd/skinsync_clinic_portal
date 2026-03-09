import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

import '../../models/dummy/inventory.dart';
import '../../utils/color_constant.dart';
import '../../utils/custom_fonts.dart';
import '../../utils/responsive.dart';
import '../build_textfield.dart';

class AddProductDialog extends StatefulWidget {
  final List<Product> products;
  final Function(Product) onProductSelected;

  const AddProductDialog({
    super.key,
    required this.products,
    required this.onProductSelected,
  });

  @override
  State<AddProductDialog> createState() => _AddProductDialogState();
}

class _AddProductDialogState extends State<AddProductDialog> {
  final TextEditingController _searchController = TextEditingController();
  List<Product> _filteredProducts = [];

  @override
  void initState() {
    super.initState();
    _filteredProducts = widget.products;
  }

  void _filter(String query) {
    setState(() {
      _filteredProducts = widget.products
          .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
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
        width: isLandscape ? 600.w : double.infinity,
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Select Product", style: CustomFonts.black22w600),
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
            SizedBox(height: 20.h),
            BuildTextField(
              label: 'Search Catalog',
              controller: _searchController,
              hintText: 'Search products...',
              prefixIcon: Icon(Iconsax.search_normal, size: 20.r),
              onChanged: _filter,
            ),
            SizedBox(height: 20.h),
            ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.5,
              ),
              child: _filteredProducts.isEmpty
                  ? Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: 40.h),
                        child: Text(
                          "No products found",
                          style: CustomFonts.grey16w400,
                        ),
                      ),
                    )
                  : ListView.separated(
                      shrinkWrap: true,
                      itemCount: _filteredProducts.length,
                      separatorBuilder: (context, index) =>
                          Divider(color: Colors.grey.shade100, height: 1),
                      itemBuilder: (context, index) {
                        final product = _filteredProducts[index];
                        return ListTile(
                          contentPadding: EdgeInsets.symmetric(vertical: 8.h),
                          leading: Container(
                            width: 50.w,
                            height: 50.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              image: DecorationImage(
                                image: AssetImage(product.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          title: Text(
                            product.name,
                            style: CustomFonts.black16w600,
                          ),
                          subtitle: Text(
                            '\$${product.defaultPrice.toStringAsFixed(2)}',
                            style: CustomFonts.black14w400.copyWith(
                              color: CustomColors.purpleColor,
                            ),
                          ),
                          trailing: Icon(
                            Icons.add_circle_outline,
                            color: Colors.black,
                            size: 24.r,
                          ),
                          onTap: () {
                            widget.onProductSelected(product);
                            Navigator.pop(context);
                          },
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
