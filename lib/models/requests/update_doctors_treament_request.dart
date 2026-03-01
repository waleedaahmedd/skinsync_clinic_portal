import 'package:skinsync_clinic_portal/models/requests/base_request.dart';

class UpdateDoctorRequest extends BaseRequest {
  final int clinicUserId;
  final List<UpdateTreatmentRequest> treatments;

  UpdateDoctorRequest({required this.clinicUserId, required this.treatments});

  @override
  Map<String, dynamic> toJson() {
    return {
      "clinic_user_id": clinicUserId,
      "treatments": treatments.map((e) => e.toJson()).toList(),
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
