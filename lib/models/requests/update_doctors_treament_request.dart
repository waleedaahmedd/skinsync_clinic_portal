import 'package:skinsync_clinic_portal/models/requests/base_request.dart';

import 'register_doctor_request.dart';

class UpdateDoctorRequest extends BaseRequest {
  final int clinicUserId;
  final String name;
  final String image;
  final String specialization;
  final String phone;
  final List<UpdateTreatmentRequest> treatments;
  final List<Availability> availability;

  UpdateDoctorRequest({
    required this.clinicUserId,
    required this.treatments,
    required this.name,
    required this.image,
    required this.specialization,
    required this.phone,
    required this.availability,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      "clinic_user_id": clinicUserId,
      'name': name,
      'image': image,
      'specialization': specialization,
      'phone': phone,
      "treatments": treatments.map((e) => e.toJson()).toList(),
      'availability': availability.map((a) => a.toJson()).toList(),
    };
  }
}

class UpdateTreatmentRequest {
  final int treatmentId;
  final List<int> treatmentsSubSecId;

  UpdateTreatmentRequest({
    required this.treatmentId,
    required this.treatmentsSubSecId,
  });

  Map<String, dynamic> toJson() {
    return {
      "treatment_id": treatmentId,
      "treatments_sub_sec_id": treatmentsSubSecId,
    };
  }
}
