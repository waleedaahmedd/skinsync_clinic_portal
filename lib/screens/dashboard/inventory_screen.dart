import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skinsync_clinic_portal/utils/assets.dart';
import 'package:skinsync_clinic_portal/utils/color_constant.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';
import 'package:skinsync_clinic_portal/utils/responsive.dart';
import 'package:skinsync_clinic_portal/widgets/build_textfield.dart';
import 'package:skinsync_clinic_portal/widgets/dailog%20box/inventory_detail_dialog.dart';

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
      description: 'Standard Botox vial for cosmetic procedures.',
      history: [
        InventoryHistory(
          date: DateTime.now().subtract(const Duration(days: 15)),
          quantity: 100,
          isAdded: true,
        ),
        InventoryHistory(
          date: DateTime.now().subtract(const Duration(days: 12)),
          quantity: 20,
          isAdded: false,
        ),
        InventoryHistory(
          date: DateTime.now().subtract(const Duration(days: 8)),
          quantity: 15,
          isAdded: false,
        ),
        InventoryHistory(
          date: DateTime.now().subtract(const Duration(days: 5)),
          quantity: 60,
          isAdded: true,
        ),
        InventoryHistory(
          date: DateTime.now().subtract(const Duration(days: 2)),
          quantity: 10,
          isAdded: false,
        ),
      ],
    ),
    InventoryItem(
      name: 'Dermal Filler',
      quantity: 30,
      price: 150.0,
      image: PngAssets.treatmentImage,
      description: 'High-quality dermal filler for volume restoration.',
      history: [
        InventoryHistory(
          date: DateTime.now().subtract(const Duration(days: 20)),
          quantity: 50,
          isAdded: true,
        ),
        InventoryHistory(
          date: DateTime.now().subtract(const Duration(days: 18)),
          quantity: 5,
          isAdded: false,
        ),
        InventoryHistory(
          date: DateTime.now().subtract(const Duration(days: 15)),
          quantity: 10,
          isAdded: false,
        ),
        InventoryHistory(
          date: DateTime.now().subtract(const Duration(days: 10)),
          quantity: 40,
          isAdded: true,
        ),
        InventoryHistory(
          date: DateTime.now().subtract(const Duration(days: 3)),
          quantity: 10,
          isAdded: false,
        ),
      ],
    ),
    InventoryItem(
      name: 'Syringes (100pk)',
      quantity: 20,
      price: 45.0,
      image: PngAssets.treatmentImage,
      description: 'Disposable sterile syringes, pack of 100.',
      history: [
        InventoryHistory(
          date: DateTime.now().subtract(const Duration(days: 25)),
          quantity: 50,
          isAdded: true,
        ),
        InventoryHistory(
          date: DateTime.now().subtract(const Duration(days: 22)),
          quantity: 10,
          isAdded: false,
        ),
        InventoryHistory(
          date: DateTime.now().subtract(const Duration(days: 20)),
          quantity: 15,
          isAdded: false,
        ),
        InventoryHistory(
          date: DateTime.now().subtract(const Duration(days: 18)),
          quantity: 30,
          isAdded: true,
        ),
        InventoryHistory(
          date: DateTime.now().subtract(const Duration(days: 15)),
          quantity: 20,
          isAdded: true,
        ),
      ],
    ),
    InventoryItem(
      name: 'Alcohol Swabs',
      quantity: 100,
      price: 10.0,
      image: PngAssets.treatmentImage,
      description: 'Pre-injection skin cleansing swabs.',
      history: [
        InventoryHistory(
          date: DateTime.now().subtract(const Duration(days: 30)),
          quantity: 200,
          isAdded: true,
        ),
        InventoryHistory(
          date: DateTime.now().subtract(const Duration(days: 25)),
          quantity: 50,
          isAdded: false,
        ),
        InventoryHistory(
          date: DateTime.now().subtract(const Duration(days: 20)),
          quantity: 100,
          isAdded: true,
        ),
        InventoryHistory(
          date: DateTime.now().subtract(const Duration(days: 15)),
          quantity: 20,
          isAdded: false,
        ),
        InventoryHistory(
          date: DateTime.now().subtract(const Duration(days: 10)),
          quantity: 30,
          isAdded: false,
        ),
      ],
    ),
    InventoryItem(
      name: 'Numbing Cream',
      quantity: 15,
      price: 35.0,
      image: PngAssets.treatmentImage,
      description: 'Topical anesthetic for skin procedures.',
      history: [
        InventoryHistory(
          date: DateTime.now().subtract(const Duration(days: 14)),
          quantity: 30,
          isAdded: true,
        ),
        InventoryHistory(
          date: DateTime.now().subtract(const Duration(days: 12)),
          quantity: 10,
          isAdded: false,
        ),
        InventoryHistory(
          date: DateTime.now().subtract(const Duration(days: 10)),
          quantity: 5,
          isAdded: false,
        ),
        InventoryHistory(
          date: DateTime.now().subtract(const Duration(days: 7)),
          quantity: 20,
          isAdded: true,
        ),
        InventoryHistory(
          date: DateTime.now().subtract(const Duration(days: 1)),
          quantity: 5,
          isAdded: false,
        ),
      ],
    ),
    InventoryItem(
      name: 'Gauze Pads',
      quantity: 200,
      price: 5.0,
      image: PngAssets.treatmentImage,
      description: 'Sterile cotton gauze pads.',
      history: [
        InventoryHistory(
          date: DateTime.now().subtract(const Duration(days: 40)),
          quantity: 500,
          isAdded: true,
        ),
        InventoryHistory(
          date: DateTime.now().subtract(const Duration(days: 35)),
          quantity: 100,
          isAdded: false,
        ),
        InventoryHistory(
          date: DateTime.now().subtract(const Duration(days: 30)),
          quantity: 250,
          isAdded: true,
        ),
        InventoryHistory(
          date: DateTime.now().subtract(const Duration(days: 15)),
          quantity: 50,
          isAdded: false,
        ),
        InventoryHistory(
          date: DateTime.now().subtract(const Duration(days: 5)),
          quantity: 50,
          isAdded: false,
        ),
      ],
    ),
    InventoryItem(
      name: 'Cooling Gel',
      quantity: 12,
      price: 25.0,
      image: PngAssets.treatmentImage,
      description: 'Post-treatment soothing cooling gel.',
      history: [
        InventoryHistory(
          date: DateTime.now().subtract(const Duration(days: 20)),
          quantity: 20,
          isAdded: true,
        ),
        InventoryHistory(
          date: DateTime.now().subtract(const Duration(days: 18)),
          quantity: 5,
          isAdded: false,
        ),
        InventoryHistory(
          date: DateTime.now().subtract(const Duration(days: 15)),
          quantity: 10,
          isAdded: true,
        ),
        InventoryHistory(
          date: DateTime.now().subtract(const Duration(days: 12)),
          quantity: 15,
          isAdded: true,
        ),
        InventoryHistory(
          date: DateTime.now().subtract(const Duration(days: 4)),
          quantity: 3,
          isAdded: false,
        ),
      ],
    ),
    InventoryItem(
      name: 'Latex Gloves',
      quantity: 500,
      price: 15.0,
      image: PngAssets.treatmentImage,
      description: 'Powder-free latex examination gloves.',
      history: [
        InventoryHistory(
          date: DateTime.now().subtract(const Duration(days: 50)),
          quantity: 1000,
          isAdded: true,
        ),
        InventoryHistory(
          date: DateTime.now().subtract(const Duration(days: 45)),
          quantity: 200,
          isAdded: false,
        ),
        InventoryHistory(
          date: DateTime.now().subtract(const Duration(days: 40)),
          quantity: 600,
          isAdded: true,
        ),
        InventoryHistory(
          date: DateTime.now().subtract(const Duration(days: 20)),
          quantity: 100,
          isAdded: false,
        ),
        InventoryHistory(
          date: DateTime.now().subtract(const Duration(days: 10)),
          quantity: 100,
          isAdded: false,
        ),
      ],
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

  void _addItemToInventory(InventoryItem newItem) {
    setState(() {
      final existingIndex = _dummyInventory.indexWhere(
        (item) => item.name == newItem.name,
      );
      if (existingIndex != -1) {
        _dummyInventory[existingIndex].quantity += newItem.quantity;
        _dummyInventory[existingIndex] = _dummyInventory[existingIndex]
            .copyWith(
              history: [
                ..._dummyInventory[existingIndex].history,
                InventoryHistory(
                  date: DateTime.now(),
                  quantity: newItem.quantity,
                  isAdded: true,
                ),
              ],
            );
      } else {
        // New item history
        newItem = newItem.copyWith(
          history: [
            InventoryHistory(
              date: DateTime.now(),
              quantity: newItem.quantity,
              isAdded: true,
            ),
          ],
        );
        _dummyInventory.add(newItem);
      }
      _filterInventory(_searchController.text);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${newItem.name} added to inventory'),
        backgroundColor: CustomColors.blueColor,
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
          onProductAdded: (item) {
            _addItemToInventory(item);
          },
        );
      },
    );
  }

  void _showInventoryDetailDialog(InventoryItem item) {
    showDialog(
      context: context,
      builder: (context) {
        return InventoryDetailDialog(item: item);
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
        return GestureDetector(
          onTap: () => _showInventoryDetailDialog(_filteredItems[index]),
          child: _buildInventoryCard(_filteredItems[index]),
        );
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
                          color: item.quantity < 20
                              ? CustomColors.errorColor
                              : CustomColors.silverColor,
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
