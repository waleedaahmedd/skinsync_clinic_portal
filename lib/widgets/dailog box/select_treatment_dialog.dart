import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../models/treatment_model.dart';
import '../../utils/custom_fonts.dart';
import '../../utils/extentions.dart';
import '../../view_models/treatment_view_model.dart';

class SelectTreatmentDialog extends ConsumerStatefulWidget {
  const SelectTreatmentDialog({super.key});

  @override
  ConsumerState<SelectTreatmentDialog> createState() =>
      _AddTreatmentDialogState();
}

class _AddTreatmentDialogState extends ConsumerState<SelectTreatmentDialog> {
  @override
  void initState() {
    ref.read(treatmentViewModelProvider.notifier).getAdminTreatments().then((
      treatments,
    ) {
      setState(() {
        _loadingTreatments = false;
        _adminTreatments = treatments;
      });
    });

    super.initState();
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _loadingTreatments = true;
  bool _loadingAreas = false;

  TreatmentModel? _selectedTreatment;
  late List<TreatmentModel> _adminTreatments;
  late List<SideAreaModel> _sideAreas;
  late List<SideAreaModel> _selectedAreas;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 50.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(24.w),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text('Add Treatment', style: CustomFonts.black22w600),
                  IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: Icon(Icons.close, color: Colors.black),
                  ),
                ],
              ),
              // SizedBox(height: 24.h),
              // Text('Treatment Details', style: CustomFonts.black22w600),
              SizedBox(height: 40.h),

              Text("Select Treatment", style: CustomFonts.black14w500),
              SizedBox(height: 8.h),
              _loadingTreatments
                  ? Container(
                      height: 48.h,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ).withShimmer()
                  : DropdownButtonHideUnderline(
                      child: DropdownButton2<TreatmentModel>(
                        isExpanded: true,
                        hint: Text(
                          "Select Treatment",
                          style: TextStyle(color: Colors.grey[400]),
                        ),
                        value: _selectedTreatment,
                        items: _adminTreatments
                            .map(
                              (item) => DropdownMenuItem(
                                value: item,
                                child: Text(item.name ?? "N/A"),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value == null || value == _selectedTreatment) {
                            return;
                          }

                          setState(() {
                            _selectedTreatment = value;
                          });
                          if (value.isArea == true) {
                            setState(() {
                              _loadingAreas = true;
                            });
                            ref
                                .read(treatmentViewModelProvider.notifier)
                                .getTreatmentsSideAreas(treatmentId: value.id!)
                                .then((areas) {
                                  setState(() {
                                    _sideAreas = areas;
                                    _loadingAreas = false;
                                    _selectedAreas = [];
                                  });
                                });
                          }
                        },
                        buttonStyleData: ButtonStyleData(
                          height: 48.h,
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(color: Colors.grey[300]!),
                          ),
                        ),
                      ),
                    ),
              SizedBox(height: 30.h),
              Text("Select Areas", style: CustomFonts.black14w500),

              if (_selectedTreatment?.isArea == true && _loadingAreas) ...[
                SizedBox(height: 20.h),
                Wrap(
                  spacing: 8.w,
                  runSpacing: 8.h,
                  children: List.generate(8, (index) {
                    return Container(
                      height: 48.h,
                      width: 150.w,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ).withShimmer();
                  }).toList(),
                ),
              ],

              if (_selectedTreatment?.isArea == true && !_loadingAreas) ...[
                SizedBox(height: 16.h),
                Wrap(
                  spacing: 8.w,
                  runSpacing: 8.h,
                  children: (_sideAreas).map((area) {
                    final isSelected = _selectedAreas.contains(area);
                    return ChoiceChip(
                      label: Text(area.name ?? "N/A"),
                      selected: isSelected,
                      selectedColor: Colors.black,
                      checkmarkColor: Colors.white,
                      labelStyle: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            _selectedAreas.add(area);
                          } else {
                            _selectedAreas.remove(area);
                            final index = _selectedAreas.indexOf(area);
                            if (index != -1) {}
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
                SizedBox(height: 30.h),
              ],
              SizedBox(height: 32.h),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // 2️⃣ If treatments or side areas are loading
                        if (_loadingAreas || _loadingTreatments) {
                          EasyLoading.showError('Please wait while we load');
                          return;
                        }
                        // 1️⃣ Treatment must be selected
                        if (_selectedTreatment == null) {
                          EasyLoading.showError('Please select a treatment');
                          return;
                        }

                        // 2️⃣ If treatment has areas → at least one area required
                        if (_selectedTreatment!.isArea == true &&
                            _selectedAreas.isEmpty) {
                          EasyLoading.showError(
                            'Please select at least one area',
                          );
                          return;
                        }

                        // 3️⃣ Validate form (prices)
                        final isValid =
                            _formKey.currentState?.validate() ?? false;
                        if (!isValid) {
                          return;
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                      ),
                      child: Text('Create', style: CustomFonts.white14w500),
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () =>
                          Navigator.of(context).pop(), // close dialog
                      child: Text('Cancel', style: CustomFonts.black18w500),
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
