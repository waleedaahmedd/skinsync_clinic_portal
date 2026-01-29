import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinsync_clinic_portal/utils/color_constant.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';
import 'package:skinsync_clinic_portal/widgets/appointment_tile_widget.dart';
import 'package:skinsync_clinic_portal/widgets/borderd_container_widget.dart';

import '../../widgets/appointment_horizontal_tile_widget.dart';
import '../../widgets/calender_widget.dart';
import '../../widgets/custom_dropdown_widget.dart';

class AppointmentScreen extends StatelessWidget {
  static const String routeName = '/appointment';
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Appointments",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(width: 36.w),
                Expanded(
                  child: SizedBox(
                    height: 45.h,
                    child: ListView.builder(
                      itemCount: 6,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return AppointmentHorizontalTileWidget(
                          index: index,
                          selected: index == 0,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 14.h),
            Divider(),

            SizedBox(height: 14.h),
            SizedBox(height: 700.h, child: AppointmentsCalendar()),
            SizedBox(height: 15.h),
            BorderdContainerWidget(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Today's Schedule", style: CustomFonts.black17w600),
                  SizedBox(height: 17.h),
                  Center(
                    child: Text(
                      "No appointments scheduled for today",
                      style: CustomFonts.black17w500,
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
            SizedBox(height: 15.h),
            BorderdContainerWidget(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: CupertinoSearchTextField(
                      style: CustomFonts.black17w500,
                      backgroundColor: Color(0xFFF3F3F5),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: CustomDropdown(
                      hint: "All Regions",
                      value: "All Regions",
                      items: [
                        "All Regions",
                        "Region 1",
                        "Region 2",
                        "Region 3",
                      ],
                      onChanged: (_) {},
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.h),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: CustomColors.blackColor,
                ),
                padding: EdgeInsets.all(9.w),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.add,
                      color: CustomColors.whiteColor,
                      size: 16.sp,
                    ),
                    SizedBox(width: 5.w),
                    Text("New Appointment", style: CustomFonts.white13w400),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15.h),

            ...List.generate(5, (index) => AppointmentTileWidget()),
          ],
        ),
      ),
    );
  }
}
