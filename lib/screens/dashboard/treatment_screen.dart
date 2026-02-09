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
                  Text("Treatments", style: CustomFonts.black24w600),
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
                        Text('Add Treatment', style: CustomFonts.white18w500),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              ...List.generate(9, (index) => TreatmentListTile()),
            ],
          ),
        ),
      ),
    );
  }
}
