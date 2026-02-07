import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skinsync_clinic_portal/app_init.dart';
import 'package:skinsync_clinic_portal/utils/responsive.dart';

import '../../utils/assets.dart';
import '../../widgets/treatment_stats_card_widget.dart';

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
              _buildWelcomeBanner(),
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
                    _buildAnalyticsGrid(),
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
                    _buildAppointmentsList(),
                  ],
                ),
              ),
              SizedBox(height: 30.h),
              recentClientsWidget(),
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
                    _aiRowWidget(stats: treatmentStats),
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
                    _recentTreatmentRowWidget(),
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

  Widget _aiRowWidget({required List<Map<String, dynamic>> stats}) {
    return AdaptiveLayoutList(
      horizontalHeight: 400.r,
      spaceHeight: 20.h,
      spaceWidth: 20.w,
      isScrollVertical: false,
      children: [
        TreatmentStatsCard(
          cardGradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xffD8F7FF), Color(0xff8BE7FF)],
          ),
          revenue: stats[2]['revenue'],
          percentage: stats[2]['percentage'],
          percentageChange: stats[2]['percentageChange'],
          mainLabel: stats[2]['mainLabel'],
          treatmentName: stats[2]['treatmentName'],
          originalPrice: stats[2]['originalPrice'],
          discountedPrice: stats[2]['discountedPrice'],
          description: stats[2]['description'],
          buttonText: stats[2]['buttonText'],
          progress: stats[2]['progress'],
          onButtonPressed: () {},
        ),
        TreatmentStatsCard(
          cardGradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xff88E3FB), Color(0xffEEA1F0)],
          ),
          revenue: stats[1]['revenue'],
          percentage: stats[1]['percentage'],
          percentageChange: stats[1]['percentageChange'],
          mainLabel: stats[1]['mainLabel'],
          treatmentName: stats[1]['treatmentName'],
          originalPrice: stats[1]['originalPrice'],
          discountedPrice: stats[1]['discountedPrice'],
          description: stats[1]['description'],
          buttonText: stats[1]['buttonText'],
          progress: stats[1]['progress'],
          onButtonPressed: () {},
        ),
        TreatmentStatsCard(
          cardGradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xffD8FFED), Color(0xff92FFCE)],
          ),
          revenue: stats[0]['revenue'],
          percentage: stats[0]['percentage'],
          percentageChange: stats[0]['percentageChange'],
          mainLabel: stats[0]['mainLabel'],
          treatmentName: stats[0]['treatmentName'],
          originalPrice: stats[0]['originalPrice'],
          discountedPrice: stats[0]['discountedPrice'],
          description: stats[0]['description'],
          buttonText: stats[0]['buttonText'],
          progress: stats[0]['progress'],
          onButtonPressed: () {},
        ),
      ],
    );
  }

  Widget _buildWelcomeBanner() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF7DD3D3), Color(0xFF9BA7D4)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Welcome back, John Smith! 👋",
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 6.h),
          Text(
            "Here's what's happening at your clinic today",
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnalyticsGrid() {
    return Column(
      children: [
        AdaptiveLayoutRowColumn(
          expandedWidget: true,
          children: [
            _buildAnalyticsCard(
              icon: Icons.calendar_today_outlined,
              iconColor: Color(0xFF7DD3D3),
              bgColor: Color(0xFFE8F6F6),
              value: "101",
              label: "Completed Appointments",
            ),
            _buildAnalyticsCard(
              icon: Icons.schedule_outlined,
              iconColor: Color(0xFFE89FD5),
              bgColor: Color(0xFFFCEFF9),
              value: "101",
              label: "Pending Appointments",
            ),
            _buildAnalyticsCard(
              icon: Icons.cancel_outlined,
              iconColor: Color(0xFFFF9B9B),
              bgColor: Color(0xFFFFEDED),
              value: "101",
              label: "Cancelled Appointments",
            ),
          ],
        ),
        SizedBox(height: 20.h,),
        AdaptiveLayoutRowColumn(
          expandedWidget: true,
          children: [
            _buildAnalyticsCard(
              icon: Icons.medical_services_outlined,
              iconColor: Color(0xFF7DD3D3),
              bgColor: Color(0xFFE8F6F6),
              value: "1000",
              label: "Total Treatments",
            ),
            _buildAnalyticsCard(
              icon: Icons.star_outline,
              iconColor: Color(0xFFFFB366),
              bgColor: Color(0xFFFFF3E8),
              value: "4.5",
              label: "Ratings",
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAnalyticsCard({
    required IconData icon,
    required Color iconColor,
    required Color bgColor,
    required String value,
    required String label,
  }) {
    return Container(
      width: double.infinity,
      // constraints: BoxConstraints(
      //   minWidth: navigatorKey.currentContext!.isLandscape ? 0.238.sw : 1.sw,
      // ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 44.w,
            width: 44.w,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
            child: Icon(icon, color: iconColor, size: 23.sp),
          ),
          SizedBox(width: 12.w),
          Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAppointmentsList() {
    final appointments = [
      {
        'title': 'Botox Treatment',
        'date': 'October 20, 2023, 10:00 AM',
        'price': '\$240',
        'image': PngAssets.treatmentImage,
      },
      {
        'title': 'Laser Treatment',
        'date': 'October 20, 2023, 10:00 AM',
        'price': '\$240',
        'image': PngAssets.treatmentImage,
      },
      {
        'title': 'Chemical Peels',
        'date': 'October 20, 2023, 10:00 AM',
        'price': '\$240',
        'image': PngAssets.treatmentImage,
      },
    ];
    return AdaptiveLayoutList(
      isScrollVertical: false,
      horizontalHeight: 268.r,
      spaceWidth: 20.w,
      spaceHeight: 20.h,
      children: List.generate(appointments.length, (index) {
        return _buildTreatmentCard(
          title: appointments[index]['title']!,
          date: appointments[index]['date']!,
          image: appointments[index]['image']!,
        );
      }),
    );
  }

  Widget recentClientsWidget() {
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row 1: Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recent Clients",
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
          AdaptiveLayoutList(
            isScrollVertical: false,
            spaceHeight: 20.h,
            spaceWidth: 20.w,
            horizontalHeight: 80.r,
            children: [_clientItem(), _clientItem(), _clientItem()],
          ),
        ],
      ),
    );
  }

  Widget _clientItem() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: Color(0xFFECFEFF),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 45.r,
            backgroundImage: AssetImage(PngAssets.person),
          ),
          SizedBox(width: 8.w),
          Text(
            "John Smith",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _recentTreatmentRowWidget() {
    final appointments = [
      {
        'title': 'Botox Treatment',
        'date': 'October 20, 2023, 10:00 AM',
        'image': PngAssets.treatmentImage,
        'nextAppointment': 'Next appointment in 4 hours',
      },
      {
        'title': 'Laser Treatment',
        'date': 'October 20, 2023, 10:00 AM',
        'image': PngAssets.treatmentImage,
        'nextAppointment': 'Next appointment in 4 hours',
      },
      {
        'title': 'Chemical Peels',
        'date': 'October 20, 2023, 10:00 AM',
        'image': PngAssets.treatmentImage,
        'nextAppointment': 'Next appointment in 4 hours',
      },
    ];

    return AdaptiveLayoutList(
      isScrollVertical: false,
      horizontalHeight: 268.r,
      spaceWidth: 20.w,
      spaceHeight: 20.h,
      children: List.generate(appointments.length, (index) {
        return _buildRecentTreatmentCard(
          title: appointments[index]['title']!,
          date: appointments[index]['date']!,
          image: appointments[index]['image']!,
          nextAppointment: appointments[index]['nextAppointment']!,
        );
      }),
    );
  }

  Widget _buildTreatmentCard({
    required String title,
    required String date,
    String? price,
    required String image,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.asset(
              image,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: Color(0xFFE8E8E8),
                child: Icon(Icons.broken_image, color: Colors.grey),
              ),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              price ?? '',
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
        SizedBox(height: 6.h),
        Text(
          date,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: Colors.grey.shade600,
          ),
        ),
        SizedBox(height: 6.h),
        Row(
          children: [
            Icon(Icons.attach_file, size: 14.sp, color: Colors.grey.shade600),
            SizedBox(width: 4.w),
            Text(
              "Attached AI Model",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRecentTreatmentCard({
    required String title,
    required String date,
    required String image,
    required String nextAppointment,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Color(0xFFE8E8E8),
                    child: Icon(Icons.broken_image, color: Colors.grey),
                  ),
                ),
              ),
              Positioned(
                top: 12.h,
                right: 12.w,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.9),
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Text(
                    nextAppointment,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          title,
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 6.h),
        Text(
          date,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: Colors.grey.shade600,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(height: 6.h),
        Row(
          children: [
            Text(
              "\$800 \$650",
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: Colors.grey.shade600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ],
    );
  }
}
