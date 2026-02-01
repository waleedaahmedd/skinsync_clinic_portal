import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';

import '../widgets/header__with_back_btn.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<NotificationModel> notifications = [
    NotificationModel(
      icon: Icons.calendar_today_outlined,
      iconBgColor: const Color(0xFFE8F4FD),
      iconColor: const Color(0xFF2196F3),
      title: 'New Appointment Alert',
      description:
          'You have a new appointment booked for 3:00 PM with Sarah Johnson.',
      dateTime: '10/29/2025, 1:00:00 PM',
      isNew: true,
    ),
    NotificationModel(
      icon: Icons.attach_money,
      iconBgColor: const Color(0xFFE8F5E9),
      iconColor: const Color(0xFF4CAF50),
      title: 'Payment Received',
      description:
          'A payment of \$450 has been successfully processed for treatments.',
      dateTime: '10/28/2025, 7:25:00 PM',
      isNew: true,
    ),
    NotificationModel(
      icon: Icons.description_outlined,
      iconBgColor: const Color(0xFFFCE4EC),
      iconColor: const Color(0xFFE91E63),
      title: 'AI Report Ready',
      description:
          'AI analysis for patient Emily Clark\'s facial scan is now available.',
      dateTime: '10/27/2025, 4:30:00 PM',
      isNew: false,
    ),
    NotificationModel(
      icon: Icons.notifications_outlined,
      iconBgColor: const Color(0xFFFFF3E0),
      iconColor: const Color(0xFFFF9800),
      title: 'Follow-Up Reminder',
      description:
          'It\'s time to schedule a 2-week follow-up for patient John Smith.',
      dateTime: '10/26/2025, 2:00:00 PM',
      isNew: false,
    ),
    NotificationModel(
      icon: Icons.access_time,
      iconBgColor: const Color(0xFFFFFDE7),
      iconColor: const Color(0xFFFFEB3B),
      title: 'Low Availability Notice',
      description:
          'Only two slots remaining for tomorrow, consider enabling dynamic pricing to fill gaps.',
      dateTime: '10/25/2025, 10:00:00 PM',
      isNew: false,
    ),
  ];

  void _markAllAsRead() {
    setState(() {
      for (var notification in notifications) {
        notification.isNew = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBDBDBD),

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 250.w, vertical: 20.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with back button
              BuildHeader(title: 'Notifications'),
              SizedBox(height: 16.h),

              // Divider
              Divider(height: 1.h, thickness: 1, color: Colors.grey.shade200),

              SizedBox(height: 16.h),

              // Mark all read button
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: _markAllAsRead,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12.w,
                        vertical: 8.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                      ),

                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle_outline,
                            size: 20.sp,
                            color: Colors.black87,
                          ),
                          SizedBox(width: 6.w),
                          Text('Mark all read', style: CustomFonts.black18w600),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16.h),

              // Notifications Container
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(16.r),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(color: Colors.grey.shade200, width: 1),
                  ),
                  child: ListView.separated(
                    itemCount: notifications.length,
                    separatorBuilder: (context, index) => Divider(
                      height: 24.h,
                      thickness: 1,
                      color: Colors.grey.shade100,
                    ),
                    itemBuilder: (context, index) {
                      return _buildNotificationItem(notifications[index]);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationItem(NotificationModel notification) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: Colors.grey.shade200, width: 1),
      ),
      child: Row(
        children: [
          // Icon
          Container(
            padding: EdgeInsets.all(10.r),
            decoration: BoxDecoration(
              color: notification.iconBgColor,
              shape: BoxShape.circle,
            ),
            child: Icon(
              notification.icon,
              color: notification.iconColor,
              size: 20.sp,
            ),
          ),

          SizedBox(width: 12.w),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(notification.title, style: CustomFonts.black16w600),
                SizedBox(height: 4.h),
                Text(notification.description, style: CustomFonts.grey16w400),
                SizedBox(height: 4.h),
                Text(notification.dateTime, style: CustomFonts.grey16w400),
              ],
            ),
          ),

          SizedBox(width: 12.w),

          // New Badge
          if (notification.isNew)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Text(
                'New',
                style: TextStyle(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class NotificationModel {
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;
  final String title;
  final String description;
  final String dateTime;
  bool isNew;

  NotificationModel({
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
    required this.title,
    required this.description,
    required this.dateTime,
    required this.isNew,
  });
}
