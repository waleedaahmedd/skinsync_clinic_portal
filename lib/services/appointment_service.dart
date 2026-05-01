import 'package:skinsync_clinic_portal/models/responses/appointment_response.dart';
import 'package:skinsync_clinic_portal/repositories/appointment_repository.dart';
import 'package:skinsync_clinic_portal/services/api_base_helper.dart';
import 'package:skinsync_clinic_portal/utils/enums.dart';

import 'locator.dart';

class AppointmentService extends AppointmentRepository {
  @override
  Future<AppointmentResponse> appointmentList({
    required int page,
    String? customerId,
    AppointmentStatus? status,
    AppointmentFilter? filter,
    String? search,
    String? doctorId,
  }) async {
    final aStatus = status == AppointmentStatus.allStatus ? null : status?.name;
    final response = await locator<ApiBaseHelper>().get(
      Endpoint.getAppointment,
      queryParams: {
        'page': page.toString(),
        "limit": "10",
        "customer_id": ?customerId,
        "doctor_id": ?doctorId,
        'type': ?filter?.name,
        'status': ?aStatus,
        'search': ?search,
      },
    );
    final model = AppointmentResponse.fromJson(response);
    if (!model.isSuccess) {
      throw Exception(model.message);
    }
    return model;
  }
}
