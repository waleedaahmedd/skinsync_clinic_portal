import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinsync_clinic_portal/app_init.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:skinsync_clinic_portal/utils/responsive.dart';
import 'package:skinsync_clinic_portal/widgets/patient_mangement_widget.dart';
import 'package:skinsync_clinic_portal/widgets/patient_selection_tile.dart';

class PatientManagementScreen extends StatefulWidget {
  static const String routeName = '/patient-management';
  const PatientManagementScreen({super.key});

  @override
  State<PatientManagementScreen> createState() =>
      _PatientManagementScreenState();
}

class _PatientManagementScreenState extends State<PatientManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Text('Patient Management', style: CustomFonts.black22w600),
            SizedBox(height: 14.h),
            Divider(color: Colors.grey.shade300),
            SizedBox(height: 50.h),
            context.isLandscape
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      patientSelection(),
                      SizedBox(width: 28.9.w),
                      Expanded(child: PatientMangementWidget()),
                    ],
                  )
                : Column(
                    children: [
                      patientSelection(),
                      SizedBox(height: 28.9.w),
                      PatientMangementWidget(),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget patientSelection() {
    return SizedBox(
      width: navigatorKey.currentContext!.isLandscape ? 386.w : double.infinity,
      child: Column(
        children: [
          CupertinoSearchTextField(backgroundColor: Color(0xFFF3F3F5)),
          SizedBox(height: 14.h),
          AdaptiveLayoutListInverse(
            isScrollVertical: true,
            horizontalHeight: 100.h,
            children: List.generate(6, (index) {
              return PatientSelectionTile(
                title: "Sarah Johnson",
                subTitle: "sarah.johnson@email.com",
              );
            }),
          ),
        ],
      ),
    );
  }
}
