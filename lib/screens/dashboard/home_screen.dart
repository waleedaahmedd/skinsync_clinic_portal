import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/assets.dart';
import '../../widgets/welcome_banner_widget.dart';
import '../../widgets/analytics_grid_widget.dart';
import '../../widgets/appointments_list_widget.dart';
import '../../widgets/recent_clients_widget.dart';
import '../../widgets/recent_treatment_row_widget.dart';
import '../../widgets/ai_row_widget.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';

  HomeScreen({super.key});

  final List<Map<String, dynamic>> treatmentStats = [
    {
      'revenue': '\$28k+',
      'percentage': '88%',
      'percentageChange': '+6%',
      'mainLabel': 'Sales Improve',
      'treatmentName': 'Botox Treatment',
      'originalPrice': '\$240',
      'discountedPrice': '\$220',
      'description':
          'Lorem ipsum is a dummy or placeholder text commonly used in graphic design, publishing, and web development to fill empty.',
      'buttonText': 'Update Pricing',
      'progress': 0.88,
    },
    {
      'revenue': '\$32k+',
      'percentage': '92%',
      'percentageChange': '+8%',
      'mainLabel': 'Revenue Growth',
      'treatmentName': 'Laser Treatment',
      'originalPrice': '\$350',
      'discountedPrice': '\$310',
      'description':
          'Advanced laser technology for skin rejuvenation and treatment. Experience professional care with visible results and satisfaction.',
      'buttonText': 'Update Pricing',
      'progress': 0.92,
    },
    {
      'revenue': '\$25k+',
      'percentage': '85%',
      'percentageChange': '+5%',
      'mainLabel': 'Customer Satisfaction',
      'treatmentName': 'Facial Treatment',
      'originalPrice': '\$180',
      'discountedPrice': '\$160',
      'description':
          'Rejuvenating facial treatments designed to refresh and revitalize your skin with premium products and expert techniques.',
      'buttonText': 'Update Pricing',
      'progress': 0.85,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              // Welcome Banner
              const WelcomeBannerWidget(),
              SizedBox(height: 24.h),

              // Analytics Section
              Container(
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8.r,
                      offset: Offset(0, 2.h),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      "Analytics",
                      style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    const AnalyticsGridWidget(),
                  ],
                ),
              ),
              SizedBox(height: 32.h),
              // Upcoming Appointments Section
              Container(
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8.r,
                      offset: Offset(0, 2.h),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            "Upcoming Appointments",
                            style: TextStyle(
                              fontSize: 22.spMin,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(width: 20.w),
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              Text(
                                "View All",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(width: 6.w),
                              Icon(
                                CupertinoIcons.arrow_right,
                                size: 14.sp,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 18.h),
                    const AppointmentsListWidget(),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              const RecentClientsWidget(),
              SizedBox(height: 30.h),
              Container(
                padding: EdgeInsets.all(20.w),
                decoration: BoxDecoration(
                  color: Color(0xFFFAF5FF),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8.r,
                      offset: Offset(0, 2.h),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          SvgAssets.aiStar,
                          width: 19.w,
                          height: 19.w,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          "Ai recommendations",
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 18.h),
                    AiRowWidget(stats: treatmentStats),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8.r,
                      offset: Offset(0, 2.h),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Column(
                  crossAxisAlignment: .start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recent Treatments",
                          style: TextStyle(
                            fontSize: 22.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              Text(
                                "View All",
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(width: 6.w),
                              Icon(
                                CupertinoIcons.arrow_right,
                                size: 14.sp,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 18.h),
                    const RecentTreatmentRowWidget(),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
