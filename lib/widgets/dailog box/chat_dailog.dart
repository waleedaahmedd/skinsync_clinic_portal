import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skinsync_clinic_portal/utils/assets.dart';
import 'package:skinsync_clinic_portal/utils/color_constant.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';

class ChatDailog extends StatelessWidget {
  const ChatDailog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        width: 752.w,
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Header
            Row(
              children: [
                ClipOval(
                  child: Image.asset(
                    PngAssets.person,
                    height: 52.w,
                    width: 52.w,
                  ),
                ),
                SizedBox(width: 14.w),
                Column(
                  children: [
                    Text("Sarah Jhonson", style: CustomFonts.black18w500),
                    Text("Patient ID: 1", style: CustomFonts.grey16w400),
                  ],
                ),
                Spacer(),
                GestureDetector(
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
              ],
            ),

            SizedBox(height: 35.h),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 11.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(35.r),
                  color: Color(0xFFD8D8D8),
                ),
                child: Text("Today", style: CustomFonts.grey13w700),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  _buildRightContainer(text: "The class was very interesting"),
                  _buildLeftContainer(
                    text: "Thankyou so much looking forward to next class",
                  ),
                  _buildRightContainer(text: "Kindly share Notes for reading"),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: .end,
                      children: [
                        Text("Sarah Johnson, 11:35 PM"),
                        SizedBox(height: 4.h),
                        Container(
                          width: 292.w,
                          padding: EdgeInsets.symmetric( horizontal: 18.w,vertical: 14.h),
                          decoration: BoxDecoration(
                            color: CustomColors.greyColor,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(24.r),
                              bottomRight: Radius.circular(24.r),
                              bottomLeft: Radius.circular(24.r),
                            ),
                          ),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                SvgAssets.arrowDownCircle,
                                height: 36.w,
                                width: 29.w,
                              ),
                              SizedBox(width: 13.w),
                              Column(
                                crossAxisAlignment: .start,
                                children: [
                                  Text(
                                    "notes.pdf",
                                    style: CustomFonts.grey14w500,
                                  ),
                                  Text("867 Kb", style: CustomFonts.grey14w400),
                                ],
                              ),
                              Spacer(),
                              SvgPicture.asset(
                                SvgAssets.arrowDownCircle,
                                height: 31.w,
                                width: 31.w,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 24.h,),
            TextField(
              decoration: InputDecoration(
                hintText: "Write a message...",
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Transform.rotate(
                        angle: pi /2,
                        child: Icon(Icons.attachment,size: 24.sp,)),
                     Transform.rotate(
                        angle: -pi /4,child: Icon(Icons.send_outlined,size: 20.sp)),
                    ],
                  ),
                )
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildRightContainer({required String text}) {
    return Align(
      alignment: Alignment.topRight,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text("You, 11:30 PM"),
          SizedBox(height: 4.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: CustomColors.purpleColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24.r),
                bottomRight: Radius.circular(24.r),
                bottomLeft: Radius.circular(24.r),
              ),
            ),
            child: Text(text, style: CustomFonts.black14w500),
          ),
        ],
      ),
    );
  }

  Widget _buildLeftContainer({required String text}) {
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: .end,
        children: [
          Text("Sarah Johnson, 11:35 PM"),
          SizedBox(height: 4.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 14.h),
            decoration: BoxDecoration(
              color: CustomColors.greyColor,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(24.r),
                bottomRight: Radius.circular(24.r),
                bottomLeft: Radius.circular(24.r),
              ),
            ),
            child: Text(text, style: CustomFonts.black14w500),
          ),
        ],
      ),
    );
  }
}
