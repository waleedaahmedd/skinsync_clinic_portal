import 'package:skinsync_clinic_portal/models/requests/register_doctor_request.dart';

abstract class DoctorRepository {
  Future<void> register({required RegisterDoctorRequest request});
}
