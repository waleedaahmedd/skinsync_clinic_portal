import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';

class SuccessfullyWithdrawalDailogBox extends StatelessWidget {
  const SuccessfullyWithdrawalDailogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 360.w),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 24.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24.r),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 32.w,
                      width: 32.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black12),
                      ),
                      child: const Icon(Icons.close, size: 18),
                    ),
                  ),
                ),
                ClipOval(
                  child: Container(
                    height: 125.w,
                    width: 125.w,
                    color: Colors.grey.shade300,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  "Successfully Withdrawal!",
                  style: CustomFonts.black30w600,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.h),
                Text(
                  "Lorem ipsum dolor sit amet consectetur. Ut consectetur mauris tellus ultricies.",
                  style: CustomFonts.black18w400,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
