import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';
import 'package:skinsync_clinic_portal/utils/extentions.dart';
import '../../models/requests/add_treatment_req_model.dart';
import '../../models/treatment_model.dart';
import '../../view_models/treatment_view_model.dart';
import '../build_textfield.dart';

class AddTreatmentDialog extends ConsumerStatefulWidget {
  const AddTreatmentDialog({super.key});

  @override
  ConsumerState<AddTreatmentDialog> createState() => _AddTreatmentDialogState();
}

class _AddTreatmentDialogState extends ConsumerState<AddTreatmentDialog> {
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
  final List<TextEditingController> _areaPriceControllers = [];

  @override
  void dispose() {
    for (final c in _areaPriceControllers) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 50.h),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: SingleChildScrollView(
        padding: EdgeInsets.all(24.w),
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
            SizedBox(height: 24.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Treatment Details', style: CustomFonts.black22w600),
                SizedBox(height: 24.h),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                                if (value == null ||
                                    value == _selectedTreatment) {
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
                                      .getTreatmentsSideAreas(
                                        treatmentId: value.id!,
                                      )
                                      .then((areas) {
                                        setState(() {
                                          _sideAreas = areas;
                                          _loadingAreas = false;
                                          _selectedAreas = [];
                                          _areaPriceControllers.clear();
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
                  ],
                ),

                if (_selectedTreatment?.isArea == true && _loadingAreas) ...[
                  SizedBox(height: 16.h),

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
                              _areaPriceControllers.add(
                                TextEditingController(),
                              );
                            } else {
                              _selectedAreas.remove(area);
                              final index = _selectedAreas.indexOf(area);
                              if (index != -1) {
                                _areaPriceControllers[index].dispose();
                                _areaPriceControllers.removeAt(index);
                              }
                            }
                          });
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16.h),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: _selectedAreas.map((area) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: BuildTextField(
                            onChanged: (value) {
                              _selectedAreas[_selectedAreas.indexOf(area)]
                                  .perSyringePrice = double.tryParse(
                                value ?? '0',
                              );
                              print(_sideAreas);
                            },
                            validator: (value) {
                              if (value == null ||
                                  value.isEmpty ||
                                  int.parse(value) == 0) {
                                return 'Price is required';
                              }
                              return null;
                            },

                            label: '${area.name} Per Syringe Price',
                            controller:
                                _areaPriceControllers[_selectedAreas.indexOf(
                                  area,
                                )],
                            hintText: '\$200',
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
                SizedBox(height: 32.h),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
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
                          ref
                              .read(treatmentViewModelProvider.notifier)
                              .addClinicTreatment(
                                treatment: AddTreatmentReqModel(
                                  treatmentId: _selectedTreatment!.id!,
                                  sideareas: _selectedAreas,
                                ),
                              )
                              .then((value) {
                                if (value && context.mounted) {
                                  context.pop();
                                }
                              });
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
          ],
        ),
      ),
    );
  }
}
