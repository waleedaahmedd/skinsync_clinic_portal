import 'base_response_model.dart';
import 'register_doctor_response.dart';

class GetDoctorsResponse extends BaseApiResponseModel<List<ClinicData>> {
  GetDoctorsResponse({
    required super.isSuccess,
    required super.message,
    super.data,
  });

  factory GetDoctorsResponse.fromJson(Map<String, dynamic> json) =>
      GetDoctorsResponse(
        isSuccess: json["is_success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<ClinicData>.from(
                json["data"]!.map((x) => ClinicData.fromJson(x)),
              ),
      );
}

class ClinicData {
  final int? clinicId;
  final String? clinicName;
  final String? clinicPhone;
  final String? clinicAddress;
  final String? clinicLogo;
  final List<Doctor>? doctors;

  const ClinicData({
    this.clinicId,
    this.clinicName,
    this.clinicPhone,
    this.clinicAddress,
    this.clinicLogo,
    this.doctors,
  });

  factory ClinicData.fromJson(Map<String, dynamic> json) => ClinicData(
    clinicId: json["clinic_id"],
    clinicName: json["clinic_name"],
    clinicPhone: json["clinic_phone"],
    clinicAddress: json["clinic_address"],
    clinicLogo: json["clinic_logo"],
    doctors: json["doctors"] == null
        ? []
        : List<Doctor>.from(json["doctors"]!.map((x) => Doctor.fromJson(x))),
  );
}
