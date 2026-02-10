import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:skinsync_clinic_portal/utils/color_constant.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';
import 'package:skinsync_clinic_portal/widgets/treatment_list_tile.dart';

import '../../utils/assets.dart';
import '../../utils/responsive.dart';
import '../../widgets/header__with_back_btn.dart';
import '../add_treatment_screen.dart';

class TreatmentScreen extends StatelessWidget {
  const TreatmentScreen({super.key});

  static const String routeName = '/treatment';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            SizedBox(height: 20.h),
            Row(
              children: [
                Text("Treatments", style: CustomFonts.black22w600),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    // Handle create staff
                    context.push(AddTreatmentScreen.routeName);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      vertical: 20.h,
                      horizontal: 20.w,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    children: [
                      Center(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20.r,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text('Add Treatment', style: CustomFonts.white14w500),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 14.h),
            Divider(color: Colors.grey.shade300),
            SizedBox(height: 50.h),
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(height: 20.h,);
                },
                itemCount: 9,
                itemBuilder: (BuildContext context, int index) {
                  return TreatmentListTile();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
