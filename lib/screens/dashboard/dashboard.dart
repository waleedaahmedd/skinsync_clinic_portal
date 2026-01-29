import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:skinsync_clinic_portal/screens/dashboard/appointment_screen.dart';
import 'package:skinsync_clinic_portal/screens/dashboard/payment_and_wallet_screen.dart';
import 'package:skinsync_clinic_portal/utils/responsive.dart';

import '../../utils/assets.dart';
import '../../utils/color_constant.dart';
import '../../widgets/custom_app_bar.dart';
import 'home_screen.dart';
import 'patient_ai_management.dart';
import 'patient_management.dart';
import 'profile_screen.dart';

class Dashboard extends StatelessWidget {
  static const String routeName = '/dashboard';
  final Widget child;
  const Dashboard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.dashboardBackgroundColor,
      // appBar: CustomAppBar(),
      drawer: Responsive.when(
        defaultValue: SizedBox.shrink(),
        mobile: () => _buildDrawer(),
        tablet: () => _buildDrawer(),
      ),
      body: Row(
        children: [
          Responsive.when(
            defaultValue: SizedBox.shrink(),
            desktop: () => _buildDrawer(),
          ),
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
          padding: EdgeInsets.symmetric(vertical: 38.h),
          margin: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
            color: Responsive.when(
              defaultValue: CustomColors.navigationRailBackground,
              mobile: () =>
                  CustomColors.navigationRailBackground.withValues(alpha: 1),
              tablet: () =>
                  CustomColors.navigationRailBackground.withValues(alpha: 1),
            ),
            borderRadius: BorderRadiusGeometry.circular(10.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 10.h,
            children: [
              Image.asset(PngAssets.splashLogo, width: 48.w, height: 48.w),
              SizedBox(width: 5.w),
              Image.asset(PngAssets.logo, height: 20.h),
              SizedBox(width: 40.w),
              _buildRailItem(
                context: context,
                title: 'Home',
                icon: SvgAssets.home,
                routeName: HomeScreen.routeName,
              ),
              _buildRailItem(
                context: context,
                title: 'Patient Management',
                icon: SvgAssets.user,
                routeName: PatientManagementScreen.routeName,
              ),
              _buildRailItem(
                context: context,
                title: 'Patient AI Management',
                icon: SvgAssets.ai,
                routeName: PatientAiManagement.routeName,
              ),
              _buildRailItem(
                context: context,
                title: 'Appointments',
                icon: SvgAssets.appointments,
                routeName: AppointmentScreen.routeName,
              ),
              _buildRailItem(
                context: context,
                title: 'Payments & Wallets',
                icon: SvgAssets.payments,
                routeName: PaymentAndWalletScreen.routeName,
              ),
              _buildRailItem(
                context: context,
                title: 'Profile',
                icon: SvgAssets.profile,
                routeName: ProfileScreen.routeName,
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
    required String icon,
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
      icon: SvgPicture.asset(
        icon,
        width: 20.w,
        height: 20.w,
        color: isSelected
            ? Responsive.when(
                defaultValue: CustomColors.blueColor,
                mobile: () => Colors.black,
                tablet: () => Colors.black,
              )
            : CustomColors.textGreyColor,
      ),
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
