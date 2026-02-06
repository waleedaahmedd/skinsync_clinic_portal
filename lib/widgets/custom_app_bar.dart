import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinsync_clinic_portal/utils/color_constant.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';

import '../utils/assets.dart';
import '../utils/responsive.dart';

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
        mainAxisSize: MainAxisSize.min,
        children: [
          context.isLandscape
              ? SizedBox(
                  width: 380.r,
                  child: CupertinoSearchTextField(
                    backgroundColor: Color(0xFFF3F3F5),
                  ),
                )
              : _buildMobileActions(context),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.bell, size: 24.r),
          ),
          context.isLandscape ? SizedBox(width: 30.r) : SizedBox.shrink(),
          context.isLandscape
              ? ClipOval(
                  child: Image.asset(
                    PngAssets.person,
                    width: 44.r,
                    height: 44.r,
                  ),
                )
              : SizedBox.shrink(),

          context.isLandscape
              ? Row(
                  children: [
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
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget _buildMobileActions(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: Icon(Icons.menu),
        ),
        SizedBox(width: 10.w),
        context.isLandscape
            ? Image.asset(PngAssets.splashLogo, width: 48.r, height: 48.r)
            : ClipOval(
                child: Image.asset(PngAssets.person, width: 44.r, height: 44.r),
              ),
        SizedBox(width: 5.w),
        Text("Scarlet Fox", style: CustomFonts.black22w600,),
        SizedBox(width: 40.w),
      ],
    );
  }

  @override
  Size get preferredSize => Size(double.infinity, 101.h);
}
