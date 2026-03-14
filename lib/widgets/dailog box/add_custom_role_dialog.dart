import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinsync_clinic_portal/models/responses/get_feature_response.dart';
import 'package:skinsync_clinic_portal/view_models/role_view_model.dart';

import '../../models/dummy/roles.dart';
import '../../utils/color_constant.dart';
import '../../utils/custom_fonts.dart';
import '../../utils/responsive.dart';

class AddCustomRoleDialog extends ConsumerStatefulWidget {
  
  const AddCustomRoleDialog({super.key,});

  @override
  ConsumerState<AddCustomRoleDialog> createState() =>
      _AddCustomRoleDialogState();
}

class _AddCustomRoleDialogState extends ConsumerState<AddCustomRoleDialog> {
  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(roleProvider.notifier).getFeature();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final loading = ref.watch(roleProvider).loading;

    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 50.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: SizedBox(
        width: context.isLandscape ? 600.w : double.infinity,
        child: Padding(
          padding: EdgeInsets.all(24.w),
          child: Form(
            key: _formKey,
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
                        child: Icon(
                          Icons.close,
                          size: 20.r,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.h),
                Text("Role Name", style: CustomFonts.black14w500),
                SizedBox(height: 8.h),
                TextFormField(
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
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Role name is required";
                    }

                    return null;
                  },
                ),
                SizedBox(height: 30.h),
                Text("Assign Permissions", style: CustomFonts.black14w500),
                SizedBox(height: 16.h),
                Consumer(
                  builder: (context, ref, _) {
                    final state = ref.watch(roleProvider);
                    if (state.loading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state.features.isEmpty) {
                      return Center(child: Text("No Features Available"));
                    } else {
                      return Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          // physics: NeverScrollableScrollPhysics(),
                          itemCount: ref.read(roleProvider).features.length,
                          itemBuilder: (context, index) {
                            final feature = ref.watch(roleProvider).features;
                            return Padding(
                              padding: EdgeInsets.only(bottom: 10.h),
                              child: _buildFeatureContainer(
                                feature: feature[index],
                                ref: ref,
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),

                SizedBox(height: 32.h),
                Consumer(
                  builder: (context, ref, _) {
                    final loading = ref.watch(roleProvider).createRoleLoading;
                    final state = ref.read(roleProvider);
                    if (loading) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                if (state.selectedFeatures.isEmpty) {
                                  EasyLoading.showToast(
                                    "Please select at least one permission",
                                  );

                                  return;
                                } else {
                                  final success = await ref
                                      .read(roleProvider.notifier)
                                      .createRole(controller.text.trim());

                                  if (success == true) {
                                    Navigator.pop(context);
                                  }
                                }
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
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureContainer({
    required Feature feature,
    required WidgetRef ref,
  }) {
    final vm = ref.read(roleProvider.notifier);
   
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        border: Border.all(color: CustomColors.borderColor),
        borderRadius: BorderRadius.circular(12.r),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(feature.featureName ?? "N/A", style: CustomFonts.black16w600),
          SizedBox(height: 10.h),

          Wrap(
            spacing: 8.w,
            runSpacing: 8.h,
            children: List.generate(feature.permissions!.length, (index) {
              final permissions = feature.permissions![index];

              final selectedFeature = vm.getSelectedFeature(feature.featureId!);

              final isSelected =
                  selectedFeature?.permissions?.any(
                    (a) => a.permissionId == permissions.permissionId,
                  ) ??
                  false;

              return ChoiceChip(
                label: Text(permissions.permissionTitle ?? "N/A"),
                selected: isSelected,
                selectedColor: Colors.black,
                checkmarkColor: Colors.white,
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
                onSelected: (value) {
                  vm.toggleAction(
                    feature: feature,
                    permissions: permissions,
                    selected: value,
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
