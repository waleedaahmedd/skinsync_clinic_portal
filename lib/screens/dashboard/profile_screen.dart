import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:skinsync_clinic_portal/screens/about_screen.dart';
import 'package:skinsync_clinic_portal/screens/dashboard/mange_staff_screen.dart';
import 'package:skinsync_clinic_portal/screens/notification_screen.dart';

import '../business_info_screen.dart';
import '../change_password_screen.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              child: Text(
                "Profile",
                style: TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),

            Divider(color: Colors.grey.shade300, height: 1),

            SizedBox(height: 20.h),

            // Profile Info
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: _buildProfileInfoContainer(),
            ),

            SizedBox(height: 20.h),

            // Clinic Settings
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: _buildSettingsSection(
                title: "Clinic Settings",
                items: [
                  _SettingItemData(
                    icon: Icons.business_outlined,
                    title: "Business Information",
                    subtitle: "Update clinic details and contact info",
                    onTap: () {
                      context.push(BusinessInformationScreen.routeName);
                    },
                  ),
                  _SettingItemData(
                    icon: Icons.people_outline,
                    title: "Manage Staff",
                    subtitle: "Manage clinic staff and services",
                    onTap: () {
                      context.push(ManageStaffScreen.routeName);
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 20.h),

            // Treatment Management
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 16.w),
            //   child: _buildSettingsSection(
            //     title: "Treatment Management",
            //     items: [
            //       _SettingItemData(
            //         icon: Icons.add_circle_outline,
            //         title: "Create Treatment",
            //         subtitle: "Add new treatments and services",
            //         onTap: () {
            //           context.push(CreateTreatmentScreen.routeName);
            //         },
            //       ),
            //       _SettingItemData(
            //         icon: Icons.edit_outlined,
            //         title: "Update Treatment",
            //         subtitle: "Edit existing treatment details",
            //         onTap: () {
            //           context.push(UpdateTreatmentScreen.routeName);
            //         },
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(height: 20.h),

            // password security
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: _buildSettingsSection(
                title: "Security",
                items: [
                  _SettingItemData(
                    icon: Icons.lock_open,
                    title: "Password & Security",
                    subtitle: "Update password and security settings",
                    onTap: () {
                      context.push(ChangePasswordScreen.routeName);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),

            // preference
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: _buildSettingsSection(
                title: "Preferences",
                items: [
                  _SettingItemData(
                    icon: Icons.notifications_outlined,
                    title: "Notifications",
                    subtitle: "Manage notification settings",
                    onTap: () {
                      context.push(NotificationScreen.routeName);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.h),

            // preference
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: _buildSettingsSection(
                title: "Help & Support",
                items: [
                  _SettingItemData(
                    icon: Icons.privacy_tip_outlined,
                    title: "About",
                    subtitle: "Terms, conditions, and privacy policy",
                    onTap: () {
                      context.push(AboutScreen.routeName);
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }

  // Profile Info Container
  Widget _buildProfileInfoContainer() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFFB8A5D8), Color(0xFF7B94C4)],
        ),
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        children: [
          Container(
            width: 70.w,
            height: 70.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade300,
              border: Border.all(color: Colors.white, width: 3.w),
            ),
            child: Icon(Icons.person, size: 40.sp, color: Colors.grey.shade600),
          ),
          SizedBox(height: 12.h),
          Text(
            "John Doe",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            "john@example.com",
            style: TextStyle(
              fontSize: 13.sp,
              color: Colors.black.withValues(alpha: 0.7),
            ),
          ),
        ],
      ),
    );
  }

  // Reusable Settings Section
  Widget _buildSettingsSection({
    required String title,
    required List<_SettingItemData> items,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 14.h),
          ...items.map(
            (item) => Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: _buildSettingItem(
                icon: item.icon,
                title: item.title,
                subtitle: item.subtitle,
                onTap: item.onTap,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Setting Item Row
  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(8.w),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 18.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 2.h),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey.shade600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Icon(
            CupertinoIcons.chevron_right,
            size: 16.sp,
            color: Colors.grey.shade600,
          ),
        ],
      ),
    );
  }
}

// Data Model
class _SettingItemData {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  _SettingItemData({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });
}
