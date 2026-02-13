import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:go_router/go_router.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';
import '../build_textfield.dart';
import '../header__with_back_btn.dart';

class AddTreatmentDialog extends StatefulWidget {
  const AddTreatmentDialog({super.key});

  @override
  State<AddTreatmentDialog> createState() => _AddTreatmentDialogState();
}

class _AddTreatmentDialogState extends State<AddTreatmentDialog> {
  final TextEditingController _treatmentNameController =
      TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String? _selectedCategory;
  final List<String> _categories = ['Botox', 'Dermal Filler'];
  final Map<String, List<String>> _categoryAreas = {
    'Dermal Filler': ['Temples', 'TearTough', 'Cheeks / Middle face volume'],
    'Botox': [
      'Forehead',
      'Glabella Line',
      'Eyebrow Lift',
      'Crows Feet',
      'Bunny Line',
    ],
  };
  final Set<String> _selectedAreas = {};
  final Map<String, TextEditingController> _areaPriceControllers = {};

  @override
  void dispose() {
    _treatmentNameController.dispose();
    _descriptionController.dispose();
    for (final c in _areaPriceControllers.values) {
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
            _buildFormContainer(),
          ],
        ),
      ),
    );
  }

  Widget _buildFormContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Treatment Details', style: CustomFonts.black22w600),
        SizedBox(height: 24.h),
        _buildDropdownField(
          label: 'Select Treatment',
          hintText: 'Select Treatment',
          value: _selectedCategory,
          items: _categories,
          onChanged: (value) {
            setState(() {
              _selectedCategory = value;
              _selectedAreas.clear();
              _areaPriceControllers.clear();
            });
          },
        ),

        if (_selectedCategory != null) ...[
          SizedBox(height: 16.h),
          _buildAreaChips(),
          SizedBox(height: 16.h),
          _buildAreaPriceFields(),
        ],
        SizedBox(height: 32.h),
        _buildButtonsRow(),
      ],
    );
  }

  // ===== Area Chips =====
  Widget _buildAreaChips() {
    final areas = _categoryAreas[_selectedCategory] ?? [];
    return Wrap(
      spacing: 8.w,
      runSpacing: 8.h,
      children: areas.map((area) {
        final isSelected = _selectedAreas.contains(area);
        return ChoiceChip(
          label: Text(area),
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
                _areaPriceControllers[area] = TextEditingController();
              } else {
                _selectedAreas.remove(area);
                _areaPriceControllers[area]?.dispose();
                _areaPriceControllers.remove(area);
              }
            });
          },
        );
      }).toList(),
    );
  }

  // ===== Price Fields =====
  Widget _buildAreaPriceFields() {
    return Column(
      children: _selectedAreas.map((area) {
        return Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child: BuildTextField(
            label: '$area Per Syringe Price',
            controller: _areaPriceControllers[area]!,
            hintText: '\$200',
          ),
        );
      }).toList(),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String hintText,
    required String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: CustomFonts.black14w500),
        SizedBox(height: 8.h),
        DropdownButtonHideUnderline(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: Text(hintText, style: TextStyle(color: Colors.grey[400])),
            value: value,
            items: items
                .map((item) => DropdownMenuItem(value: item, child: Text(item)))
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

  Widget _buildButtonsRow() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              final Map<String, String> areaPrices = {
                for (var area in _selectedAreas)
                  area: _areaPriceControllers[area]!.text,
              };
              debugPrint(areaPrices.toString());
              Navigator.of(context).pop(); // close dialog
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Treatment created successfully!'),
                  backgroundColor: Colors.green,
                ),
              );
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
            onPressed: () => Navigator.of(context).pop(), // close dialog
            child: Text('Cancel', style: CustomFonts.black18w500),
          ),
        ),
      ],
    );
  }
}
