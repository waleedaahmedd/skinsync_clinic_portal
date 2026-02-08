import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinsync_clinic_portal/utils/responsive.dart';
import '../utils/assets.dart';
import 'treatment_card_widget.dart';

class AppointmentsListWidget extends StatelessWidget {
  const AppointmentsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final appointments = [
      {
        'title': 'Botox Treatment',
        'date': 'October 20, 2023, 10:00 AM',
        'price': '\$240',
        'image': PngAssets.treatmentImage,
      },
      {
        'title': 'Laser Treatment',
        'date': 'October 20, 2023, 10:00 AM',
        'price': '\$240',
        'image': PngAssets.treatmentImage,
      },
      {
        'title': 'Chemical Peels',
        'date': 'October 20, 2023, 10:00 AM',
        'price': '\$240',
        'image': PngAssets.treatmentImage,
      },
    ];
    return AdaptiveLayoutList(
      isScrollVertical: false,
      horizontalHeight: 268.r,
      spaceWidth: 20.w,
      spaceHeight: 20.h,
      children: List.generate(appointments.length, (index) {
        return TreatmentCardWidget(
          title: appointments[index]['title']!,
          date: appointments[index]['date']!,
          price: appointments[index]['price']!, // Added price pass-through
          image: appointments[index]['image']!,
        );
      }),
    );
  }
}
