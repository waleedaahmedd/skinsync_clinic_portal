import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skinsync_clinic_portal/utils/assets.dart';
import 'package:skinsync_clinic_portal/utils/color_constant.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';
import 'package:skinsync_clinic_portal/utils/theme.dart';
import 'package:skinsync_clinic_portal/widgets/dailog%20box/chat_dailog.dart';
import 'package:skinsync_clinic_portal/widgets/dailog%20box/notes_dailog.dart';
import 'package:skinsync_clinic_portal/widgets/dailog%20box/simulations_detail_dailog_box.dart';
import 'package:skinsync_clinic_portal/widgets/treatment_container.dart';

class PatientMangementWidget extends StatefulWidget {
  const PatientMangementWidget({super.key});

  @override
  State<PatientMangementWidget> createState() => _PatientMangementWidgetState();
}

class _PatientMangementWidgetState extends State<PatientMangementWidget> {
  bool isTreatmentSelected = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        patientInfo(context: context),
        SizedBox(height: 19.h),
        medicalInfo(context: context),
        SizedBox(height: 19.h),
        allergies(),
        SizedBox(height: 19.h),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(15.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text("Photos", style: CustomFonts.black22w600),
              SizedBox(height: 20.h),
              Row(
                children: List.generate(3, (_) {
                  return Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: Container(
                      height: 100.h,
                      width: 104.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.r),
                        image: DecorationImage(
                          image: AssetImage(PngAssets.treatmentImage2),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
        SizedBox(height: 19.h),
        selectionButtons(),
        SizedBox(height: 19.h),
        if (isTreatmentSelected) treatmentContent(),
        if (!isTreatmentSelected) simulationContent(),
      ],
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text("Notes", style: CustomFonts.grey18w700),
              GestureDetector(
                onTap: () {
                  showDialog<bool>(
                    context: context,
                    builder: (context) => NotesDailog(),
                  );
                },
                child: Text("+ Add New Note", style: CustomFonts.blue16w600),
              ),
            ],
          ),

          SizedBox(height: 19.h),
          Text(
            "Prefers natural-looking results",
            style: CustomFonts.grey18w500,
          ),
          SizedBox(height: 19.h),
          Text(
            "Prefers natural-looking results",
            style: CustomFonts.grey18w500,
          ),
          SizedBox(height: 19.h),
          Text(
            "Prefers natural-looking results",
            style: CustomFonts.grey18w500,
          ),

          for (int i = 0; i < 3; i++)
            Padding(
              padding: EdgeInsets.symmetric(vertical: 9.h),
              child: ExpansionTile(
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                collapsedShape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(16.r),
                ),
                clipBehavior: Clip.antiAlias,
                leading: Image.asset(PngAssets.pdf, height: 33.h, width: 44.w),
                title: Text(
                  "Client Intake Form.pdf",
                  style: CustomFonts.black12w600,
                ),
                subtitle: Text(
                  "867 Kb    14 Feb 2022 at 11:30 am",
                  style: CustomFonts.grey14w400,
                ),
                trailing: SvgPicture.asset(
                  SvgAssets.downloadIcon,
                  height: 20.w,
                  width: 20.w,
                ),
                childrenPadding: EdgeInsets.symmetric(
                  horizontal: 22.w,
                  vertical: 19.h,
                ),
                children: [
                  Divider(height: 0, color: CustomColors.greyColor),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text("Text Field 1", style: CustomFonts.grey14w400),
                      Text("Client Input", style: CustomFonts.black14w400),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text("Text Field 2", style: CustomFonts.grey14w400),
                      Text("Client Input", style: CustomFonts.black14w400),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Text("Text Field 2", style: CustomFonts.grey14w400),
                      Text("Client Input", style: CustomFonts.black14w400),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [_buildSignBox(), _buildSignBox()],
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSignBox() {
    return Column(
      crossAxisAlignment: .start,
      children: [
        SizedBox(
          height: 54.h,
          width: 101.w,
          child: Image.asset((PngAssets.signature), fit: BoxFit.cover),
        ),
        Container(width: 105.w, height: 1.h, color: CustomColors.blackColor),
        Text("Patient Signature", style: CustomFonts.black14w400),
      ],
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
              Spacer(),
              GestureDetector(
                onTap: () {
                  showDialog<bool>(
                    context: context,
                    builder: (context) => ChatDailog(),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(14.r),
                  decoration: BoxDecoration(
                    color: CustomColors.greyColor,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    SvgAssets.message,
                    height: 20.w,
                    width: 20.w,
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
          Text(
            title,
            style: CustomFonts.grey16w400,
            overflow: TextOverflow.ellipsis,
          ),
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
