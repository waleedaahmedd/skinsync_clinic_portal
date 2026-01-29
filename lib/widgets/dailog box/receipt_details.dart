import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinsync_clinic_portal/utils/color_constant.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';

class ReceiptDialog extends StatelessWidget {
  const ReceiptDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        width: 374.w,
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 24),
                Text(
                  "Receipt Details",
                  style:CustomFonts.black24w600,
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 32.w,
                    width: 32.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black12),
                    ),
                    child: const Icon(Icons.close, size: 18),
                  ),
                ),
              ],
            ),

            SizedBox(height: 15.h),
            Divider(color: Colors.grey.shade200),

            SizedBox(height: 15.h),

            /// Receipt Card
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.r),
                        topRight: Radius.circular(20.r),
                      ),
              color: CustomColors.purpleColor.withValues(alpha: 0.4)
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Invoice ID #587456",
                          style: CustomFonts.black15w600
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "25 Dec, 08:00PM",
                          style: CustomFonts.grey14w400
                        ),

                        SizedBox(height: 78.h),

                        Text(
                          "Payment Details",
                          style: CustomFonts.black15w600
                        ),
                        SizedBox(height: 16.h),

                        _row("Botox", "\$ 58.96"),
                        SizedBox(height: 16.h),
                        _row("Subtotal", "\$ 58.96"),
                        SizedBox(height: 16.h),
                        _row("Platform Fee", "\$ 58.96"),
                      ],
                    ),
                  ),

                  /// Bottom Total Bar
               ],
              ),
            ),
                Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 18.w, vertical: 16.h),
                    decoration: BoxDecoration(
                      color:CustomColors.purpleColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.r),
                        bottomRight: Radius.circular(20.r),
                      ),
                    ),
                    child: _row(
                      "Total",
                      "\$ 58.96",
                      isBold: true,
                    ),
                  ),
               
              SizedBox(height: 10.h,)
          ],
        ),
      ),
    );
  }

  Widget _row(String left, String right, {bool isBold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          left,
          style: isBold? CustomFonts.black16w700 : CustomFonts.black14w400
        ),
        Text(
          right,
         style: isBold? CustomFonts.black16w700 : CustomFonts.black14w400
        ),
      ],
    );
  }
}
