import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:skinsync_clinic_portal/screens/dashboard/patient_management_detail.dart';
import 'package:skinsync_clinic_portal/utils/assets.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';

class TreatmentContainer extends StatelessWidget {
  const TreatmentContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go(PatientManagementDetailScreen.routeName);
      },
      child: Container(
        padding: EdgeInsets.all(15.w),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.r)),
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
            Text("Provider: Dr. Smith", style: CustomFonts.grey18w500),
            SizedBox(height: 9.h),
            Text("Oct 29, 2025", style: CustomFonts.grey18w500),
          ],
        ),
      ),
    );
  }
}
