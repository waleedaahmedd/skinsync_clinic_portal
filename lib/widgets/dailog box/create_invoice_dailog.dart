import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinsync_clinic_portal/utils/assets.dart';
import 'package:skinsync_clinic_portal/utils/color_constant.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';

class CreateInvoiceDialog extends StatefulWidget {
  final String invoiceNumber;

  const CreateInvoiceDialog({super.key, required this.invoiceNumber});

  static void show(BuildContext context, {required String invoiceNumber}) {
    showDialog(
      context: context,
      builder: (_) => CreateInvoiceDialog(invoiceNumber: invoiceNumber),
    );
  }

  @override
  State<CreateInvoiceDialog> createState() => _CreateInvoiceDialogState();
}

class _CreateInvoiceDialogState extends State<CreateInvoiceDialog> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _products = [
    {'name': 'Product Name', 'price': 50.0, 'image': PngAssets.image},
    {'name': 'Product Name', 'price': 40.0, 'image': PngAssets.image},
    {'name': 'Product Name', 'price': 30.0, 'image': PngAssets.image},
  ];

  final double _platformFee = 1.00;

  double get _subtotal => _products.fold(0, (sum, p) => sum + p['price']);
  double get _total => _subtotal + _platformFee;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Create Invoice', style: CustomFonts.black22w600),
                    SizedBox(height: 4.h),
                    Text(
                      '#${widget.invoiceNumber}',
                      style: CustomFonts.grey14w400,
                    ),
                  ],
                ),
                Spacer(),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 36.w,
                    width: 36.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black26),
                    ),
                    child: Icon(Icons.close, size: 18.sp),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),

            /// Search
            CupertinoSearchTextField(
              style: CustomFonts.black17w500,
              backgroundColor: Color(0xFFF3F3F5),
            ),
            SizedBox(height: 16.h),

            /// Product List
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.28,
              child: SingleChildScrollView(
                child: Column(
                  children: _products
                      .map((product) => _ProductTile(product: product))
                      .toList(),
                ),
              ),
            ),

            Divider(height: 28.h, color: Colors.grey.shade300),

            /// Payment Summary
            Text('Payment Summary', style: CustomFonts.black18w600),
            SizedBox(height: 12.h),
            Container(
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  _summaryRow(
                    'Subtotal',
                    'AED ${_subtotal.toStringAsFixed(2)}',
                    isBold: false,
                  ),
                  Divider(height: 20.h, color: Colors.grey.shade200),
                  _summaryRow(
                    'Platform Fee',
                    'AED ${_platformFee.toStringAsFixed(2)}',
                    isBold: false,
                  ),
                  Divider(height: 20.h, color: Colors.grey.shade200),
                  _summaryRow(
                    'Total',
                    'AED ${_total.toStringAsFixed(2)}',
                    isBold: true,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),

            /// Buttons
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      decoration: BoxDecoration(
                        color: CustomColors.blackColor,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: Text(
                          'Send Invoice & Consent',
                          style: CustomFonts.white16w600,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12.w),
                Expanded(
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: CustomColors.greyColor),
                      ),
                      child: Center(
                        child: Text('Cancel', style: CustomFonts.black16w500),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _summaryRow(String label, String value, {required bool isBold}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isBold ? CustomFonts.black16w600 : CustomFonts.grey14w400,
        ),
        Text(
          value,
          style: isBold ? CustomFonts.black16w600 : CustomFonts.grey14w400,
        ),
      ],
    );
  }
}

class _ProductTile extends StatelessWidget {
  final Map<String, dynamic> product;

  const _ProductTile({required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.asset(
              product['image'],
              width: 52.w,
              height: 52.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product['name'], style: CustomFonts.black16w600),
              SizedBox(height: 4.h),
              Text(
                '\$ ${product['price'].toStringAsFixed(0)}',
                style: CustomFonts.black14w400.copyWith(color: Colors.orange),
              ),
            ],
          ),
          Spacer(),
          Icon(
            Icons.qr_code_scanner,
            size: 24.sp,
            color: CustomColors.blackColor,
          ),
        ],
      ),
    );
  }
}
