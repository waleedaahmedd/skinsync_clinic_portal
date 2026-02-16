import 'package:skinsync_clinic_portal/models/responses/base_response_model.dart';

import '../../utils/enums.dart';

class RegisterDoctorResponse extends BaseApiResponseModel<Doctor> {
  const RegisterDoctorResponse({
    required super.isSuccess,
    required super.message,
    super.data,
  });

  factory RegisterDoctorResponse.fromJson(Map<String, dynamic> json) =>
      RegisterDoctorResponse(
        isSuccess: json["is_success"],
        message: json["message"],
        data: json["data"] == null ? null : Doctor.fromJson(json["data"]),
      );
}

class Doctor {
  final int? id;
  final int? clinicId;
  final String? email;
  final String? name;
  final DoctorRole? role;
  final String? password;
  final String? status;

  Doctor({
    this.id,
    this.clinicId,
    this.email,
    this.name,
    this.role,
    this.password,
    this.status,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) => Doctor(
    id: json["id"],
    clinicId: json["clinic_id"],
    email: json["email"],
    name: json["name"],
    role: json["role"] != null ? DoctorRole.values.byName(json["role"]) : null,
    password: json["password"],
    status: json["status"],
  );
}
