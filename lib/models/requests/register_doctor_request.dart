import 'package:flutter/material.dart';

import '../../utils/enums.dart';
import '../treatment_model.dart';
import 'base_request.dart';

class RegisterDoctorRequest extends BaseRequest {
  final DoctorRole role;
  final String name;
  final String? image;
  final String specialization;
  final ContactInfo contactInfo;
  final List<TreatmentModel> treatments;
  final List<Availability> availability;

  RegisterDoctorRequest({
    required this.role,
    required this.name,
    required this.image,
    required this.specialization,
    required this.contactInfo,
    required this.treatments,
    required this.availability,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'role': role.name,
      'name': name,
      'image': image,
      'specialization': specialization,
      'contact_info': contactInfo.toJson(),
      'treatments': treatments.map((t) => t.toRequest()).toList(),
      'availability': availability.map((a) => a.toJson()).toList(),
    };
  }
}

class ContactInfo {
  final String email;
  final String phone;

  const ContactInfo({required this.email, required this.phone});

  Map<String, dynamic> toJson() {
    return {'email': email, 'phone': phone};
  }
}

class Availability {
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final List<String> days;

  const Availability({
    required this.startTime,
    required this.endTime,
    required this.days,
  });

  Map<String, dynamic> toJson() {
    return {
      'start_time': '${startTime.hour}:${startTime.minute}',
      'end_time': '${endTime.hour}:${endTime.minute}',
      'days': days,
    };
  }

  factory Availability.fromJson(Map<String, dynamic> json) {
    return Availability(
      startTime: _getTimeOfDayFromString(json['start_time']),
      endTime: _getTimeOfDayFromString(json['end_time']),
      days: List<String>.from(json['days']),
    );
  }

  static TimeOfDay _getTimeOfDayFromString(String time) {
    final splitted = time.split(':');
    return TimeOfDay(
      hour: int.parse(splitted[0]),
      minute: int.parse(splitted[1]),
    );
  }
}
