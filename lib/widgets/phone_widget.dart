import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';

import '../utils/color_constant.dart';

class PhoneWidget extends ConsumerWidget {
  final TextEditingController controller;
  final ValueSetter<String>? onChanged;
  final ValueSetter<CountryCode>? onCountryChanged;
  final String? initialCountryCode;

  final bool showLabel;
  final bool filled;
  final bool removeValidation;
  final bool isEditable;

  PhoneWidget({
    super.key,
    required this.controller,
    this.onChanged,
    this.onCountryChanged,
    this.initialCountryCode,
    this.isEditable = false,
    this.showLabel = true,
    this.filled = false,
    this.removeValidation = false,
  });

  final FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10.h,
      children: [
        TextFormField(
          readOnly: isEditable,
          controller: controller,
          onChanged: onChanged,
          autofocus: false,
          inputFormatters: [
            LengthLimitingTextInputFormatter(11),
            FilteringTextInputFormatter.digitsOnly,
          ],
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your phone number';
            } else if (value.length < 10) {
              return 'Please enter a valid phone number';
            }
            return null;
          },
          style: Theme.of(
            context,
          ).textTheme.bodyLarge!.copyWith(fontFamily: "General Sans"),
          onTapOutside: (_) {
            _focusNode.unfocus();
          },
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            filled: filled,
            fillColor: CustomColors.textGreyColor,
            hintText: '921 - 2341 -99908',
            hintStyle: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
            prefixIcon: _buildPhoneNumberPicker(context: context, ref: ref),
          ),
        ),
      ],
    );
  }

  IntrinsicHeight _buildPhoneNumberPicker({
    required BuildContext context,
    required WidgetRef ref,
  }) {
    return IntrinsicHeight(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {},
            child: CountryCodePicker(
              onChanged: onCountryChanged,
              dialogSize: Size(400.w, 600.w),
              textStyle: CustomFonts.black14w500,
              initialSelection: initialCountryCode ?? "GB",
              showCountryOnly: false,
              showOnlyCountryWhenClosed: false,
              alignLeft: false,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 14.3.h),
            child: const VerticalDivider(
              color: Color(0xffE2E5E8),
              thickness: 1,
            ),
          ),
        ],
      ),
    );
  }
}
