import 'package:skinsync_clinic_portal/models/responses/base_response_model.dart';

import 'register_doctor_response.dart';

class GetDoctorsResponse extends BaseApiResponseModel<List<Doctor>> {
  const GetDoctorsResponse({
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
            : List<Doctor>.from(json["data"]!.map((x) => Doctor.fromJson(x))),
      );
}
