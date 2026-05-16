import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skinsync_clinic_portal/view_models/auth_view_model.dart';
import 'package:skinsync_clinic_portal/widgets/dailog%20box/appointment_ready_dailog.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:timetable/timetable.dart';

import '../utils/theme.dart';

enum CalendarViewMode { month, week, day }

class Appointment extends Event {
  final String clinic;
  final String service;
  final String time;
  final bool highlighted;

  Appointment({
    required this.clinic,
    required this.service,
    required this.time,
    required super.start,
    required super.end,
    this.highlighted = false,
  });

  Appointment toUtc() {
    return Appointment(
      clinic: clinic,
      service: service,
      time: time,
      start: start.copyWith(isUtc: true),
      end: end.copyWith(isUtc: true),
    );
  }
}

class AppointmentsCalendar extends StatefulWidget {
  const AppointmentsCalendar({super.key});

  @override
  State<AppointmentsCalendar> createState() => _AppointmentsCalendarState();
}

class _AppointmentsCalendarState extends State<AppointmentsCalendar>
    with TickerProviderStateMixin {
  DateTime _focusedDay = DateTime(2025, 10, 1);
  CalendarViewMode _viewMode = CalendarViewMode.month;
  late final _dateController = DateController(
    initialDate: _focusedDay.atStartOfDay.copyWith(isUtc: true),
    visibleRange: VisibleDateRange.week(),
  );

  final Map<DateTime, List<Appointment>> _appointments = {
    DateTime(2025, 10, 3): [
      Appointment(
        clinic: 'Glow Skin Clinic',
        service: 'Dermal Fillers – Cheeks',
        time: '11:00 AM - 12:00 PM',
        start: DateTime(2025, 10, 3, 11),
        end: DateTime(2025, 10, 3, 15),
        highlighted: true,
      ),
    ],
    DateTime(2025, 10, 8): [
      Appointment(
        clinic: 'Glow Skin Clinic',
        service: 'Dermal Fillers – Cheeks',
        time: '11:00 AM - 12:00 PM',
        start: DateTime(2025, 10, 8, 11),
        end: DateTime(2025, 10, 8, 15),
      ),
    ],
    DateTime(2025, 10, 9): [
      Appointment(
        clinic: 'Glow Skin Clinic',
        service: 'Dermal Fillers – Cheeks',
        time: '11:00 AM - 12:00 PM',
        start: DateTime(2025, 10, 9, 11),
        end: DateTime(2025, 10, 9, 15),
      ),
    ],
    DateTime(2025, 10, 13): [
      Appointment(
        clinic: 'Glow Skin Clinic',
        service: 'Dermal Fillers – Cheeks',
        time: '11:00 AM - 12:00 PM',
        start: DateTime(2025, 10, 13, 11),
        end: DateTime(2025, 10, 13, 15),
      ),
    ],
    DateTime(2025, 10, 14): [
      Appointment(
        clinic: 'Glow Skin Clinic',
        service: 'Dermal Fillers – Cheeks',
        time: '11:00 AM - 12:00 PM',
        start: DateTime(2025, 10, 14, 11),
        end: DateTime(2025, 10, 14, 15),
      ),
    ],
    DateTime(2025, 10, 23): [
      Appointment(
        clinic: 'Glow Skin Clinic',
        service: 'Dermal Fillers – Cheeks',
        time: '11:00 AM - 12:00 PM',
        start: DateTime(2025, 10, 23, 11),
        end: DateTime(2025, 10, 23, 15),
      ),
    ],
  };

  List<Appointment> _getEvents(DateTime day) {
    final key = DateTime(day.year, day.month, day.day);
    return _appointments[key] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeader(),
        const SizedBox(height: 16),
        if (_viewMode == CalendarViewMode.month) ...[
          _weekHeader(),
          const SizedBox(height: 8),
          Expanded(child: _calendar()),
        ] else
          Expanded(child: _timetable()),
      ],
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        SizedBox(height: 19.h),
        Container(
          margin: EdgeInsets.only(right: 24.w),
          decoration: BoxDecoration(
            border: Border.all(color: AppTheme.primaryColor, width: 0.5),
            color: AppTheme.primaryColor.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(horizontal: 19, vertical: 9),
          child: Text(
            _monthLabel(_focusedDay),
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () {
            setState(() {
              if (_viewMode == CalendarViewMode.day) {
                _focusedDay = _focusedDay.subtract(Duration(days: 1));
                _dateController.animateTo(
                  _focusedDay.copyWith(isUtc: true),
                  vsync: this,
                );
              } else if (_viewMode == CalendarViewMode.week) {
                _focusedDay = _focusedDay.subtract(Duration(days: 7));
                _dateController.animateTo(
                  _focusedDay.copyWith(isUtc: true),
                  vsync: this,
                );
              } else {
                _focusedDay = DateTime(
                  _focusedDay.year,
                  _focusedDay.month - 1,
                  1,
                );
              }
              setState(() {});
            });
          },
        ),
        IconButton(
          icon: const Icon(Icons.chevron_right),
          onPressed: () {
            setState(() {
              if (_viewMode == CalendarViewMode.day) {
                _focusedDay = _focusedDay.add(Duration(days: 1));
                _dateController.animateTo(
                  _focusedDay.copyWith(isUtc: true),
                  vsync: this,
                );
              } else if (_viewMode == CalendarViewMode.week) {
                _focusedDay = _focusedDay.add(Duration(days: 7));
                _dateController.animateTo(
                  _focusedDay.copyWith(isUtc: true),
                  vsync: this,
                );
              } else {
                _focusedDay = DateTime(
                  _focusedDay.year,
                  _focusedDay.month + 1,
                  1,
                );
              }
              setState(() {});
            });
          },
        ),
        const Spacer(),
        SegmentedButton<CalendarViewMode>(
          segments: const [
            ButtonSegment(
              value: CalendarViewMode.month,
              label: Text('Month', style: TextStyle(fontSize: 12)),
            ),
            ButtonSegment(
              value: CalendarViewMode.week,
              label: Text('Week', style: TextStyle(fontSize: 12)),
            ),
            ButtonSegment(
              value: CalendarViewMode.day,
              label: Text('Day', style: TextStyle(fontSize: 12)),
            ),
          ],
          selected: {_viewMode},
          onSelectionChanged: (Set<CalendarViewMode> newSelection) {
            setState(() {
              _viewMode = newSelection.first;
            });
            if (_viewMode == CalendarViewMode.day) {
              _dateController.visibleRange = VisibleDateRange.days(1);
            } else {
              _dateController.visibleRange = VisibleDateRange.week();
            }
          },
          style: ButtonStyle(
            visualDensity: VisualDensity.compact,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
        ),
      ],
    );
  }

  Widget _weekHeader() {
    const days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    return Row(
      children: days
          .map(
            (d) => Expanded(
              child: Center(
                child: Text(
                  d,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  Widget _calendar() {
    return TableCalendar(
      shouldFillViewport: true,
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: _focusedDay,
      headerVisible: false,
      daysOfWeekVisible: false,
      eventLoader: _getEvents,
      calendarStyle: const CalendarStyle(
        cellMargin: EdgeInsets.symmetric(horizontal: 4),
        markerSize: 0.0,
        cellPadding: EdgeInsets.zero,
        outsideDaysVisible: true,
      ),
      calendarBuilders: CalendarBuilders(
        defaultBuilder: (context, day, focusedDay) {
          return _dayCell(day, _getEvents(day));
        },
        todayBuilder: (context, day, focusedDay) {
          return _dayCell(day, _getEvents(day), isToday: true);
        },
        outsideBuilder: (context, day, focusedDay) {
          return _dayCell(day, const [], isOutside: true);
        },
      ),
      onPageChanged: (day) {
        setState(() {
          _focusedDay = day;
        });
      },
    );
  }

  Widget _timetable() {
    return TimetableConfig<Appointment>(
      dateController: _dateController,
      eventBuilder: (context, event) => _appointmentCard(event),
      eventProvider: eventProviderFromFixedList(
        _appointments.entries
            .expand((e) => e.value)
            .map((appointment) => appointment.toUtc())
            .toList(),
      ),
      child: MultiDateTimetable<Appointment>(),
    );
  }

  Widget _dayCell(
    DateTime day,
    List<Appointment> events, {
    bool isToday = false,
    bool isOutside = false,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: isToday ? const Color(0xFFE8FBF4) : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${day.day}',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: isOutside ? Colors.grey : Colors.black,
            ),
          ),
          SizedBox(height: 6.h),
          ...events.map(_appointmentCard),
        ],
      ),
    );
  }

  Widget _appointmentCard(Appointment a) {
    return Consumer(
      builder: (context, ref, _) {
        return GestureDetector(
          onTap: () {
            ref
                .read(authViewModelProvider.notifier)
                .navigateDailogIndexToNext(0);
            showDialog(
              context: context,
              builder: (_) => AppointmentReadyDailog(),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: a.highlighted
                  ? const Color(0xFFA7F3D0)
                  : const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  a.clinic,
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  a.service,
                  style: TextStyle(fontSize: 9.sp, color: Colors.black54),
                ),
                Text(
                  a.time,
                  style: TextStyle(fontSize: 9.sp, color: Colors.black45),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String _monthLabel(DateTime date) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${months[date.month - 1]} ${date.year}';
  }
}
