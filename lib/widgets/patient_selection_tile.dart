import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinsync_clinic_portal/utils/assets.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';
import 'package:skinsync_clinic_portal/utils/theme.dart';

class PatientSelectionTile extends StatelessWidget {
  final String title;
  final String? subTitle;
  const PatientSelectionTile({super.key,required,required this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: AppTheme.titleBorderColor),
      ),
      child: Row(
        children: [
          ClipOval(
            child: Image.asset(PngAssets.person, height: 63.w, width: 63.w),
          ),
          SizedBox(width: 15.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: CustomFonts.black22w600),
              if(subTitle != null)
              Text(subTitle ?? "", style: CustomFonts.black13w400),
            ],
          ),
        ],
      ),
    );
  }
}
