import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinsync_clinic_portal/utils/color_constant.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';
import 'package:skinsync_clinic_portal/utils/enums.dart';
import 'package:skinsync_clinic_portal/widgets/dailog%20box/add_custom_role_dialog.dart';

import '../../models/dummy/roles.dart';

class RolesScreen extends StatefulWidget {
  static const String routeName = '/roles';
  const RolesScreen({super.key});

  @override
  State<RolesScreen> createState() => _RolesScreenState();
}

class _RolesScreenState extends State<RolesScreen> {
  late List<String> allRoles;

  late Map<String, Map<String, Map<String, bool>>> rolePermissions;

  @override
  void initState() {
    super.initState();
    allRoles = Role.values.map((e) => e.name).toList();

    rolePermissions = {
      for (var role in allRoles)
        role: {
          for (var module in modules)
            module: {for (var permission in permissionsList) permission: false},
        },
    };

    // Initialize some defaults for the Doctor role
    for (var module in modules) {
      rolePermissions[Role.doctor.name]![module]!['Create'] = true;
      rolePermissions[Role.doctor.name]![module]!['Update'] = true;
      rolePermissions[Role.doctor.name]![module]!['Delete'] = true;
    }
  }

  void _addCustomRole(String name, Map<String, Map<String, bool>> permissions) {
    if (name.isEmpty || allRoles.contains(name.toLowerCase())) return;
    setState(() {
      String newRole = name.toLowerCase();
      allRoles.add(newRole);
      rolePermissions[newRole] = permissions;
    });
  }

  void _showAddRoleDialog() {
    showDialog(
      context: context,
      builder: (context) => AddCustomRoleDialog(onAddRole: _addCustomRole),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.dashboardBackgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Roles Management", style: CustomFonts.black22w600),
                ElevatedButton(
                  onPressed: _showAddRoleDialog,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 12.h,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    elevation: 0,
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.add, color: Colors.white, size: 20.r),
                      SizedBox(width: 8.w),
                      Text('Add Custom Role', style: CustomFonts.white14w500),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 14.h),
            Divider(color: Colors.grey.shade300),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.separated(
                itemCount: allRoles.length,
                separatorBuilder: (context, index) => SizedBox(height: 16.h),
                itemBuilder: (context, index) {
                  final role = allRoles[index];
                  return Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      side: BorderSide(color: Colors.grey.shade200),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: ExpansionTile(
                      backgroundColor: Colors.white,
                      collapsedBackgroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        side: BorderSide.none,
                      ),
                      leading: CircleAvatar(
                        backgroundColor: CustomColors.blueColor.withValues(
                          alpha: 0.1,
                        ),
                        child: Icon(
                          Icons.person_outline,
                          color: CustomColors.blueColor,
                          size: 20.sp,
                        ),
                      ),
                      title: Text(
                        role.toUpperCase(),
                        style: CustomFonts.black18w600,
                      ),
                      subtitle: Text(
                        "Configure permissions for this role",
                        style: CustomFonts.grey14w400,
                      ),
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Permission Matrix",
                                    style: CustomFonts.black16w700,
                                  ),
                                  ElevatedButton.icon(
                                    onPressed: () {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Permissions updated for ${role.toUpperCase()}',
                                          ),
                                          backgroundColor:
                                              CustomColors.blueColor,
                                        ),
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.save_outlined,
                                      size: 16,
                                    ),
                                    label: Text(
                                      "Save",
                                      style: CustomFonts.white14w500,
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: CustomColors.blackColor,
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 16.w,
                                        vertical: 8.h,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16.h),
                              Table(
                                columnWidths: const {
                                  0: FlexColumnWidth(2.5),
                                  1: FlexColumnWidth(1),
                                  2: FlexColumnWidth(1),
                                  3: FlexColumnWidth(1),
                                },
                                children: [
                                  // Table Header
                                  TableRow(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade50,
                                      border: Border(
                                        bottom: BorderSide(
                                          color: Colors.grey.shade300,
                                          width: 1,
                                        ),
                                      ),
                                    ),
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                          vertical: 12.h,
                                          horizontal: 8.w,
                                        ),
                                        child: Text(
                                          "Module",
                                          style: CustomFonts.black14w700,
                                        ),
                                      ),
                                      for (var permission in permissionsList)
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 12.h,
                                          ),
                                          child: Center(
                                            child: Text(
                                              permission,
                                              style: CustomFonts.black14w700,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  // Table Rows
                                  for (var module in modules)
                                    TableRow(
                                      decoration: BoxDecoration(
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Colors.grey.shade100,
                                          ),
                                        ),
                                      ),
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 16.h,
                                            horizontal: 8.w,
                                          ),
                                          child: Text(
                                            module,
                                            style: CustomFonts.black14w600,
                                          ),
                                        ),
                                        for (var permission in permissionsList)
                                          Center(
                                            child: Checkbox(
                                              activeColor:
                                                  CustomColors.blueColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4.r),
                                              ),
                                              value:
                                                  rolePermissions[role]![module]![permission],
                                              onChanged: (val) {
                                                setState(() {
                                                  rolePermissions[role]![module]![permission] =
                                                      val ?? false;
                                                });
                                              },
                                            ),
                                          ),
                                      ],
                                    ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
