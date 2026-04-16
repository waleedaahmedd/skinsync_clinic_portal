import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/custom_fonts.dart';

class SuccessDialog extends StatelessWidget {
  final String title;
  final String description;
  final Widget? icon;

  const SuccessDialog({
    super.key,
    this.title = 'Successfully Booked',
    this.description =
        'Lorem ipsum dolor sit amet consectetur Ut consectetur mauris tellus ultricies.',
    this.icon,
  });

  static void show(
    BuildContext context, {
    String? title,
    String? description,
    Widget? icon,
  }) {
    showDialog(
      context: context,
      builder: (_) => SuccessDialog(
        title: title ?? 'Successfully Booked',
        description:
            description ??
            'Lorem ipsum dolor sit amet consectetur Ut consectetur mauris tellus ultricies.',
        icon: icon,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 28.h, horizontal: 24.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Close button
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  height: 32.w,
                  width: 32.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black26),
                  ),
                  child: Icon(Icons.close, size: 16.sp),
                ),
              ),
            ),
            SizedBox(height: 8.h),

            /// Icon
            Container(
              width: 90.w,
              height: 90.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade100,
              ),
              child:
                  icon ??
                  Icon(
                    Icons.calendar_month_rounded,
                    size: 48.sp,
                    color: Colors.blueAccent,
                  ),
            ),
            SizedBox(height: 20.h),

            /// Title
            Text(
              title,
              style: CustomFonts.black20w600,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10.h),

            /// Description
            Text(
              description,
              style: CustomFonts.grey14w400,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}
