import 'dart:ui' as ui;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skinsync_clinic_portal/utils/assets.dart';
import 'package:skinsync_clinic_portal/utils/color_constant.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';
import 'package:skinsync_clinic_portal/view_models/auth_view_model.dart';
import 'package:skinsync_clinic_portal/widgets/signpad_widget.dart';

class PDFExpansionTile extends StatelessWidget {
  const PDFExpansionTile({super.key});

  @override
  Widget build(BuildContext context) {
    return        Padding(
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

                    children: [
                      SizedBox(
                        height: 54.h,
                        width: 101.w,
                        child: Image.asset(
                          (PngAssets.signature),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Spacer(),
                      Consumer(
                        builder: (context, ref, _) {
                          final signature = ref
                              .watch(authViewModelProvider)
                              .signature;
                          if (signature != null) {
                       return    RawImage(image: signature, height: 60.h, fit: BoxFit.contain);
                          }

                          return GestureDetector(
                            onTap: () async {
                              final ui.Image? signature =
                                  await ESignatureDialog.show(context);
                              if (signature != null) {
                                ref
                                    .read(authViewModelProvider.notifier)
                                    .saveSignature(signature);
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.all(9.w),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: CustomColors.blackColor,
                                ),
                                borderRadius: BorderRadius.circular(8.r),
                                color: CustomColors.greyColor,
                              ),

                              child: Text(
                                " + Draw Signature",
                                style: CustomFonts.black12w400,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 6.h),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: .start,
                        children: [
                          Container(
                            width: 105.w,
                            height: 1.h,
                            color: CustomColors.blackColor,
                          ),
                          Text(
                            "Patient Signature",
                            style: CustomFonts.black14w400,
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: .start,
                        children: [
                          Container(
                            width: 105.w,
                            height: 1.h,
                            color: CustomColors.blackColor,
                          ),
                          Text(
                            "Clinic Signature",
                            style: CustomFonts.black14w400,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )
      ;
  }
}