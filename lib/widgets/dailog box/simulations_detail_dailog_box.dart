import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinsync_clinic_portal/utils/assets.dart';
import 'package:skinsync_clinic_portal/utils/color_constant.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';

class SimulationDetailDaillogBox extends StatelessWidget {
  const SimulationDetailDaillogBox({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 
                  Column(
                    children: [
                      Text("Sarah Jhonson", style: CustomFonts.black30w600),
                      Text(
                        "Derma Fillers Patient, Botox ",
                        style: CustomFonts.black16w400,
                      ),
                    ],
                  ),
          
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
          
              SizedBox(height: 30.h),
              Image.asset(DemoAssets.simulationLandscape, height: 208.h, width:double.infinity,fit: BoxFit.fill,),
              SizedBox(height: 20.h),
              Container(
                padding: EdgeInsets.all(23.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: Color(0xFFD7F6FE),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Treatments Applied on Simulator",
                      style: CustomFonts.black25w600,
                    ),
                    SizedBox(height: 15.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text("Treatment", style: CustomFonts.black18w600),
                            SizedBox(height: 5.h),
                            Text("Botox", style: CustomFonts.black16w400),
                          ],
                        ),
                        Column(
                          children: [
                            Text("Area", style: CustomFonts.black18w600),
                            SizedBox(height: 5.h),
                            Text("Undereye", style: CustomFonts.black16w400),
                          ],
                        ),
                        Column(
                          children: [
                            Text("Syringes", style: CustomFonts.black18w600),
                            SizedBox(height: 5.h),
                            Text("1", style: CustomFonts.black16w400),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Text("Before & After Patient AI Model",style: CustomFonts.black22w600,),
              SizedBox(height: 20.h,),
              Row(children: [
                Column(
                  children: [
                    Image.asset(PngAssets.simulation,height: 148.w,),
                      Text("Before",style: CustomFonts.black16w600,)
                  ],
                ),
                SizedBox(width: 15.w,),
               Column(
                  children: [
                    Image.asset(PngAssets.simulation,height: 148.w,),
                      Text("Before",style: CustomFonts.black16w600,)
                  ],
                ),
              ],)
            ],
          ),
        ),
      ),
    );
  }
}
