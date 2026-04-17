import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:skinsync_clinic_portal/utils/assets.dart';
import 'package:skinsync_clinic_portal/utils/color_constant.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';
import 'package:skinsync_clinic_portal/widgets/dailog%20box/show_success_dailog.dart';
import 'package:skinsync_clinic_portal/widgets/patient_mangement_widget.dart';

class SelectTimeSlotDialog extends StatelessWidget {
  const SelectTimeSlotDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
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
                Text("Select Time Slot", style: CustomFonts.black22w600),
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
            SizedBox(height: 10.h),
            Text(
              "we’ll notify you in advance so you’re always prepared. Your journey to glowing skin is just a tap away!",
              style: CustomFonts.black16w600,
            ),
            SizedBox(height: 20.h),

            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
              child: Image.asset(DemoAssets.selectSlot, fit: BoxFit.contain),
              // SingleChildScrollView(child: PatientMangementWidget()),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                         context.pop();
                        showDialog(
                        context: context,
                        builder: (context) => SuccessDialog(),
                      );
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 16.h,
                        ),
                        decoration: BoxDecoration(
                          color: CustomColors.blackColor,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: Text(
                            "Confirm Appointment",
                            style: CustomFonts.white18w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 15.w),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 16.h,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: CustomColors.greyColor),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Center(
                          child: Text("Cancel", style: CustomFonts.black18w500),
                        ),
                      ),
                    ),
                  ),
                  // Expanded(child: ElevatedButton( onPressed: () => Navigator.pop(context), child: Text("End Appointment"),)),

                  // Expanded(child: OutlinedButton(
                  //   style: OutlinedButton.styleFrom(
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(8.r),
                  //     ),
                  //     side: BorderSide(color: CustomColors.greyColor),

                  //   ),
                  //   onPressed:() => Navigator.pop(context) , child: Text("Cancel")))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
