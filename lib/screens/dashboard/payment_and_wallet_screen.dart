import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/assets.dart';
import '../../utils/theme.dart';
import '../../widgets/transcation_tile_widget.dart';

class PaymentAndWalletScreen extends StatelessWidget {
  static const String routeName = '/payment-and-wallet';
  const PaymentAndWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Text(
              'Patient Management',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 14.h),
            Divider(color: AppTheme.fillCOlor),
            SizedBox(height: 20.h),
            walletInfo(),
            SizedBox(height: 10.h),
            Text(
              "Payments are processed securely through Stripe. All transactions are encrypted and compliant with PCI DSS and HIPAA standards.",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppTheme.textSecondary,
              ),
            ),
            SizedBox(height: 20.h),
            totalEraning(),
            SizedBox(height: 20.h),
            searchAndFilter(),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Transactions",
                  style: TextStyle(
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textPrimary,
                  ),
                ),
                Text(
                  "View All",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.textPrimary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            ListView.separated(
              separatorBuilder: (context, index) {
                return SizedBox(height: 15.h);
              },
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return TranscationTileWidget();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget walletInfo() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 50.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color(0xFF0C3987), Color(0xFF6B0DAE)],
        ),
      ),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                "Available Balance",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              Text(
                "\$ 228,565",
                style: TextStyle(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Spacer(),
          Icon(
            CupertinoIcons.arrowtriangle_up_fill,
            size: 14.sp,
            color: AppTheme.greenColor,
          ),
          SizedBox(width: 10.w),
          Text(
            "\$ 20,600 ",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppTheme.greenColor,
            ),
          ),
          Text(
            "Last Week ",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 20.w),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 13.5.w, vertical: 8.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Colors.white,
            ),
            child: Row(
              children: [
                SvgPicture.asset(
                  SvgAssets.withdraw,
                  color: AppTheme.purpleColor,
                  height: 14.h,
                  width: 16.47.w,
                ),
                SizedBox(width: 8.w),
                Text(
                  "Withdraw Balance",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: AppTheme.purpleColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget totalEraning() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: AppTheme.primaryColor,
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "\$ 4500",
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textPrimary,
                ),
              ),
              Text(
                "Today’s Earnings",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.textSecondary,
                ),
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Next Deposit Will Be ",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.textSecondary,
                ),
              ),
              Text(
                "Added After 12:00 am",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.textSecondary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget searchAndFilter() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                size: 19.sp,
                color: AppTheme.textSecondary,
              ),
              hintText: "Search Patients...",
            ),
          ),
        ),
        SizedBox(width: 8.w),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.white,
            border: Border.all(color: AppTheme.fillCOlor),
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
              Text(
                "All Status",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.textSecondary,
                ),
              ),
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
