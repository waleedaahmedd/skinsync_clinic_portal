import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skinsync_clinic_portal/utils/assets.dart';
import 'package:skinsync_clinic_portal/utils/color_constant.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';

class TreatmentListTile extends StatelessWidget {
  const TreatmentListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h, right: 10.w, left: 10.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: CustomColors.lightBlueColor,
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
          BoxShadow(
            color: CustomColors.lightPurpleColor,
            blurRadius: 10.r,
            offset: Offset(2.h, 0),
          ),
        ],
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        children: [
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset(
                PngAssets.treatmentImage,
                width: 0.5.sw,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Color(0xFFE8E8E8),
                  child: Icon(Icons.broken_image, color: Colors.grey),
                ),
              ),
            ),
          ),
          SizedBox(width: 20.w),
          Flexible(
            child: Container(
              padding: EdgeInsets.all(14.w),
              // decoration: BoxDecoration(
              //   color: Colors.white,
              //   borderRadius: BorderRadius.circular(14.r),
              //   boxShadow: [
              //     BoxShadow(
              //       color: CustomColors.lightBlueColor,
              //       blurRadius: 8.r,
              //       offset: Offset(0, 2.h),
              //     ),
              //     BoxShadow(
              //       color: CustomColors.lightPurpleColor,
              //       blurRadius: 10.r,
              //       offset: Offset(2.h, 0),
              //     ),
              //   ],
              // ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Row(
                    children: [
                      Text("Botox Treatment", style: CustomFonts.black18w600),
                      Text(
                        " \$100",
                        style: CustomFonts.black18w600.copyWith(
                          color: CustomColors.purpleColor,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10.h),

                  // Area
                  Row(
                    children: List.generate(
                      2,
                      (index) => Container(
                        margin: EdgeInsets.only(right: 10.w),
                        padding: EdgeInsets.all(14.w),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14.r),
                          boxShadow: [
                            BoxShadow(
                              color: CustomColors.lightBlueColor,
                              blurRadius: 8.r,
                              offset: Offset(0, 2.h),
                            ),
                            BoxShadow(
                              color: CustomColors.lightPurpleColor,
                              blurRadius: 10.r,
                              offset: Offset(2.h, 0),
                            ),
                          ],
                        ),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Glabella",
                              style: CustomFonts.black14w500.copyWith(
                                color: Colors.grey.shade700,
                              ),
                            ),
                            SizedBox(height: 10.h),

                            // Price
                            Row(
                              children: [
                                // Text(
                                //   "Per ",
                                //   style: CustomFonts.black14w500.copyWith(
                                //     color: Colors.grey.shade600,
                                //   ),
                                // ),
                                SvgPicture.asset(
                                  SvgAssets.treatment,
                                  color: CustomColors.purpleColor,
                                  height: 20.h,
                                ),
                                Text(
                                  " \$300",
                                  style: CustomFonts.black18w600.copyWith(
                                    color: CustomColors.purpleColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
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
