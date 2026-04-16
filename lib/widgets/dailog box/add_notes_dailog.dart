

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';
import 'package:skinsync_clinic_portal/widgets/custom_dropdown_widget.dart';

class AddNotesDailog extends StatefulWidget {
  const AddNotesDailog({super.key});

  @override
  State<AddNotesDailog> createState() => _AddNotesDailogState();
}

class _AddNotesDailogState extends State<AddNotesDailog> {
  String? _selectedType ;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Container(
        width: 354.w,
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Header
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  height: 32.w,
                  width: 32.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black12),
                  ),
                  child: const Icon(Icons.close, size: 18),
                ),
              ),
            ),
            Text("Note Type", style: CustomFonts.black18w600),
            SizedBox(height: 5.h),
            CustomDropdown(
              hint: "Select type",
              value: _selectedType,
              items: [
                "General Note",
                "Treatment Note",
                "Follow-up Note",
                "Prescription Note",
                "Allergy Note",
                "Pre-Treatment Note",
                "Post-Treatment Note",
                "Consultation Note",
              ],
              height: 42.h,
              onChanged: (value) =>
                  setState(() => _selectedType = value ?? 'General Note'),
            ),
            SizedBox(height: 30.h),

            Text("Notes", style: CustomFonts.black18w600),
            SizedBox(height: 5.h),
            TextField(
              maxLines: 2,
              decoration: InputDecoration(hintText: "Write your note here"),
            ),
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () {}, child: Text("Save Note")),
            ),
          ],
        ),
      ),
    );
  }
}
