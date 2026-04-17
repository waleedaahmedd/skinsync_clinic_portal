import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/color_constant.dart';
import '../../utils/custom_fonts.dart';
import '../custom_dropdown_widget.dart';

class AddNoteDialog extends StatefulWidget {
  const AddNoteDialog({super.key});

  static void show(BuildContext context) {
    showDialog(context: context, builder: (_) => const AddNoteDialog());
  }

  @override
  State<AddNoteDialog> createState() => _AddNoteDialogState();
}

class _AddNoteDialogState extends State<AddNoteDialog> {
  final TextEditingController _noteController = TextEditingController();
  String _selectedNote = 'All note';

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            Row(
              mainAxisAlignment: .end,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 32.w,
                    width: 32.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Icon(Icons.close, size: 18.sp),
                  ),
                ),
              ],
            ),
            Text('Note Type', style: CustomFonts.black18w600),
            SizedBox(height: 8.h),
            CustomDropdown(
              hint: 'All note',
              value: _selectedNote,
              items: const ['All note', 'Note 1', 'Note 2', 'Note 3'],
              height: 42.h,
              onChanged: (value) =>
                  setState(() => _selectedNote = value ?? 'All note'),
            ),
            SizedBox(height: 16.h),
            Text('Note', style: CustomFonts.black18w600),
            SizedBox(height: 8.h),

            /// Note TextField
            TextField(
              controller: _noteController,
              maxLines: 5,
              style: CustomFonts.black14w400,
              decoration: InputDecoration(
                hintText: 'Write your note here...',
                hintStyle: CustomFonts.grey14w400,
                filled: true,
                fillColor: Color(0xFFF3F3F5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.r),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.all(14.w),
              ),
            ),
            SizedBox(height: 20.h),

            /// Save Button
            GestureDetector(
              onTap: () {
                // handle save
                Navigator.pop(context);
              },
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                decoration: BoxDecoration(
                  color: CustomColors.blackColor,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: Text('Save', style: CustomFonts.white16w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
