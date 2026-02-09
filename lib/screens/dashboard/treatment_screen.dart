import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';

import '../../utils/assets.dart';
import '../../utils/responsive.dart';
import '../../widgets/header__with_back_btn.dart';
import '../create_treatment_screen.dart';

class TreatmentScreen extends StatelessWidget {
  const TreatmentScreen({super.key});
  static const String routeName = '/treatment';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Text("Treatment", style: CustomFonts.black24w600),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      // Handle create staff
                      context.push(CreateTreatmentScreen.routeName);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      padding: EdgeInsets.symmetric(
                        vertical: 5.h,
                        horizontal: 20.w,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      elevation: 0,
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.add, color: Colors.white, size: 18.r),
                        SizedBox(width: 10.w),
                        Text(
                          'Create Treatment',
                          style: CustomFonts.white18w500,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
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
                            "Treatment",
                            style: TextStyle(
                              fontSize: 22.spMin,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        // SizedBox(width: 20.w),
                        // GestureDetector(
                        //   onTap: () {},
                        //   child: Row(
                        //     children: [
                        //       Text(
                        //         "View All",
                        //         style: TextStyle(
                        //           fontSize: 14.sp,
                        //           fontWeight: FontWeight.w500,
                        //           color: Colors.black87,
                        //         ),
                        //       ),
                        //       SizedBox(width: 6.w),
                        //       Icon(
                        //         CupertinoIcons.arrow_right,
                        //         size: 14.sp,
                        //         color: Colors.black,
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    _buildAppointmentsList(),
                  ],
                ),
              ),
            ],
          ),
        ),
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
}
