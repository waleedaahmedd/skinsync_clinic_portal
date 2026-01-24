import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/appointment_horizontal_tile_widget.dart';
import '../../widgets/calender_widget.dart';

class AppointmentScreen extends StatelessWidget {
  static const String routeName = '/appointment';
  const AppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
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
          Expanded(child: AppointmentsCalendar()),
        ],
      ),
    );
  }
}
