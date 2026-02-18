import 'package:skinsync_clinic_portal/models/requests/register_doctor_request.dart';

import '../models/responses/register_doctor_response.dart';

abstract class DoctorRepository {
  Future<void> register({required RegisterDoctorRequest request});

  Future<List<Doctor>> fetchDoctors();
}
