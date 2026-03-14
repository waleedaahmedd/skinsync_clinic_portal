import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinsync_clinic_portal/models/responses/get_feature_response.dart';
import 'package:skinsync_clinic_portal/models/responses/get_roles_response.dart';
import 'package:skinsync_clinic_portal/utils/color_constant.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';

import 'package:skinsync_clinic_portal/view_models/role_view_model.dart';
import 'package:skinsync_clinic_portal/widgets/dailog%20box/add_custom_role_dialog.dart';

class RolesScreen extends ConsumerStatefulWidget {
  static const String routeName = '/roles';
  const RolesScreen({super.key});

  @override
  ConsumerState<RolesScreen> createState() => _RolesScreenState();
}

class _RolesScreenState extends ConsumerState<RolesScreen> {
  late List<String> allRoles;

  late Map<String, Map<String, Map<String, bool>>> rolePermissions;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(roleProvider.notifier).getRole();
    });
  }

  void _showAddRoleDialog() {
    showDialog(context: context, builder: (context) => AddCustomRoleDialog());
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
            Consumer(
              builder: (context, ref, _) {
                final loading = ref.watch(roleProvider).loading;
                if (loading) {
                  return Expanded(child: Center(child: CircularProgressIndicator()));
                }
                return Expanded(
                  child: ListView.separated(
                    itemCount: ref.watch(roleProvider).roles.length,
                    separatorBuilder: (context, index) =>
                        SizedBox(height: 16.h),
                    itemBuilder: (context, index) {
                      final role = ref.watch(roleProvider).roles[index];
                      final selectedRole = ref.watch(roleProvider).selectedRole;
                      final isExpanded = selectedRole?.roleId == role.roleId;
                      
                      return Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                          side: BorderSide(color: Colors.grey.shade200),
                        ),
                        clipBehavior: Clip.antiAlias,
                        child: ExpansionTile(
                          onExpansionChanged: (value) {
                            final vm = ref.read(roleProvider.notifier);

                            if (value) {
                             
                              vm.setSelectedRole(role);
                            } else {
                              
                              vm.setSelectedRole(null);
                              vm.clear();
                            }
                          },
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
                            role.roleName?.toUpperCase() ?? "N/A",
                            style: CustomFonts.black18w600,
                          ),
                          subtitle: Text(
                            "Configure permissions for this role",
                            style: CustomFonts.grey14w400,
                          ),
                          children: [
                            if (selectedRole != null && isExpanded)
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
                                        Consumer(
                                          builder: (context,ref,_) {
                                            final loading = ref.watch(roleProvider).updateRole;
                                            return IgnorePointer(
                                                ignoring: loading,
                                              child: ElevatedButton.icon(
                                                    onPressed: () {
                                                      ref.read(roleProvider.notifier).updateRole().then((value){
                                                        if(value == true){
                                                          ref.read(roleProvider.notifier).getRole();
                                                        }
                                                      });
                                                    },
                                                    icon: const Icon(
                                                      Icons.save_outlined,
                                                      size: 16,
                                                    ),
                                                    label: loading? 
                                                    SizedBox(
                                                      height: 20.h,
                                                      width: 20.w,
                                                      child: CircularProgressIndicator(
                                                        color:Colors.white ,
                                                      ),
                                                    )
                                                    : Text(
                                                      "Save",
                                                      style: CustomFonts.white14w500,
                                                    ),
                                                    style: ElevatedButton.styleFrom(
                                                      backgroundColor:
                                                          CustomColors.blackColor,
                                                      padding: EdgeInsets.symmetric(
                                                        horizontal: 16.w,
                                                        vertical: 8.h,
                                                      ),
                                                    ),
                                                  ),
                                            );
                                          }
                                        )
                                        
                                      ],
                                    ),
                                    SizedBox(height: 16.h),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount: selectedRole.features!.length,
                                      itemBuilder: (context, featureIndex) {
                                        final feature =
                                            selectedRole.features![featureIndex];
                                      return Padding(
                                        padding: EdgeInsets.only(bottom: 10.h),
                                        child: Container(
                                          width: double.infinity,
                                          padding: EdgeInsets.all(10.w),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: CustomColors.borderColor,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              12.r,
                                            ),
                                            color: Colors.white,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                feature.featureTitle ?? "N/A",
                                                style: CustomFonts.black16w600,
                                              ),
                                              SizedBox(height: 10.h),
                                              Wrap(
                                                spacing: 8.w,
                                                runSpacing: 8.h,
                                                children: List.generate(
                                                  feature.permissions!.length,
                                                  (permissionIndex) {
                                                    final permissions = feature
                                                        .permissions![permissionIndex];
                                                    final select = feature
                                                        .activePermissionIds!
                                                        .contains(
                                                          permissions
                                                              .permissionId,
                                                        );

                                                    return ChoiceChip(
                                                      label: Text(
                                                        permissions
                                                                .permissionTitle ??
                                                            "N/A",
                                                      ),
                                                      selected: select,
                                                      selectedColor:
                                                          Colors.black,
                                                      checkmarkColor:
                                                          Colors.white,
                                                      labelStyle: TextStyle(
                                                        color: select
                                                            ? Colors.white
                                                            : Colors.black,
                                                        fontSize: 13.sp,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                      onSelected: (value) {
                                                        if (permissions.permissionId != null) {
                                                          ref.read(roleProvider.notifier).toggleRolePermission(
                                                            featureIndex: featureIndex,
                                                            permissionId: permissions.permissionId!,
                                                            selected: value,
                                                          );
                                                        }
                                                      },
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

}
