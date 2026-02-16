import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';
import 'package:skinsync_clinic_portal/utils/theme.dart';

class PatientSelectionTile extends StatelessWidget {
  final String title;
  final String? subTitle;
  final String? imageUrl;
  const PatientSelectionTile({
    super.key,
    required,
    required this.title,
    this.subTitle,
    this.imageUrl,
  });

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
          if (imageUrl != null)
            ClipOval(
              child: Image.network(imageUrl!, height: 63.w, width: 63.w),
              // child: Image.asset(PngAssets.person, height: 63.w, width: 63.w),
            )
          else
            CircleAvatar(
              radius: 63.w / 2,
              child: Icon(Icons.person, size: 30.sp),
            ),
          SizedBox(width: 15.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SelectableText(title, style: CustomFonts.black22w600),
              if (subTitle != null)
                SelectableText(subTitle ?? "", style: CustomFonts.black13w400),
            ],
          ),
        ],
      ),
    );
  }
}
