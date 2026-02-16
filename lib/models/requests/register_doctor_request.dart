import 'package:skinsync_clinic_portal/models/requests/base_request.dart';

import '../../utils/enums.dart';
import 'treatment_request.dart';

class RegisterDoctorRequest extends BaseRequest {
  final DoctorRole role;
  final String name;
  final String? image;
  final String specialization;
  final ContactInfo contactInfo;
  final List<TreatmentRequest> treatments;

  RegisterDoctorRequest({
    required this.role,
    required this.name,
    required this.image,
    required this.specialization,
    required this.contactInfo,
    required this.treatments,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'role': role.name,
      'name': name,
      'image': image,
      'specialization': specialization,
      'contact_info': contactInfo.toJson(),
      'treatments': treatments.map((t) => t.toJson()).toList(),
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
