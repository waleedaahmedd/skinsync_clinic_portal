import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skinsync_clinic_portal/utils/assets.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';
import 'package:skinsync_clinic_portal/utils/theme.dart';
import 'package:skinsync_clinic_portal/widgets/transcation_tile_widget.dart';

class PaymentHistoryScreen extends StatelessWidget {
  static const String routeName = '/payment-history';
  const PaymentHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.arrow_back, size: 24.sp),
                SizedBox(width: 10.w),
                Text("Transaction History", style: CustomFonts.black22w600),
              ],
            ),
            SizedBox(height: 18.h),
            Divider(color: Colors.grey.shade300),
            SizedBox(height: 17.h),
            searchAndFilter(),
            SizedBox(height: 20.h),
            Text("Transactions", style: CustomFonts.black22w600),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom:  15.0.h),
                    child: TranscationTileWidget(),
                  ); },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchAndFilter() {
    return Row(
      children: [
        Expanded(
          child: CupertinoSearchTextField(backgroundColor: Color(0xFFF3F3F5)),
        ),
        SizedBox(width: 8.w),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Row(
            children: [
              SvgPicture.asset(
                SvgAssets.filter,
                height: 12.67.h,
                width: 13.33.w,
                color: AppTheme.textSecondary,
              ),
              SizedBox(width: 10.w),
              Text("All Status", style: CustomFonts.grey18w500),
              SizedBox(width: 10.w),
              Icon(
                CupertinoIcons.chevron_down,
                size: 16.sp,
                color: AppTheme.textSecondary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
