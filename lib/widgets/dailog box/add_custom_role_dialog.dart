import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/dummy/roles.dart';
import '../../utils/color_constant.dart';
import '../../utils/custom_fonts.dart';
import '../../utils/responsive.dart';

class AddCustomRoleDialog extends StatefulWidget {
  final void Function(String, Map<String, Map<String, bool>>) onAddRole;
  const AddCustomRoleDialog({super.key, required this.onAddRole});

  @override
  State<AddCustomRoleDialog> createState() => _AddCustomRoleDialogState();
}

class _AddCustomRoleDialogState extends State<AddCustomRoleDialog> {
  final TextEditingController controller = TextEditingController();
  Map<String, Map<String, bool>> tempPermissions = {
    for (var module in modules)
      module: {for (var permission in permissionsList) permission: false},
  };

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 50.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: SizedBox(
        width: context.isLandscape ? 600.w : double.infinity,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Add Custom Role', style: CustomFonts.black22w600),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: EdgeInsets.all(4.r),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Icon(Icons.close, size: 20.r, color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Text("Role Name", style: CustomFonts.black14w500),
              SizedBox(height: 8.h),
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  hintText: "e.g. Manager",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              Text("Assign Permissions", style: CustomFonts.black14w500),
              SizedBox(height: 16.h),
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(2),
                  1: FlexColumnWidth(1),
                  2: FlexColumnWidth(1),
                  3: FlexColumnWidth(1),
                },
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      border: Border(
                        bottom: BorderSide(color: Colors.grey.shade300),
                      ),
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 12.h,
                          horizontal: 8.w,
                        ),
                        child: Text("Module", style: CustomFonts.black14w700),
                      ),
                      for (var permission in permissionsList)
                        Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            child: Text(
                              permission,
                              style: CustomFonts.black14w700,
                            ),
                          ),
                        ),
                    ],
                  ),
                  for (var module in modules)
                    TableRow(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey.shade100),
                        ),
                      ),
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 16.h,
                            horizontal: 8.w,
                          ),
                          child: Text(module, style: CustomFonts.black14w600),
                        ),
                        for (var permission in permissionsList)
                          Center(
                            child: Checkbox(
                              activeColor: CustomColors.blueColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.r),
                              ),
                              value: tempPermissions[module]![permission],
                              onChanged: (val) {
                                setState(() {
                                  tempPermissions[module]![permission] =
                                      val ?? false;
                                });
                              },
                            ),
                          ),
                      ],
                    ),
                ],
              ),
              SizedBox(height: 32.h),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (controller.text.trim().isNotEmpty) {
                          widget.onAddRole(
                            controller.text.trim(),
                            tempPermissions,
                          );
                          Navigator.pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                      ),
                      child: Text(
                        'Create Role',
                        style: CustomFonts.white14w500,
                      ),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        side: const BorderSide(color: Colors.black),
                      ),
                      child: Text(
                        'Cancel',
                        style: CustomFonts.black18w500.copyWith(
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
