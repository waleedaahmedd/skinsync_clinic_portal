import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:skinsync_clinic_portal/utils/assets.dart';
import 'package:skinsync_clinic_portal/utils/color_constant.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';
import 'package:skinsync_clinic_portal/view_models/auth_view_model.dart';
import 'package:skinsync_clinic_portal/widgets/dailog%20box/add_notes_dailog.dart';
import 'package:skinsync_clinic_portal/widgets/dailog%20box/create_invoice_dailog.dart';
import 'package:skinsync_clinic_portal/widgets/dailog%20box/patient_detail_dailog.dart';
import 'package:skinsync_clinic_portal/widgets/dailog%20box/status_update_dailog.dart';
import 'package:skinsync_clinic_portal/widgets/pdf_expansiontile_.dart';

class AppointmentReadyDailog extends ConsumerStatefulWidget {
  const AppointmentReadyDailog({super.key});

  @override
  ConsumerState<AppointmentReadyDailog> createState() =>
      _AppointmentReadyDailogState();
}

class _AppointmentReadyDailogState
    extends ConsumerState<AppointmentReadyDailog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        width: 520.w,
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: .start,
            children: [
              SizedBox(height: 10.h),
              Text(
                "Your Treatment Appointment is Completed",
                style: CustomFonts.black30w600,
              ),
              SizedBox(height: 12.h),
              Container(
                padding: EdgeInsets.all(6.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: CustomColors.blackColor),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      PngAssets.image,
                      fit: BoxFit.fill,
                      height: 105.h,
                      width: 151.w,
                    ),
                    SizedBox(width: 21.w),
                    Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          "Monday, Feb 03 - 11:00 AM",
                          style: CustomFonts.black14w500,
                        ),
                        Text(
                          "Derma Fillers - Cheeks",
                          style: CustomFonts.black14w600,
                        ),
                        Text(
                          "Glow Skin Clinic",
                          style: CustomFonts.black14w400,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.attach_file,
                              size: 12.sp,
                              color: CustomColors.blackColor,
                            ),
                            Text(
                              " Derma Fillers Cheeks Model",
                              style: CustomFonts.black14w400.copyWith(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Divider(height: 0, color: Colors.grey.shade300),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () {
                  ref
                      .read(authViewModelProvider.notifier)
                      .navigateDailogIndexToNext(0);
                  showDialog(
                    context: context,
                    builder: (_) => PatientDetailDailog(),
                  );
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 18.h,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.r),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          PngAssets.person,
                          height: 60.w,
                          width: 60.w,
                        ),
                      ),
                      SizedBox(width: 18.w),
                      Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text("Tiana Botosh", style: CustomFonts.black22w600),
                          Text("@tianabotosh", style: CustomFonts.grey16w400),
                        ],
                      ),
                      Spacer(),
                      Container(
                        padding: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: CustomColors.greyColor,
                        ),
                        child: SvgPicture.asset(
                          SvgAssets.scan,
                          height: 20.h,
                          width: 24.w,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text("Payment Details", style: CustomFonts.black22w600),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      context.pop();
                      showDialog(
                        context: context,
                        builder: (context) =>
                            CreateInvoiceDialog(invoiceNumber: '#SSA5002'),
                      );
                    },
                    child: Text(
                      "Add New Invoice",
                      style: CustomFonts.black16w600.copyWith(
                        color: Color(0xFF155DFC),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 18.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          PngAssets.masterLogo,
                          height: 62.h,
                          width: 62.w,
                        ),
                        SizedBox(width: 12.w),
                        Column(
                          crossAxisAlignment: .start,
                          spacing: 4.h,
                          children: [
                            Text("Master Card", style: CustomFonts.black15w600),
                            Text(
                              "5689470025899658",
                              style: CustomFonts.black15w600,
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 31.w,
                            vertical: 3.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.r),
                            color: CustomColors.green.withValues(alpha: 0.2),
                          ),
                          child: Text(
                            "Paid",
                            style: CustomFonts.black15w600.copyWith(
                              color: CustomColors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 22.h),
                    Divider(height: 0, color: Colors.grey.shade300),
                    SizedBox(height: 22.h),
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text("Subtotal", style: CustomFonts.grey17w500),
                        Text("AED 65.00", style: CustomFonts.grey18w500),
                      ],
                    ),
                    SizedBox(height: 22.h),
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text("Platform Fee", style: CustomFonts.grey17w500),
                        Text("AED 1.00", style: CustomFonts.grey18w500),
                      ],
                    ),

                    SizedBox(height: 9.h),
                    Divider(height: 0, color: Colors.grey.shade300),
                    SizedBox(height: 14.h),

                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text("Total Amount", style: CustomFonts.black20w700),
                        Text("AED 61.45", style: CustomFonts.black20w700),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Text("Additional Invoice", style: CustomFonts.black22w600),
              SizedBox(height: 20.h),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 18.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.receipt_outlined,
                          size: 20.h,
                          color: CustomColors.blackColor,
                        ),
                        SizedBox(width: 12.w),
                        Column(
                          crossAxisAlignment: .start,
                          spacing: 4.h,
                          children: [
                            Text("Invoice", style: CustomFonts.black15w600),
                            Text(
                              "5689470025899658",
                              style: CustomFonts.black15w600,
                            ),
                          ],
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 31.w,
                            vertical: 3.h,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.r),
                            color: CustomColors.green.withValues(alpha: 0.2),
                          ),
                          child: Text(
                            "Paid",
                            style: CustomFonts.black15w600.copyWith(
                              color: CustomColors.green,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 22.h),
                    Divider(height: 0, color: Colors.grey.shade300),
                    SizedBox(height: 22.h),
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text("Subtotal", style: CustomFonts.grey17w500),
                        Text("AED 65.00", style: CustomFonts.grey18w500),
                      ],
                    ),
                    SizedBox(height: 22.h),
                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text("Platform Fee", style: CustomFonts.grey17w500),
                        Text("AED 1.00", style: CustomFonts.grey18w500),
                      ],
                    ),

                    SizedBox(height: 9.h),
                    Divider(height: 0, color: Colors.grey.shade300),
                    SizedBox(height: 14.h),

                    Row(
                      mainAxisAlignment: .spaceBetween,
                      children: [
                        Text("Total Amount", style: CustomFonts.black20w700),
                        Text("AED 61.45", style: CustomFonts.black20w700),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20.h),
              PDFExpansionTile(),
              SizedBox(height: 20.h),
              ref.watch(authViewModelProvider).navigateDailogIndex == 0
                  ? SizedBox()
                  : Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                        vertical: 15.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text("Upload Images", style: CustomFonts.black22w600),
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
                                      image: AssetImage(
                                        PngAssets.treatmentImage2,
                                      ),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                          SizedBox(height: 20.h),
                          Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                              horizontal: 17.w,
                              vertical: 13.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),
                              color: CustomColors.blackColor,
                            ),
                            child: Text(
                              "Upload Images",
                              style: CustomFonts.white18w600,
                            ),
                          ),
                        ],
                      ),
                    ),
              ref.watch(authViewModelProvider).navigateDailogIndex == 0
                  ? SizedBox()
                  : SizedBox(height: 20.h),
              ref.watch(authViewModelProvider).navigateDailogIndex == 0
                  ? SizedBox()
                  : Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                        vertical: 15.h,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            "Treatment Notes",
                            style: CustomFonts.black22w600,
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            children: [
                              Text(
                                "Note Type: ",
                                style: CustomFonts.black18w600,
                              ),
                              Text(
                                "Prefers natural-looking results",
                                style: CustomFonts.grey18w500,
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) => AddNotesDailog(),
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                horizontal: 17.w,
                                vertical: 13.h,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.r),
                                border: Border.all(color: Colors.grey.shade300),
                                color: CustomColors.whiteColor,
                              ),
                              child: Text(
                                "Add Treatment Note",
                                style: CustomFonts.black18w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
              ref.read(authViewModelProvider).navigateDailogIndex == 0
                  ? SizedBox()
                  : SizedBox(height: 30.h),
              Row(
                children: [
                  Consumer(
                    builder: (context, ref, _) {
                      final navigateDailogIndex = ref
                          .watch(authViewModelProvider)
                          .navigateDailogIndex;
                      log(navigateDailogIndex.toString());
                      return Expanded(
                        child: GestureDetector(
                          onTap: () {
                            if (navigateDailogIndex == 1) {
                              context.pop();
                              showDialog(
                                context: context,
                                builder: (context) => StatusUpdateDailog(),
                              );
                            } else {
                              ref
                                  .read(authViewModelProvider.notifier)
                                  .navigateDailogIndexToNext(1);
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                              horizontal: 17.w,
                              vertical: 13.h,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.r),

                              color: CustomColors.blackColor,
                            ),
                            child: Text(
                              navigateDailogIndex == 0
                                  ? "Start Appointment"
                                  : "End Appointment",
                              style: CustomFonts.white18w600,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 15.w),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.pop();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(
                          horizontal: 17.w,
                          vertical: 13.h,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.r),
                          border: Border.all(color: Colors.grey.shade300),
                          color: CustomColors.whiteColor,
                        ),
                        child: Text("Cancel", style: CustomFonts.black18w600),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
            ],
          ),
        ),
      ),
    );
  }
}
