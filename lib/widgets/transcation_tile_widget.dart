import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/theme.dart';

class TranscationTileWidget extends StatelessWidget {
  const TranscationTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: AppTheme.fillCOlor),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFE0E7FF),
            ),
            child: Icon(
              Icons.article_rounded,
              size: 24.sp,
              color: AppTheme.purpleColor,
            ),
          ),
          SizedBox(width: 30.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sarah Johnson",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: AppTheme.textPrimary,
                ),
              ),
              Text(
                "Botox",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500),
              ),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today,
                    size: 16.sp,
                    color: AppTheme.textSecondary,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    "10/29/2025",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Icon(
                    Icons.access_time,
                    size: 16.sp,
                    color: AppTheme.textSecondary,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    "3:00 PM",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Spacer(),
          Text(
            "\$350",
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.w600,
              color: Color(0xFF312C85),
            ),
          ),
          SizedBox(width: 10.w),
          Container(
            padding: EdgeInsets.all(7.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: AppTheme.fillCOlor),
            ),
            child: Icon(
              Icons.file_download_outlined,
              size: 16.sp,
              color: AppTheme.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
