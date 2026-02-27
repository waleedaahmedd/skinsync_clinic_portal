import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinsync_clinic_portal/app_init.dart';
import 'package:skinsync_clinic_portal/utils/color_constant.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:skinsync_clinic_portal/utils/responsive.dart';
import 'package:skinsync_clinic_portal/widgets/dailog%20box/simulations_detail_dailog_box.dart';
import 'package:skinsync_clinic_portal/widgets/patient_selection_tile.dart';
import 'package:skinsync_clinic_portal/widgets/treatment_container.dart';
import '../../utils/assets.dart';
import '../../utils/theme.dart';

class PatientManagementScreen extends StatefulWidget {
  static const String routeName = '/patient-management';
  const PatientManagementScreen({super.key});

  @override
  State<PatientManagementScreen> createState() =>
      _PatientManagementScreenState();
}

class _PatientManagementScreenState extends State<PatientManagementScreen> {
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
            Divider(color: Colors.grey.shade300),
            SizedBox(height: 50.h),
            context.isLandscape
                ? Row(
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
                            allergies(),
                            SizedBox(height: 19.h),
                            selectionButtons(),
                            SizedBox(height: 19.h),
                            if (isTreatmentSelected) treatmentContent(),
                            if (!isTreatmentSelected) simulationContent(),
                          ],
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      patientSelection(),
                      SizedBox(height: 28.9.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          patientInfo(context: context),
                          SizedBox(height: 19.h),
                          medicalInfo(context: context),
                          SizedBox(height: 19.h),
                          allergies(),
                          SizedBox(height: 19.h),
                          selectionButtons(),
                          SizedBox(height: 19.h),
                          if (isTreatmentSelected) treatmentContent(),
                          if (!isTreatmentSelected) simulationContent(),
                        ],
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget selectionButtons() {
    return Row(
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
                color: isTreatmentSelected ? Colors.black : AppTheme.lightgrey,
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
                color: !isTreatmentSelected ? Colors.black : AppTheme.lightgrey,
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
    );
  }

  Widget allergies() {
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
          Text("Allergies", style: CustomFonts.black22w600),
          SizedBox(height: 20.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 9.65.w, vertical: 5.39.h),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Text("New", style: CustomFonts.white18w600),
          ),
        ],
      ),
    );
  }

  Widget simulationContent() {
    return Container(
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate max width per item for responsive design
          double maxWidthPerItem = 300.w; // Adjust this as needed

          return GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 8,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: maxWidthPerItem, // Max width of each item
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.h,
              childAspectRatio: 0.75, // Height/width ratio
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  showDialog<bool>(
                    context: context,
                    builder: (context) => SimulationDetailDaillogBox(),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
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
              return TreatmentContainer();
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
                child: Image.asset(PngAssets.person, height: 96.r, width: 96.r),
              ),
              SizedBox(width: 15.r),
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
                child: infoContainer(
                  title: "Email",
                  info: "Sarah Johnson",
                  icon: Icons.email_outlined,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: infoContainer(
                  title: "Phone",
                  info: "+1 (555) 123-4567",
                  icon: Icons.call_outlined,
                ),
              ),
            ],
          ),

          SizedBox(height: 15.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: infoContainer(
                  title: "Last Visit",
                  info: "Oct 29, 2025",
                  icon: Icons.calendar_today,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: infoContainer(
                  title: "Next Appointment",
                  info: "Nov 5, 2025",
                  icon: Icons.calendar_today,
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

  Widget infoContainer({
    required String title,
    required String info,
    required IconData icon,
  }) {
    return Container(
      padding: EdgeInsets.all(14.w),
      decoration: BoxDecoration(
        color: AppTheme.fillCOlor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(title, style: CustomFonts.grey16w400,overflow: TextOverflow.ellipsis),
          SizedBox(height: 10.h),
          Text.rich(
            overflow: TextOverflow.ellipsis,
            TextSpan(
              children: [
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Icon(
                    icon,
                    size: 16.sp,
                    color: CustomColors.textGreyColor,
                  ),
                ),
                TextSpan(text: " $info", style: CustomFonts.grey16w400),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
