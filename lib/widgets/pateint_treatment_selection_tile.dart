import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinsync_clinic_portal/utils/assets.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';
import 'package:skinsync_clinic_portal/utils/theme.dart';

class PatientTreatmentSelectionTile extends StatelessWidget {
  const PatientTreatmentSelectionTile({super.key,required});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: AppTheme.titleBorderColor),
      ),
      child: Row(
        children: [
          Container(height: 80.w, width: 88.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
              image: DecorationImage(
                fit: BoxFit.cover ,
              
                image: AssetImage(PngAssets.treatmentImage))
          ),
          ),
          SizedBox(width: 15.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Sarah Johnson", style: CustomFonts.grey18w600),
              Text("sarah.johnson@email.com", style: CustomFonts.grey18w500),
              SizedBox(height: 9.h,),
              Text("8 Sessions", style: CustomFonts.grey18w500),
            ],
          ),
        ],
      ),
    );
  }
}
