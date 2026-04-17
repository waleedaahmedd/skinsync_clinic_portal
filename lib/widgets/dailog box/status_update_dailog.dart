
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:skinsync_clinic_portal/utils/color_constant.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';
import 'package:skinsync_clinic_portal/widgets/dailog%20box/patient_follow_up_appointment.dart';


class StatusUpdateDailog extends StatelessWidget {
  const StatusUpdateDailog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        width: 354.w,
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Header
      
             Center(child: Icon(Icons.check_circle_rounded,color: Colors.green,size: 70.sp,)),
            SizedBox(height: 30.h,),
          Center(child: Text("Status has been updated successfully",
          textAlign: TextAlign.center,
          style: CustomFonts.grey18w400,)),
            SizedBox(height: 30,),
           GestureDetector(
            onTap: (){
               context.pop();
              showDialog(
                        context: context,
                        builder: (context) => PatientFollowUpAppointment(),
                      );
            },
             child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 13.h),
              decoration: BoxDecoration(
                color: CustomColors.blackColor,
                borderRadius: BorderRadius.circular(30.r)
              ),
              child: Row(
                mainAxisAlignment: .center,
                children: [
                  Text("ok",style: CustomFonts.white18w600,),
                  SizedBox(width: 10.w,),
                  Icon(CupertinoIcons.arrow_right,color: Colors.white,size: 24.sp,)
                ],
              ),
             ),
           )
             ],
        ),
      ),
    );
  }

}
