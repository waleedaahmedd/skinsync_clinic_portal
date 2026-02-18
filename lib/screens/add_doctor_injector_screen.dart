import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';
import 'package:skinsync_clinic_portal/utils/validators.dart';

import '../utils/enums.dart';
import '../utils/string_utils.dart';
import '../view_models/auth_view_model.dart';
import '../view_models/doctor_view_model.dart';
import '../view_models/treatment_view_model.dart';
import '../widgets/build_textfield.dart';
import '../widgets/header__with_back_btn.dart';

class AddDoctorInjectorScreen extends ConsumerStatefulWidget {
  const AddDoctorInjectorScreen({super.key});
  static const String routeName = '/add-doctor-injector';

  @override
  ConsumerState<AddDoctorInjectorScreen> createState() =>
      _AddTreatmentScreenState();
}

class _AddTreatmentScreenState extends ConsumerState<AddDoctorInjectorScreen> {
  final _nameController = TextEditingController();
  final _specializationController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {

        ref
            .read(treatmentViewModelProvider.notifier)
            .getTreatments();
    });
  }

  void _listener(DoctorState? prev, DoctorState next) {
    if (next.success) {
      log('SUCCESS -> Popping');
      ref.read(doctorProvider.notifier).getDoctors();
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _specializationController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(doctorProvider, _listener);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 250.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BuildHeader(title: 'Add Doctor / Injector'),
              SizedBox(height: 24.h),
              _buildFormContainer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFormContainer() {
    final loading = ref.watch(
      treatmentViewModelProvider.select((state) => state.loading),
    );
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: loading
          ? Center(child: CircularProgressIndicator())
          : Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Details', style: CustomFonts.black22w600),
                  SizedBox(height: 24.h),
                  Consumer(
                    builder: (_, ref, _) {
                      final role = ref.watch(
                        doctorProvider.select((state) => state.role),
                      );
                      return _buildDropdownField(
                        items: DoctorRole.values,
                        value: role,
                        onChanged: (role) =>
                            ref.read(doctorProvider.notifier).changeRole(role),
                        label: 'Select Role',
                        hintText: 'Select Role',
                        builder: (role) => Text(role.name.capitalize),
                      );
                    },
                  ),
                  SizedBox(height: 16.h),
                  BuildTextField(
                    controller: _nameController,
                    label: 'Name',
                    hintText: 'Name',
                    validator: Validators.empty,
                  ),
                  SizedBox(height: 16.h),
                  BuildTextField(
                    controller: _specializationController,
                    label: 'Specialization',
                    hintText: 'Specialization',
                    validator: Validators.empty,
                  ),
                  SizedBox(height: 16.h),
                  BuildTextField(
                    controller: _emailController,
                    label: 'Email',
                    hintText: 'Email',
                    validator: Validators.email,
                  ),
                  SizedBox(height: 16.h),
                  BuildTextField(
                    label: "Phone Number",
                    hintText: "+1 (555) 123-4567",
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    validator: Validators.phone,
                  ),
                  SizedBox(height: 16.h),
                  _buildTreatmentChips(),
                  SizedBox(height: 32.h),
                  _buildButtonsRow(),
                ],
              ),
            ),
    );
  }

  Widget _buildDropdownField<T>({
    required String label,
    required String hintText,
    required T? value,
    required List<T> items,
    required Function(T?) onChanged,
    Widget Function(T)? builder,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: CustomFonts.black14w500),
        SizedBox(height: 8.h),
        DropdownButtonHideUnderline(
          child: DropdownButton2<T>(
            isExpanded: true,
            hint: Text(hintText, style: TextStyle(color: Colors.grey[400])),
            value: value,
            items: items
                .map(
                  (item) => DropdownMenuItem<T>(
                    value: item,
                    child: builder?.call(item) ?? Text(item.toString()),
                  ),
                )
                .toList(),
            onChanged: onChanged,
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
    );
  }

  Widget _buildTreatmentChips() {
    return Consumer(
      builder: (_, ref, _) {
        final treatments = ref.watch(
          treatmentViewModelProvider.select((state) => state.treatments),
        );
        final selected = ref.watch(
          doctorProvider.select((state) => state.treatments),
        );
        return Wrap(
          spacing: 8.w,
          runSpacing: 8.h,
          children: treatments.map((treatment) {
            final isSelected = selected.any(
              (t) => t.treatmentId == treatment.id,
            );
            return ChoiceChip(
              label: Text(treatment.name ?? 'N/A'),
              selected: isSelected,
              selectedColor: Colors.black,
              // showCheckmark: false,
              checkmarkColor: Colors.white,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              onSelected: (selected) {
                // ref
                //     .read(doctorProvider.notifier)
                //     .toggleSelectedTreatment(treatment);
              },
            );
          }).toList(),
        );
      },
    );
  }

  Widget _buildButtonsRow() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              if (!_formKey.currentState!.validate()) {
                return;
              }
              ref
                  .read(doctorProvider.notifier)
                  .registerDoctor(
                    name: _nameController.text.trim(),
                    email: _emailController.text.trim(),
                    phone: _phoneController.text.trim(),
                    specialization: _specializationController.text.trim(),
                  );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              // padding: EdgeInsets.symmetric(vertical: 20.h),
            ),
            child: Text('Create', style: CustomFonts.white14w500),
          ),
        ),
        SizedBox(width: 16.w),
        Expanded(
          child: OutlinedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: CustomFonts.black14w500),
          ),
        ),
      ],
    );
  }
}
