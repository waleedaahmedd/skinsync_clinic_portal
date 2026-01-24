import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinsync_clinic_portal/utils/color_constant.dart';

import '../utils/assets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 101.h,
      color: CustomColors.whiteColor,
      constraints: BoxConstraints(minHeight: 101.h),
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Row(
        children: [
          Image.asset(PngAssets.splashLogo, width: 48.w, height: 48.w),
          SizedBox(width: 5.w),
          Image.asset(PngAssets.logo, height: 20.h),
          SizedBox(width: 40.w),
          SizedBox(
            width: 380.w,
            child: CupertinoSearchTextField(backgroundColor: Color(0xFFF3F3F5)),
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.bell, size: 24.sp),
          ),
          SizedBox(width: 30.w),
          ClipOval(
            child: Image.asset(PngAssets.person, width: 44.w, height: 44.w),
          ),
          SizedBox(width: 20.w),
          Text(
            'Scarlet Fox',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.sp,
              color: CustomColors.blackColor,
            ),
          ),
          SizedBox(width: 20.w),
          Icon(
            Icons.arrow_drop_down_circle_outlined,
            size: 18.sp,
            color: CustomColors.blackColor,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 101.h);
}
