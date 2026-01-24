import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/assets.dart';
import '../utils/theme.dart';

class AppointmentHorizontalTileWidget extends StatelessWidget {
  const AppointmentHorizontalTileWidget({
    super.key,
    required this.index,
    this.selected = false,
  });

  final int index;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 24.w),
      decoration: BoxDecoration(
        border: Border.all(
          color: selected ? AppTheme.primaryColor : AppTheme.borderColor,
          width: 0.5,
        ),
        color: selected ? AppTheme.primaryColor.withOpacity(0.3) : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Center(
        child: index == 0
            ? Text(
                "All Appointments",
                style: Theme.of(context).textTheme.titleMedium,
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipOval(
                    child: Image.asset(
                      DemoAssets.person,
                      height: 32.w,
                      width: 32.w,
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    "Nolan Aminoff",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
      ),
    );
  }
}
