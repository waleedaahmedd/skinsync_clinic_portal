import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skinsync_clinic_portal/utils/assets.dart';
import 'package:skinsync_clinic_portal/utils/color_constant.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';
import 'package:skinsync_clinic_portal/utils/responsive.dart';
import 'package:skinsync_clinic_portal/widgets/build_textfield.dart';

import '../../models/dummy/inventory.dart';
import '../../widgets/dailog box/add_product_dialog.dart';

class InventoryScreen extends StatefulWidget {
  static const String routeName = '/inventory_screen';
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<InventoryItem> _dummyInventory = [
    InventoryItem(
      name: 'Botox Vial',
      quantity: 50,
      price: 200.0,
      image: PngAssets.treatmentImage,
    ),
    InventoryItem(
      name: 'Dermal Filler',
      quantity: 30,
      price: 150.0,
      image: PngAssets.treatmentImage,
    ),
    InventoryItem(
      name: 'Syringes (100pk)',
      quantity: 20,
      price: 45.0,
      image: PngAssets.treatmentImage,
    ),
    InventoryItem(
      name: 'Alcohol Swabs',
      quantity: 100,
      price: 10.0,
      image: PngAssets.treatmentImage,
    ),
    InventoryItem(
      name: 'Numbing Cream',
      quantity: 15,
      price: 35.0,
      image: PngAssets.treatmentImage,
    ),
    InventoryItem(
      name: 'Gauze Pads',
      quantity: 200,
      price: 5.0,
      image: PngAssets.treatmentImage,
    ),
    InventoryItem(
      name: 'Cooling Gel',
      quantity: 12,
      price: 25.0,
      image: PngAssets.treatmentImage,
    ),
    InventoryItem(
      name: 'Latex Gloves',
      quantity: 500,
      price: 15.0,
      image: PngAssets.treatmentImage,
    ),
  ];

  final List<Product> _availableProducts = [
    Product(
      name: 'Hyaluronic Serum',
      defaultPrice: 45.0,
      image: PngAssets.treatmentImage,
    ),
    Product(
      name: 'Retinol Cream',
      defaultPrice: 60.0,
      image: PngAssets.treatmentImage,
    ),
    Product(
      name: 'Vitamin C Booster',
      defaultPrice: 55.0,
      image: PngAssets.treatmentImage,
    ),
    Product(
      name: 'Sunscreen SPF 50',
      defaultPrice: 30.0,
      image: PngAssets.treatmentImage,
    ),
    Product(
      name: 'Cleansing Foam',
      defaultPrice: 25.0,
      image: PngAssets.treatmentImage,
    ),
    Product(
      name: 'Face Moisturizer',
      defaultPrice: 40.0,
      image: PngAssets.treatmentImage,
    ),
    Product(
      name: 'Anti-Aging Mask',
      defaultPrice: 35.0,
      image: PngAssets.treatmentImage,
    ),
    Product(
      name: 'Eye Repair Cream',
      defaultPrice: 50.0,
      image: PngAssets.treatmentImage,
    ),
  ];

  List<InventoryItem> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    _filteredItems = List.from(_dummyInventory);
  }

  void _filterInventory(String? query) {
    if (query == null) return;
    setState(() {
      _filteredItems = _dummyInventory
          .where(
            (item) => item.name.toLowerCase().contains(query.toLowerCase()),
          )
          .toList();
    });
  }

  void _addItemToInventory(Product product) {
    setState(() {
      // Check if item already exists
      final existingIndex = _dummyInventory.indexWhere(
        (item) => item.name == product.name,
      );
      if (existingIndex != -1) {
        _dummyInventory[existingIndex].quantity += 10;
      } else {
        _dummyInventory.add(
          InventoryItem(
            name: product.name,
            quantity: 10,
            price: product.defaultPrice,
            image: product.image,
          ),
        );
      }
      _filterInventory(_searchController.text);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} added to inventory'),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showAddProductDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AddProductDialog(
          products: _availableProducts,
          onProductSelected: (product) {
            _addItemToInventory(product);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            _buildHeader(context),
            SizedBox(height: 24.h),
            _buildSearchBar(),
            SizedBox(height: 24.h),
            Divider(color: Colors.grey.shade300),
            SizedBox(height: 24.h),
            Expanded(child: _buildInventoryGrid(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Text("Inventory", style: CustomFonts.black22w600),
        const Spacer(),
        ElevatedButton(
          onPressed: _showAddProductDialog,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.r),
            ),
            elevation: 0,
          ),
          child: Row(
            children: [
              Icon(Icons.add, color: Colors.white, size: 20.r),
              SizedBox(width: 8.w),
              Text('Add Item', style: CustomFonts.white14w500),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return BuildTextField(
      label: 'Search Products',
      controller: _searchController,
      hintText: 'Search by item name...',
      prefixIcon: Icon(Iconsax.search_normal, size: 20.r, color: Colors.grey),
      onChanged: _filterInventory,
    );
  }

  Widget _buildInventoryGrid(BuildContext context) {
    int crossAxisCount = context.isLandscape ? 4 : 2;
    double childAspectRatio = context.isLandscape ? 1.1 : 0.7;

    return GridView.builder(
      itemCount: _filteredItems.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 20.w,
        mainAxisSpacing: 20.h,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) {
        return _buildInventoryCard(_filteredItems[index]);
      },
    );
  }

  Widget _buildInventoryCard(InventoryItem item) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: CustomColors.lightBlueColor.withValues(alpha: 0.2),
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
          BoxShadow(
            color: CustomColors.lightPurpleColor.withValues(alpha: 0.1),
            blurRadius: 10.r,
            offset: Offset(2.h, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15.r)),
              child: Stack(
                children: [
                  Image.asset(
                    item.image,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      color: const Color(0xFFE8E8E8),
                      child: const Icon(Icons.broken_image, color: Colors.grey),
                    ),
                  ),
                  Positioned(
                    top: 10.h,
                    right: 10.w,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Text(
                        'Qty: ${item.quantity}',
                        style: CustomFonts.black12w600.copyWith(
                          color: item.quantity < 20 ? Colors.red : Colors.green,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: CustomFonts.black16w600,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${item.price.toStringAsFixed(2)}',
                      style: CustomFonts.black14w600.copyWith(
                        color: CustomColors.purpleColor,
                      ),
                    ),
                    Text(
                      'per unit',
                      style: CustomFonts.grey14w500.copyWith(fontSize: 12.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
