import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:skinsync_clinic_portal/screens/dashboard/patient_management_detail.dart';
import 'package:skinsync_clinic_portal/utils/color_constant.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:skinsync_clinic_portal/widgets/patient_selection_tile.dart';
import '../../utils/assets.dart';
import '../../utils/theme.dart';

class MangeStaffScreen extends StatelessWidget {
  static const String routeName = '/manage-staff';
  const MangeStaffScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20.w, horizontal: 145.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: Icon(Icons.arrow_back, size: 24.sp),
                ),
                SizedBox(width: 10.w),
                Text("Manage Staff", style: CustomFonts.black22w600),
              ],
            ),
            SizedBox(height: 14.h),
            Divider(color: Colors.grey.shade300),
            SizedBox(height: 50.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                patientSelection(),
                SizedBox(width: 28.9.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      patientInfo(context: context),
                      SizedBox(height: 19.h),
                      medicalInfo(context: context),
                      SizedBox(height: 19.h),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(15.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        "Schedule",
                                        style: CustomFonts.black20w600,
                                      ),
                                      SizedBox(height: 4.h),
                                      Divider(height: 2.h, color: Colors.black),
                                    ],
                                  ),
                                ),
                                SizedBox(width: 20.w),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Text(
                                        "Time Off",
                                        style: CustomFonts.grey20w600,
                                      ),
                                      SizedBox(height: 4.h),
                                      Divider(
                                        height: 2.h,
                                        color: Colors.grey.shade500,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              children: [
                                Expanded(
                                  child: Theme(
                                    data: Theme.of(context).copyWith(
                                      textTheme: Theme.of(context).textTheme.copyWith(
                                        bodyLarge: CustomFonts.black22w600
                                  
                                      ),
                                      colorScheme: ColorScheme.light(
                                        
                                        primary: CustomColors
                                            .purpleColor, // Header background color
                                        onPrimary: Colors.white, // Header text color
                                        onSurface:
                                            Colors.black, // Body text color (dates)
                                      ),
                                      textButtonTheme: TextButtonThemeData(
                                        style: TextButton.styleFrom(
                                          foregroundColor:
                                              Colors.black, // Button text color
                                        ),
                                      ),
                                    ),
                                    child: CalendarDatePicker(
                                      
                                      initialDate: DateTime.now(),
                                      firstDate:
                                          DateTime.now(), // Disables previous dates
                                      lastDate: DateTime(2100),
                                      onDateChanged: (value) {},
                                      currentDate: DateTime.now(),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: .start,
                                    children: [
                                      Text("Saturday",style: CustomFonts.black20w600,),
                                      SizedBox(height: 4.h,),
                                      Divider(color: Colors.grey.shade300,),
                                      SizedBox(height: 20.h,),
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 18.w,vertical: 14.h),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.r),
                                          border: Border.all(
                                            color: Colors.grey.shade300,
                                          )
                                        ),
                                        child: Text("Select Date",style: CustomFonts.grey14w500,),
                                      ),
                                      SizedBox(height: 10.h,),
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 18.w,vertical: 14.h),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10.r),
                                          border: Border.all(
                                            color: Colors.grey.shade300,
                                          )
                                        ),
                                        child: Text("Select Date",style: CustomFonts.grey14w500,),
                                      ),
                                    ],
                                  ),
                                )
                           
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 19.h),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget medicalInfo({required BuildContext context}) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Services", style: CustomFonts.black22w600),
          SizedBox(height: 20.h),
          Wrap(
            spacing: 10.w,
            runSpacing: 10.h,
            children: List.generate(7, (index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 9.w, vertical: 14.h),
                decoration: BoxDecoration(
                  color: CustomColors.iconColor,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min, // 👈 important
                  children: [
                    SvgPicture.asset(
                      SvgAssets.stethoscope,
                      height: 17.h,
                      width: 17.w,
                      color: Colors.black,
                    ),
                    SizedBox(width: 6.w),
                    Text("Laser Treatments", style: CustomFonts.black14w500),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget patientInfo({required BuildContext context}) {
    return Container(
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            children: [
              ClipOval(
                child: Image.asset(PngAssets.person, height: 96.w, width: 96.w),
              ),
              SizedBox(width: 15.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Charmaine Arnaud", style: CustomFonts.black18w600),
                  Text("Doctor", style: CustomFonts.grey16w400),
                ],
              ),
              Spacer(),
              Text("Remove", style: CustomFonts.pinkunderlined20w600),
            ],
          ),
        ],
      ),
    );
  }

  Widget patientSelection() {
    return SizedBox(
      width: 386.w,
      child: Column(
        children: [
          CupertinoSearchTextField(backgroundColor: Color(0xFFF3F3F5)),
          SizedBox(height: 14.h),
          ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 15.h),
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, index) {
              return PatientSelectionTile(title: "Sarah Johnson");
            },
          ),
        ],
      ),
    );
  }
}
