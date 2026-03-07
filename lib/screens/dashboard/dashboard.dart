import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:skinsync_clinic_portal/screens/dashboard/appointment_screen.dart';
import 'package:skinsync_clinic_portal/screens/dashboard/inventory_screen.dart';
import 'package:skinsync_clinic_portal/screens/dashboard/payment_and_wallet_screen.dart';
import 'package:skinsync_clinic_portal/utils/responsive.dart';

import '../../utils/assets.dart';
import '../../utils/color_constant.dart';
import '../../widgets/custom_app_bar.dart';
import 'home_screen.dart';
import 'manage_doc_injector_screen.dart';
import 'mange_staff_screen.dart';
import 'patient_ai_management.dart';
import 'patient_management.dart';
import 'profile_screen.dart';
import 'treatment_screen.dart';

class Dashboard extends StatelessWidget {
  static const String routeName = '/dashboard';
  final Widget child;

  const Dashboard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.dashboardBackgroundColor,
      // appBar: CustomAppBar(),
      drawer: context.isLandscape ? SizedBox.shrink() : _buildDrawer(),
      body: Row(
        children: [
          context.isLandscape ? _buildDrawer() : SizedBox.shrink(),
          Expanded(
            child: Column(
              children: [
                CustomAppBar(),
                Expanded(child: child),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Builder(
      builder: (context) {
        return Container(
          width: 270.w,
          height: double.infinity,
          padding: EdgeInsets.only(top: 38.h, bottom: 20.h),
          margin: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: CustomColors.navigationRailBackground,
            borderRadius: BorderRadiusGeometry.circular(10.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 10.h,
            children: [
              Image.asset(PngAssets.splashLogo, width: 48.r, height: 48.r),
              SizedBox(width: 5.w),
              Image.asset(PngAssets.logo, height: 20.r),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(width: 40.w),

                      _buildRailItem(
                        context: context,
                        title: 'Home',
                        chipIcon: Iconsax.home_2,
                        routeName: HomeScreen.routeName,
                      ),
                      _buildRailItem(
                        context: context,
                        title: 'Patient Management',
                        chipIcon: Iconsax.profile_2user,
                        routeName: PatientManagementScreen.routeName,
                      ),
                      _buildRailItem(
                        context: context,
                        title: 'Patient AI Management',
                        chipIcon: Iconsax.chart_34,
                        routeName: PatientAiManagementScreen.routeName,
                      ),
                      _buildRailItem(
                        context: context,
                        title: 'Appointments',
                        chipIcon: Iconsax.calendar,
                        routeName: AppointmentScreen.routeName,
                      ),
                      _buildRailItem(
                        context: context,
                        title: 'Treatments',
                        chipIcon: Icons.vaccines_outlined,
                        routeName: TreatmentScreen.routeName,
                      ),
                      _buildRailItem(
                        context: context,
                        title: 'Doctors / Injectors',
                        chipIcon: Icons.masks_outlined,
                        routeName: MangeDoctorsInjectorsScreen.routeName,
                      ),
                      _buildRailItem(
                        context: context,
                        title: 'Inventory',
                        chipIcon: Icons.inventory,
                        routeName: InventoryScreen.routeName,
                      ),
                      _buildRailItem(
                        context: context,
                        title: 'Staff',
                        chipIcon: Iconsax.user_octagon,
                        routeName: ManageStaffScreen.routeName,
                      ),
                      _buildRailItem(
                        context: context,
                        title: 'Payments & Wallets',
                        chipIcon: Iconsax.wallet_3,
                        routeName: PaymentAndWalletScreen.routeName,
                      ),
                      _buildRailItem(
                        context: context,
                        title: 'Profile',
                        chipIcon: Iconsax.profile_circle,
                        routeName: ProfileScreen.routeName,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildRailItem({
    required BuildContext context,
    required String title,
    required IconData chipIcon,
    required String routeName,
  }) {
    final uri = GoRouter.of(context).state.path;
    final isSelected = uri == routeName;
    return ElevatedButton.icon(
      onPressed: () {
        context.go(routeName);
        if (Scaffold.of(context).hasDrawer) {
          Scaffold.of(context).closeDrawer();
        }
      },
      label: Text(
        title,
        style: TextStyle(
          fontSize: 15.sp,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
          color: isSelected
              ? CustomColors.blackColor
              : CustomColors.textGreyColor,
        ),
      ),
      icon: Icon(
        chipIcon,
        size: 20.r,
        color: isSelected ? CustomColors.purpleColor : CustomColors.blueColor,
      ),
      // icon: SvgPicture.asset(
      //   icon,
      //   width: 20.w,
      //   height: 20.w,
      //   color: isSelected
      //       ?
      //   // context.isLandscape ?
      //    CustomColors.blueColor
      //             // : Colors.black
      //       : CustomColors.purpleColor,
      // ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        minimumSize: Size(double.infinity, 22.h),
        alignment: Alignment.centerLeft,
        elevation: 0,
        shadowColor: Colors.transparent,
        padding: EdgeInsets.all(15.w),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(15.r),
        ),
      ),
    );
  }
}
