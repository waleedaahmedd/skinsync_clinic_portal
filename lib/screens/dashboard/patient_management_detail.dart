import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinsync_clinic_portal/utils/color_constant.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:skinsync_clinic_portal/widgets/pateint_treatment_selection_tile.dart';
import '../../utils/assets.dart';
import '../../utils/theme.dart';

class PatientManagementDetailScreen extends StatelessWidget {
  static const String routeName = '/patient-management_detail';
  const PatientManagementDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.arrow_back, size: 24.sp),
                SizedBox(width: 10.w),
                Text("Patient Management", style: CustomFonts.black22w600),
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
                      treamentInfo(context: context),
                      SizedBox(height: 19.h),
                      Container(
                        padding: EdgeInsets.all(15.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Your Treatment Journey",
                              style: CustomFonts.black22w600,
                            ),
                            SizedBox(height: 20.h),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          width: 27.w,
                                          height: 27.h,
                                          decoration: BoxDecoration(
                                            color: CustomColors.purpleColor,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.check,
                                            size: 14.w,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Container(
                                          height: 148.h,
                                          width: 1.w,
                                          color: Colors.grey.shade400,
                                        ),
                                        Container(
                                          width: 27.w,
                                          height: 27.h,
                                          decoration: BoxDecoration(
                                            color: CustomColors.purpleColor,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.check,
                                            size: 14.w,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Container(
                                          height: 148.h,
                                          width: 1.w,
                                          color: Colors.grey.shade400,
                                        ),
                                        Container(
                                          width: 27.w,
                                          height: 27.h,
                                          decoration: BoxDecoration(
                                            color: CustomColors.purpleColor,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.check,
                                            size: 14.w,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Container(
                                          height: 148.h,
                                          width: 1.w,
                                          color: Colors.grey.shade400,
                                        ),
                                        Container(
                                          width: 27.w,
                                          height: 27.h,
                                          decoration: BoxDecoration(
                                            color: CustomColors.purpleColor,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.check,
                                            size: 14.w,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 16.w,),
                                    Column(
                                      children: [
                                        treatmentCard(),
                                        SizedBox(height: 18.h),
                                        treatmentCard(),
                                        SizedBox(height: 18.h),
                                        treatmentCard(),
                                        SizedBox(height: 18.h),
                                        treatmentCard(),
                                      ],
                                    ),
                                  ],
                                ),
                                //   timelineItem(done: true, last: false),
                                //   SizedBox(height: 20.h),

                                //   timelineItem(done: true, last: false),
                                //   SizedBox(height: 20.h),

                                //   timelineItem(done: true, last: false),
                                //   SizedBox(height: 20.h),

                                //   timelineItem(done: false, last: true),
                              ],
                            ),

                            //   ListView.builder(
                            //     shrinkWrap: true,
                            //     itemCount: 3,
                            //     itemBuilder: (context, index) {
                            //       return Container(

                            //         padding: EdgeInsets.symmetric(horizontal: 19.w,vertical: 20.h),
                            //         decoration: BoxDecoration(
                            //           color: Color(0xffDEF8FF),
                            //           borderRadius: BorderRadius.circular(10.r),

                            //         ),
                            //         child:Row(
                            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //           children: [
                            //             Column(
                            //               crossAxisAlignment: CrossAxisAlignment.start,
                            //               children: [
                            //                 Text("Botox Treatment",style: CustomFonts.black18w600,),
                            //                 SizedBox(height: 11.h,),
                            //                 Text("Mild swelling or redness is normal. follow aftercare tips for best results.",
                            //                 style: CustomFonts.black16w400,),
                            //                 SizedBox(height: 34.h,),
                            //                 Text("02 Feb 2025",style: CustomFonts.black16w500,)
                            //               ],
                            //             ),
                            //             Container(
                            //               height: 144.h,
                            //               width: 222.w,
                            //               decoration: BoxDecoration(
                            //                 borderRadius: BorderRadius.circular(10.r),
                            //                 image: DecorationImage(
                            //                   fit: BoxFit.fill,
                            //                   image: AssetImage(PngAssets.treatmentImage))
                            //               ),
                            //             )
                            //           ],
                            //         ) );
                            //     },
                            //   ),
                          ],
                        ),
                      ),
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

  Widget treamentInfo({required BuildContext context}) {
    return Container(
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 248.w,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(PngAssets.treatmentImage),
              ),
            ),
          ),
          SizedBox(height: 19.h),
          Text("Derma Fillers - Cheeks", style: CustomFonts.black30w600),
          Text("Glow Skin Clinic", style: CustomFonts.black20w500),
          SizedBox(height: 11.h),
          Text(
            "Enhance your natural beauty by adding volume, smoothing wrinkles, and contouring areas like cheeks, lips, and under-eyes for a youthful, refreshed look.",
            style: CustomFonts.black18w400,
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
            physics: NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => SizedBox(height: 15.h),
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, index) {
              return PatientTreatmentSelectionTile();
            },
          ),
        ],
      ),
    );
  }
}

Widget treatmentCard() {
  return Container(
  
    decoration: BoxDecoration(
      color: Color(0xffDEF8FF),
      borderRadius: BorderRadius.circular(12.r),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 14.h),
              Text("Botox Treatment", style: CustomFonts.black18w600),
              SizedBox(height: 11.h),
              Text(
                "Mild swelling or redness is normal. follow aftercare tips for best results.",
                style: CustomFonts.black16w400,
              ),
              SizedBox(height: 34.h),
              Text("02 Feb 2025", style: CustomFonts.black16w500),
              SizedBox(height: 14.h),
            ],
          ),
        ),
       
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Container(
            height: 144.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Image.asset(height: 144.h, PngAssets.treatmentImage),
          ),
        ),
      ],
    ),
  );
}

Widget treamentInfo({required BuildContext context}) {
  return Container(
    padding: EdgeInsets.all(15.w),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15.r),
      border: Border.all(color: Colors.grey.shade300),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 248.w,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(PngAssets.treatmentImage),
            ),
          ),
        ),
        SizedBox(height: 19.h),
        Text("Derma Fillers - Cheeks", style: CustomFonts.black30w600),
        Text("Glow Skin Clinic", style: CustomFonts.black20w500),
        SizedBox(height: 11.h),
        Text(
          "Enhance your natural beauty by adding volume, smoothing wrinkles, and contouring areas like cheeks, lips, and under-eyes for a youthful, refreshed look.",
          style: CustomFonts.black18w400,
        ),
      ],
    ),
  );
}
