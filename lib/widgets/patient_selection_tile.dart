import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';
import 'package:skinsync_clinic_portal/utils/theme.dart';

class PatientSelectionTile extends StatelessWidget {
  final String title;
  final String? subTitle;
  final String? imageUrl;
  final bool isSelected;
  const PatientSelectionTile({
    super.key,
    required,
    required this.title,
    this.subTitle,
    this.imageUrl,

    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(
          color: isSelected ? AppTheme.primaryColor : AppTheme.titleBorderColor,
          width: isSelected ? 2.r : 1.r,
        ),
      ),
      child: Row(
        children: [
          if (imageUrl != null)
            ClipOval(
              child: CachedNetworkImage(
                imageUrl: imageUrl!,
                fit: BoxFit.cover,
                height: 63.w,
                width: 63.w,
                errorWidget: (_, error, s) {
                  if (imageUrl!.contains('alyssa')) {
                    log('ERROR: $error');
                  }
                  return _buildPlaceholder();
                },
              ),
            )
          else
            _buildPlaceholder(),
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

  CircleAvatar _buildPlaceholder() {
    return CircleAvatar(
      radius: 63.w / 2,
      child: Icon(Icons.person, size: 30.sp),
    );
  }
}
