import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TreatmentStatsCard extends StatelessWidget {
  final String revenue;
  final String percentage;
  final String percentageChange;
  final String mainLabel;
  final String treatmentName;
  final String originalPrice;
  final String discountedPrice;
  final String description;
  final String buttonText;
  final double progress;
  final Gradient cardGradient;
  final VoidCallback? onButtonPressed;

  const TreatmentStatsCard({
    super.key,
    required this.revenue,
    required this.percentage,
    required this.percentageChange,
    required this.mainLabel,
    required this.treatmentName,
    required this.originalPrice,
    required this.discountedPrice,
    required this.description,
    required this.buttonText,
    required this.progress,
    this.cardGradient = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color(0xff92FFCE), Color(0xffD8FFED)],
    ),
    this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 400.w,
      // margin: EdgeInsets.only(right: 16.w),
      padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 28.w),
      decoration: BoxDecoration(
        gradient: cardGradient,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Section: Circle Progress and Stats
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Circular Progress Indicator
              SizedBox(
                width: 85.w,
                height: 85.w,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: 85.w,
                      height: 85.w,
                      child: CircularProgressIndicator(
                        value: progress,
                        strokeWidth: 14.w,
                        backgroundColor: Colors.white.withOpacity(0.4),
                        valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xffEEA1F0),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          revenue,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          'Revenue',
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // CustomCircularIndicator(progress: 0.72),
              SizedBox(width: 24.w),
              // Percentage Stats
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          percentage,
                          style: TextStyle(
                            fontSize: 37.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                            height: 0.9,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Padding(
                          padding: EdgeInsets.only(top: 6.h),
                          child: Text(
                            percentageChange,
                            style: TextStyle(
                              fontSize: 17.sp,
                              height: 0,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF66BB6A),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      mainLabel,
                      style: TextStyle(
                        fontSize: 17.sp,
                        height: 0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 19.h),
          // Treatment Name and Price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                treatmentName,
                style: TextStyle(
                  fontSize: 22.sp,
                  height: 0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              Text(
                "$originalPrice > $discountedPrice",
                style: TextStyle(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          // Description
          Text(
            description,
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.grey[800],
              height: 1.5,
              fontWeight: FontWeight.w400,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 20.h),
          // Button
          GestureDetector(
            onTap: onButtonPressed,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 28.w),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    buttonText,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
