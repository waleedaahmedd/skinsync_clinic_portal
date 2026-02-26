import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinsync_clinic_portal/utils/responsive.dart';
import 'analytics_card_widget.dart';

class AnalyticsGridWidget extends StatelessWidget {
  const AnalyticsGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AdaptiveLayoutRowColumn(
          expandedWidget: true,
          children: [
            AnalyticsCardWidget(
              icon: Icons.calendar_today_outlined,
              iconColor: Color(0xFF7DD3D3),
              bgColor: Color(0xFFE8F6F6),
              value: "101",
              label: "Completed Appointments",
            ),
            AnalyticsCardWidget(
              icon: Icons.schedule_outlined,
              iconColor: Color(0xFFE89FD5),
              bgColor: Color(0xFFFCEFF9),
              value: "101",
              label: "Pending Appointments",
            ),
            AnalyticsCardWidget(
              icon: Icons.cancel_outlined,
              iconColor: Color(0xFFFF9B9B),
              bgColor: Color(0xFFFFEDED),
              value: "101",
              label: "Cancelled Appointments",
            ),
          ],
        ),
        SizedBox(height: 20.h),
        AdaptiveLayoutRowColumn(
          expandedWidget: true,
          children: [
            AnalyticsCardWidget(
              icon: Icons.medical_services_outlined,
              iconColor: Color(0xFF7DD3D3),
              bgColor: Color(0xFFE8F6F6),
              value: "1000",
              label: "Total Treatments",
            ),
            AnalyticsCardWidget(
              icon: Icons.star_outline,
              iconColor: Color(0xFFFFB366),
              bgColor: Color(0xFFFFF3E8),
              value: "4.5",
              label: "Ratings",
            ),
          ],
        ),
      ],
    );
  }
}
