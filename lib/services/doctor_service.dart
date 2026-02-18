import 'package:skinsync_clinic_portal/models/requests/register_doctor_request.dart';
import 'package:skinsync_clinic_portal/models/responses/get_doctors_response.dart';
import 'package:skinsync_clinic_portal/repositories/doctor_repository.dart';
import 'package:skinsync_clinic_portal/services/api_base_helper.dart';
import 'package:skinsync_clinic_portal/utils/enums.dart';

import '../models/responses/register_doctor_response.dart';
import 'locator.dart';

class DoctorService extends DoctorRepository {
  @override
  Future<void> register({required RegisterDoctorRequest request}) async {
    final response = await locator<ApiBaseHelper>().post(
      Endpoint.createDoctor,
      body: request.toJson(),
    );
    final model = RegisterDoctorResponse.fromJson(response);
    if (!model.isSuccess) {
      throw Exception(model.message);
    }
  }

  @override
  Future<List<Doctor>> fetchDoctors() async {
    final response = await locator<ApiBaseHelper>().get(Endpoint.getDoctors);
    final model = GetDoctorsResponse.fromJson(response);
    if (!model.isSuccess) {
      throw Exception(model.message);
    }
    return model.data ?? [];
  }
}
