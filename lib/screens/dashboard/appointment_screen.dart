import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinsync_clinic_portal/utils/color_constant.dart';
import 'package:skinsync_clinic_portal/utils/custom_fonts.dart';
import 'package:skinsync_clinic_portal/view_models/auth_view_model.dart';
import 'package:skinsync_clinic_portal/widgets/appointment_tile_widget.dart';
import 'package:skinsync_clinic_portal/widgets/borderd_container_widget.dart';
import 'package:skinsync_clinic_portal/widgets/dailog%20box/appointment_ready_dailog.dart';

import '../../widgets/appointment_horizontal_tile_widget.dart';
import '../../widgets/calender_widget.dart';
import '../../widgets/custom_dropdown_widget.dart';
import '../../widgets/dailog box/create_invoice_dailog.dart';
import '../../widgets/dailog box/note_dailog.dart';
import '../../widgets/dailog box/scheduled_next_appointment.dart';
import '../../widgets/dailog box/select_time_slot_dailog.dart';
import '../../widgets/dailog box/show_success_dailog.dart';

class AppointmentScreen extends StatefulWidget {
  static const String routeName = '/appointment';

  AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

final List<AppointmentModel> dummyAppointments = [
  AppointmentModel(
    patientName: 'Sarah Johnson',
    treatment: 'Botox',
    date: '10/29/2025',
    time: '10:00 AM',
    doctor: 'Dr. Smith',
    amount: 350,
    status: 'Completed',
    isToday: false,
  ),
  AppointmentModel(
    patientName: 'Emma Davis',
    treatment: 'Filler',
    date: '10/30/2025',
    time: '11:00 AM',
    doctor: 'Dr. Lee',
    amount: 450,
    status: 'Completed',
    isToday: false,
  ),
  AppointmentModel(
    patientName: 'James Brown',
    treatment: 'Laser',
    date: '04/16/2026',
    time: '09:00 AM',
    doctor: 'Dr. Smith',
    amount: 600,
    status: 'Upcoming',
    isToday: true,
  ),
  AppointmentModel(
    patientName: 'Olivia White',
    treatment: 'Hydrafacial',
    date: '04/16/2026',
    time: '02:00 PM',
    doctor: 'Dr. Adams',
    amount: 250,
    status: 'Upcoming',
    isToday: true,
  ),
  AppointmentModel(
    patientName: 'Liam Wilson',
    treatment: 'Microneedling',
    date: '04/17/2026',
    time: '03:00 PM',
    doctor: 'Dr. Lee',
    amount: 300,
    status: 'Upcoming',
    isToday: false,
  ),
  AppointmentModel(
    patientName: 'Sophia Moore',
    treatment: 'Chemical Peel',
    date: '04/15/2026',
    time: '01:00 PM',
    doctor: 'Dr. Adams',
    amount: 200,
    status: 'Cancelled',
    isToday: false,
  ),
];

class _AppointmentScreenState extends State<AppointmentScreen> {
  String _selectedFilter = 'All Appointments';
  String _selectedStatus = 'All Status';

  List<AppointmentModel> get _filteredAppointments {
    switch (_selectedFilter) {
      case 'Today Appointments':
        return dummyAppointments.where((a) => a.isToday).toList();
      case 'Past Appointments':
        return dummyAppointments
            .where((a) => a.status == 'Completed' || a.status == 'Cancelled')
            .toList();
      default:
        return dummyAppointments;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Row(
                children: [
                  Text('Appointments', style: CustomFonts.black22w600),
                  SizedBox(width: 36.w),
                  Expanded(
                    child: SizedBox(
                      height: 45.h,
                      child: ListView.builder(
                        itemCount: 6,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Consumer(
                            builder: (context,ref,_) {
                              return AppointmentHorizontalTileWidget(
                               
                                index: index,
                                selected: index == 0,
                              );
                            }
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 14.h),
              Divider(color: Colors.grey.shade300),
              SizedBox(height: 14.h),
              SizedBox(height: 800.h, child: AppointmentsCalendar()),
              SizedBox(height: 15.h),
              // BorderdContainerWidget(
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text("Today's Schedule", style: CustomFonts.black17w600),
              //       SizedBox(height: 17.h),
              //       Center(
              //         child: Text(
              //           "No appointments scheduled for today",
              //           style: CustomFonts.black17w500,
              //         ),
              //       ),
              //       SizedBox(height: 20.h),
              //     ],
              //   ),
              // ),
              // SizedBox(height: 15.h),
              BorderdContainerWidget(
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: CupertinoSearchTextField(
                        style: CustomFonts.black17w500,
                        backgroundColor: Color(0xFFF3F3F5),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Expanded(
                      flex: 3,
                      child: CustomDropdown(
                        hint: "All Appointments",
                        value: "All Appointments",
                        items: [
                          "All Appointments",
                          "Past Appointments",
                          "Today Appointments",
                        ],
                        height: 42.h,
                        onChanged: (value) => setState(
                          () => _selectedFilter = value ?? 'All Appointments',
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),

                    Expanded(
                      flex: 2,
                      child: CustomDropdown(
                        hint: "Status",
                        value: _selectedStatus,
                        items: [
                          "All Status",
                          "No Show",
                          "Delayed",
                          "Completed",
                          "Arrived",
                          "Ongoing",
                        ],
                        height: 42.h,
                        onChanged: (value) => setState(
                          () => _selectedStatus = value ?? 'All Status',
                        ),
                      ),
                    ),

                    SizedBox(width: 10.w),
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: CustomColors.blackColor,
                        ),
                        padding: EdgeInsets.all(12.w),
                        child: Row(
                          crossAxisAlignment: .center,
                          mainAxisAlignment: .center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.add,
                              color: CustomColors.whiteColor,
                              size: 16.sp,
                            ),
                            SizedBox(width: 5.w),
                            Text(
                              "New Appointment",
                              style: CustomFonts.white13w400,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // SizedBox(height: 15.h),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: Container(
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       color: CustomColors.blackColor,
              //     ),
              //     padding: EdgeInsets.all(9.w),
              //     child: Row(
              //       mainAxisSize: MainAxisSize.min,
              //       children: [
              //         Icon(
              //           Icons.add,
              //           color: CustomColors.whiteColor,
              //           size: 16.sp,
              //         ),
              //         SizedBox(width: 5.w),
              //         Text("New Appointment", style: CustomFonts.white13w400),
              //       ],
              //     ),
              //   ),
              // ),
              SizedBox(height: 15.h),

              // ...List.generate(5, (index) => AppointmentTileWidget()),
              ...List.generate(
                _filteredAppointments.length,
                (index) =>  Consumer(
                  builder: (context,ref,_) {
                    return AppointmentTileWidget(
                          appointment: _filteredAppointments[index],
                          onTap: () {
                             ref.read(authViewModelProvider.notifier).navigateDailogIndexToNext(0);
                            showDialog(
                              context: context,
                              builder: (_) => AppointmentReadyDailog(),
                            );
                             
                            
                        
                            //AddNoteDialog.show(context);
                            print('object');
                          },
                      
                    );
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppointmentModel {
  final String patientName;
  final String treatment;
  final String date;
  final String time;
  final String doctor;
  final double amount;
  final String status; // 'Completed', 'Upcoming', 'Cancelled'
  final bool isToday;

  const AppointmentModel({
    required this.patientName,
    required this.treatment,
    required this.date,
    required this.time,
    required this.doctor,
    required this.amount,
    required this.status,
    required this.isToday,
  });
}
