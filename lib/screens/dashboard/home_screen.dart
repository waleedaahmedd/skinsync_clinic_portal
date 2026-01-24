import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

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
                        Text(
                          "Upcoming Appointments",
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
    return Row(
      spacing: 20.w,
      children: [
        Expanded(
          child: TreatmentStatsCard(
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
        ),

        Expanded(
          child: TreatmentStatsCard(
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
        ),
        Expanded(
          child: TreatmentStatsCard(
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
        ),
      ],
    );
  }

  Widget _buildWelcomeBanner() {
    return Container(
      width: double.infinity,
      // margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
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
        Row(
          children: [
            Expanded(
              child: _buildAnalyticsCard(
                icon: Icons.calendar_today_outlined,
                iconColor: Color(0xFF7DD3D3),
                bgColor: Color(0xFFE8F6F6),
                value: "101",
                label: "Completed Appointments",
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: _buildAnalyticsCard(
                icon: Icons.schedule_outlined,
                iconColor: Color(0xFFE89FD5),
                bgColor: Color(0xFFFCEFF9),
                value: "101",
                label: "Pending Appointments",
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: _buildAnalyticsCard(
                icon: Icons.cancel_outlined,
                iconColor: Color(0xFFFF9B9B),
                bgColor: Color(0xFFFFEDED),
                value: "101",
                label: "Cancelled Appointments",
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            Expanded(
              child: _buildAnalyticsCard(
                icon: Icons.medical_services_outlined,
                iconColor: Color(0xFF7DD3D3),
                bgColor: Color(0xFFE8F6F6),
                value: "1000",
                label: "Total Treatments",
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: _buildAnalyticsCard(
                icon: Icons.star_outline,
                iconColor: Color(0xFFFFB366),
                bgColor: Color(0xFFFFF3E8),
                value: "4.5",
                label: "Ratings",
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(child: SizedBox()), // Empty space for alignment
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
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 44.w,
            width: 44.w,
            padding: EdgeInsets.all(10.w),
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
        'image': PngAssets.treatmentImage2,
      },
      {
        'title': 'Chemical Peels',
        'date': 'October 20, 2023, 10:00 AM',
        'price': '\$240',
        'image': PngAssets.treatmentImage,
      },
    ];

    return SizedBox(
      height: 295.h,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: appointments.length,
        scrollDirection: Axis.horizontal,
        // padding: EdgeInsets.only(left: 16.w),
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 17.w),
            child: _buildTreatmentCard(
              title: appointments[index]['title']!,
              date: appointments[index]['date']!,
              // price: appointments[index]['price']!,
              image: appointments[index]['image']!,
            ),
          );
        },
      ),
    );
  }

  // Widget _buildRecentTreatmentRow() {
  //   final appointments = [
  //     {
  //       'title': 'Botox Treatment',
  //       'date': 'October 20, 2023, 10:00 AM',
  //       'price': '\$240',
  //       'image': PngAssets.treatmentImage,
  //     },
  //     {
  //       'title': 'Laser Treatment',
  //       'date': 'October 20, 2023, 10:00 AM',
  //       'price': '\$240',
  //       'image': PngAssets.treatmentImage2,
  //     },
  //     {
  //       'title': 'Chemical Peels',
  //       'date': 'October 20, 2023, 10:00 AM',
  //       'price': '\$240',
  //       'image': PngAssets.treatmentImage,
  //     },
  //   ];
  //
  //   return SizedBox(
  //     height: 320.h,
  //     child: ListView.builder(
  //       shrinkWrap: true,
  //       itemCount: appointments.length,
  //       scrollDirection: Axis.horizontal,
  //       // padding: EdgeInsets.only(left: 16.w),
  //       itemBuilder: (context, index) {
  //         return Padding(
  //           padding: EdgeInsets.only(right: 17.w),
  //           child: _buildRecentTreatmentCard(
  //             title: appointments[index]['title']!,
  //             date: appointments[index]['date']!,
  //             // price: appointments[index]['price']!,
  //             image: appointments[index]['image']!,
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

  Widget _buildTreatmentCard({
    required String title,
    required String date,
    String? price,
    required String image,
  }) {
    return SizedBox(
      width: 440.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 170.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: Color(0xFFE8E8E8),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
                onError: (exception, stackTrace) {},
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                gradient: LinearGradient(
                  colors: [Colors.black.withOpacity(0.1), Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
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
      ),
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
          // Row 2: Clients List
          Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 10.w,
            children: [
              Expanded(child: _clientItem()),
              Expanded(child: _clientItem()),
              Expanded(child: _clientItem()),
            ],
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
      width: 351.w,
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

  // Widget _buildRecentTreatmentCard({
  //   required String title,
  //   required String date,
  //   String? price,
  //   required String image,
  // }) {
  //   return SizedBox(
  //     width: 440.w,
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Container(
  //           height: 200.h,
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(12.r),
  //             color: Color(0xFFE8E8E8),
  //             image: DecorationImage(
  //               image: AssetImage(image),
  //               fit: BoxFit.cover,
  //               onError: (exception, stackTrace) {},
  //             ),
  //           ),
  //           child: Container(
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(12.r),
  //               gradient: LinearGradient(
  //                 colors: [Colors.black.withOpacity(0.1), Colors.transparent],
  //                 begin: Alignment.bottomCenter,
  //                 end: Alignment.topCenter,
  //               ),
  //             ),
  //           ),
  //         ),
  //         SizedBox(height: 10.h),
  //         Text(
  //           title,
  //           style: TextStyle(
  //             height: 0,
  //             fontSize: 18.sp,
  //             fontWeight: FontWeight.w600,
  //             color: Colors.black,
  //           ),
  //         ),
  //         SizedBox(height: 6.h),
  //         Text(
  //           date,
  //           style: TextStyle(
  //             fontSize: 14.sp,
  //             fontWeight: FontWeight.w400,
  //             color: Colors.grey.shade600,
  //           ),
  //         ),
  //         SizedBox(height: 6.h),
  //         Row(
  //           children: [
  //             Icon(Icons.attach_file, size: 14.sp, color: Colors.grey.shade600),
  //             SizedBox(width: 4.w),
  //             Text(
  //               "Attached AI Model",
  //               style: TextStyle(
  //                 fontSize: 14.sp,
  //                 fontWeight: FontWeight.w400,
  //                 color: Colors.grey.shade600,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ],
  //     ),
  //   );
  // }
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

    return Row(
      spacing: 20.w,
      children: [
        Expanded(
          child: _buildRecentTreatmentCard(
            title: appointments[0]['title']!,
            date: appointments[0]['date']!,
            image: appointments[0]['image']!,
            nextAppointment: appointments[0]['nextAppointment']!,
          ),
        ),
        Expanded(
          child: _buildRecentTreatmentCard(
            title: appointments[1]['title']!,
            date: appointments[1]['date']!,
            image: appointments[1]['image']!,
            nextAppointment: appointments[1]['nextAppointment']!,
          ),
        ),
        Expanded(
          child: _buildRecentTreatmentCard(
            title: appointments[2]['title']!,
            date: appointments[2]['date']!,
            image: appointments[2]['image']!,
            nextAppointment: appointments[2]['nextAppointment']!,
          ),
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
        Stack(
          children: [
            Container(
              // width: 339.33.w,
              //height: 240.29.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.r),
                color: Color(0xFFE8E8E8),
              ),
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
            Positioned(
              top: 12.h,
              right: 12.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
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
            Expanded(
              child: Text(
                "\$800 \$650",
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
