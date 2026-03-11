import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinsync_clinic_portal/utils/color_constant.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';
import 'package:skinsync_clinic_portal/widgets/borderd_container_widget.dart';

class AppointmentTileWidget extends StatelessWidget {
  const AppointmentTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BorderdContainerWidget(
      margin: EdgeInsets.only(bottom: 15.h),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: CustomColors.lightBlueColor.withValues(alpha: 0.3),
            ),
            padding: EdgeInsets.all(12.w),
            margin: EdgeInsets.symmetric(horizontal: 14.w),
            child: Icon(
              Icons.event_outlined,
              color: CustomColors.lightBlueColor,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Sarah Johnson", style: CustomFonts.black17w600),
                  SizedBox(width: 10.w),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: CustomColors.blackColor,
                    ),
                    padding: EdgeInsets.all(9.w),
                    child: Text("Completed", style: CustomFonts.white13w400),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Text("Botox", style: CustomFonts.black17w500),
              SizedBox(height: 7.h),
              Row(
                children: [
                  Icon(
                    Icons.event_outlined,
                    size: 17.sp,
                    color: CustomColors.blackColor,
                  ),
                  SizedBox(width: 5.w),
                  Text("10/29/2025", style: CustomFonts.black17w500),
                  SizedBox(width: 10.w),
                  Icon(
                    Icons.schedule,
                    size: 17.sp,
                    color: CustomColors.blackColor,
                  ),
                  SizedBox(width: 5.w),
                  Text("10:00 AM", style: CustomFonts.black17w500),
                ],
              ),
            ],
          ),
          Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "\$350",
                style: CustomFonts.black21w600.copyWith(
                  color: CustomColors.lightBlueColor,
                ),
              ),
              SizedBox(height: 14.h),
              Text("Dr. Smith", style: CustomFonts.black17w500),
            ],
          ),
        ],
      ),
    );
  }
}
