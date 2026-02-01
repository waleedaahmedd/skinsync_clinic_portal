import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:skinsync_clinic_portal/screens/dashboard/patient_management_detail.dart';
import 'package:skinsync_clinic_portal/utils/color_constant.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:skinsync_clinic_portal/widgets/dailog%20box/simulations_detail_dailog_box.dart';
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
  bool isTreatmentSelected = true;
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
            Divider(color: AppTheme.fillCOlor),
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
                          children: [
                            Text("Allergies", style: CustomFonts.black22w600),
                            SizedBox(height: 20.h),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 9.65.w,
                                vertical: 5.39.h,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Text(
                                "New",
                                style: CustomFonts.white18w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 19.h),
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isTreatmentSelected = true;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 16.5.h),
                                decoration: BoxDecoration(
                                  color: isTreatmentSelected
                                      ? Colors.black
                                      : AppTheme.lightgrey,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Center(
                                  child: Text(
                                    "Treatments",
                                    style: isTreatmentSelected
                                        ? CustomFonts.white18w500
                                        : CustomFonts.black18w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 11.w),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  print("AI Simulations tapped");
                                  isTreatmentSelected = false;
                                });
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: 16.5.h),
                                decoration: BoxDecoration(
                                  color: !isTreatmentSelected
                                      ? Colors.black
                                      : AppTheme.lightgrey,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Center(
                                  child: Text(
                                    "AI Simulations",
                                    style: !isTreatmentSelected
                                        ? CustomFonts.white18w500
                                        : CustomFonts.black18w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 19.h),
                      if (isTreatmentSelected) treatmentContent(),
                      if (!isTreatmentSelected)
                        Container(
                          padding: EdgeInsets.all(15.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.r),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              // Calculate max width per item for responsive design
                              double maxWidthPerItem =
                                  300.w; // Adjust this as needed

                              return GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: 8,
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                      maxCrossAxisExtent:
                                          maxWidthPerItem, // Max width of each item
                                      crossAxisSpacing: 10.w,
                                      mainAxisSpacing: 10.h,
                                      childAspectRatio:
                                          0.75, // Height/width ratio
                                    ),
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      showDialog<bool>(
                                        context: context,
                                        builder: (context) =>
                                            SimulationDetailDaillogBox(),
                                      );
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(5.w),
                                      // decoration: BoxDecoration(
                                      //   color: Colors.white,
                                      //   borderRadius: BorderRadius.circular(10.r),
                                      //   boxShadow: [
                                      //     BoxShadow(
                                      //       color: Colors.black12,
                                      //       blurRadius: 4,
                                      //       offset: Offset(0, 2),
                                      //     ),
                                      //   ],
                                      // ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.r),
                                              child: Image.asset(
                                                PngAssets.simulation,
                                                width: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 5.h),
                                          Text(
                                            "Simulation Name",
                                            style: CustomFonts.black18w600,
                                            textAlign: TextAlign.left,
                                          ),
                                          Text(
                                            "Treatment Name",
                                            style: CustomFonts.grey16w400,
                                            textAlign: TextAlign.left,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
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

  Widget treatmentContent() {
    return Container(
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Treatment History", style: CustomFonts.black22w600),
          SizedBox(height: 20.h),
          CupertinoSearchTextField(backgroundColor: Color(0xFFF3F3F5)),
          SizedBox(height: 19.h),
          ListView.separated(
            separatorBuilder: (context, index) => SizedBox(height: 15.h),
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.go(PatientManagementDetailScreen.routeName);
                },
                child: Container(
                  padding: EdgeInsets.all(15.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    // border: Border.all(
                    //  color:Colors.grey.shade300
                    // ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.r),
                        child: Image.asset(
                          PngAssets.treatmentImage,
                          height: 248.h,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 19.h),
                      Text("Botox - Forehead", style: CustomFonts.grey18w700),
                      SizedBox(height: 19.h),
                      Text(
                        "Provider: Dr. Smith",
                        style: CustomFonts.grey18w500,
                      ),
                      SizedBox(height: 9.h),
                      Text("Oct 29, 2025", style: CustomFonts.grey18w500),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
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
          Text("Medical Information", style: CustomFonts.black22w600),
          SizedBox(height: 20.h),
          Text("Allergies", style: CustomFonts.grey18w500),
          SizedBox(height: 9.h),
          Container(
            padding: EdgeInsets.all(14.w),
            decoration: BoxDecoration(
              color: AppTheme.errorColor.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Text("Latex", style: CustomFonts.red18w500),
          ),
          SizedBox(height: 19.h),
          Text("Notes", style: CustomFonts.grey18w700),

          SizedBox(height: 19.h),
          Text(
            "Prefers natural-looking results",
            style: CustomFonts.grey18w500,
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
                  Text("Sarah Johnson", style: CustomFonts.black18w500),
                  Text("Patient ID: 1", style: CustomFonts.grey16w400),
                ],
              ),
            ],
          ),
          SizedBox(height: 15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(14.w),
                  decoration: BoxDecoration(
                    color: AppTheme.fillCOlor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Email", style: CustomFonts.grey16w400),
                      SizedBox(height: 10.h),
                      Text.rich(
                        TextSpan(
                          children: [
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Icon(
                                Icons.email_outlined,
                                size: 16.sp,
                                color: CustomColors.textGreyColor,
                              ),
                            ),
                            TextSpan(
                              text: "  sarah.johnson@email.com",
                              style: CustomFonts.grey16w400,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(14.w),
                  decoration: BoxDecoration(
                    color: AppTheme.fillCOlor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Phone", style: CustomFonts.grey16w400),
                      SizedBox(height: 10.h),
                      Text.rich(
                        TextSpan(
                          children: [
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Icon(
                                Icons.call_outlined,
                                size: 16.sp,
                                color: CustomColors.textGreyColor,
                              ),
                            ),
                            TextSpan(
                              text: "  +1 (555) 123-4567",
                              style: CustomFonts.grey16w400,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(14.w),
                  decoration: BoxDecoration(
                    color: AppTheme.fillCOlor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Last Visit", style: CustomFonts.grey16w400),
                      SizedBox(height: 10.h),
                      Text.rich(
                        TextSpan(
                          children: [
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Icon(
                                Icons.calendar_today,
                                size: 16.sp,
                                color: CustomColors.textGreyColor,
                              ),
                            ),
                            TextSpan(
                              text: "  Oct 29, 2025",
                              style: CustomFonts.grey16w400,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(14.w),
                  decoration: BoxDecoration(
                    color: AppTheme.fillCOlor,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Next Appointment", style: CustomFonts.grey16w400),
                      SizedBox(height: 10.h),
                      Text.rich(
                        TextSpan(
                          children: [
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Icon(
                                Icons.calendar_today,
                                size: 16.sp,
                                color: CustomColors.textGreyColor,
                              ),
                            ),
                            TextSpan(
                              text: "  Nov 5, 2025",
                              style: CustomFonts.grey16w400,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
