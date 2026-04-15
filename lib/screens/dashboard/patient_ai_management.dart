import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:skinsync_clinic_portal/screens/dashboard/patient_management_detail.dart';
import 'package:skinsync_clinic_portal/utils/color_constant.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:skinsync_clinic_portal/utils/responsive.dart';
import 'package:skinsync_clinic_portal/widgets/dailog%20box/simulations_detail_dailog_box.dart';
import 'package:skinsync_clinic_portal/widgets/patient_mangement_widget.dart';
import 'package:skinsync_clinic_portal/widgets/patient_selection_tile.dart';
import '../../utils/assets.dart';
import '../../utils/theme.dart';

class PatientAiManagementScreen extends StatefulWidget {
  static const String routeName = '/patient-ai-management';
  const PatientAiManagementScreen({super.key});

  @override
  State<PatientAiManagementScreen> createState() =>
      _PatientAiManagementScreenState();
}

class _PatientAiManagementScreenState extends State<PatientAiManagementScreen> {
 
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
                      Expanded(
                        child: PatientMangementWidget() ),
                    ],
                  )
                : Column(
                    children: [
                      patientSelection(),
                      SizedBox(height: 28.9.w),
                       PatientMangementWidget()
                  ],
                  ),
          ],
        ),
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
              return PatientSelectionTile(
                title: "Sarah Johnson",
                subTitle: "sarah.johnson@email.com",
              );
            },
          ),
        ],
      ),
    );
  }
}
