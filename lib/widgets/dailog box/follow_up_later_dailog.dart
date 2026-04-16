
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skinsync_clinic_portal/utils/assets.dart';
import 'package:skinsync_clinic_portal/utils/color_constant.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';


class FollowUpLater extends StatelessWidget {
  const FollowUpLater({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        width: 360.w,
        padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Header
      
             Center(child: Image.asset(PngAssets.appointmentCalendar,height: 66.h,width: 60.w,)),
            SizedBox(height: 30.h,),
          Center(child: Text("Do you want to schedule follow-up appointment now or do it later ?",
          textAlign: TextAlign.center,
          style: CustomFonts.black18w500,)),
            SizedBox(height: 30,),
           Row(
             children: [
               Expanded(
                 child: GestureDetector(
                  onTap :() {},
                   child: Container(
                   alignment: .center,
                    padding: EdgeInsets.symmetric(vertical: 13.h),
                    decoration: BoxDecoration(
                      color: CustomColors.blackColor,
                      borderRadius: BorderRadius.circular(30.r)
                    ),
                    child: Text("Yes",style: CustomFonts.white18w600,),
                   ),
                 ),
               ),
               SizedBox(width: 10.w,),
               Expanded(
                 child: GestureDetector(
                  onTap :() {},
                   child: Container(
                   alignment: .center,
                    padding: EdgeInsets.symmetric(vertical: 13.h),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(30.r)
                    ),
                    child: Text("No",style: CustomFonts.black18w600,),
                   ),
                 ),
               ),
             ],
           )
             ],
        ),
      ),
    );
  }

}
