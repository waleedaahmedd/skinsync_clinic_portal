import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinsync_clinic_portal/utils/assets.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';
import 'package:skinsync_clinic_portal/utils/theme.dart';

class PatientSelectionTile extends StatelessWidget {
  const PatientSelectionTile({super.key,required});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: AppTheme.titleBorderColor),
      ),
      child: Row(
        children: [
          ClipOval(
            child: Image.asset(PngAssets.person, height: 62.w, width: 62.w),
          ),
          SizedBox(width: 15.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Sarah Johnson", style: CustomFonts.black22w600),
              Text("sarah.johnson@email.com", style: CustomFonts.black13w400),
            ],
          ),
        ],
      ),
    );
  }
}
