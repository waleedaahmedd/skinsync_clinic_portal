import 'dart:async';
import 'package:skinsync_clinic_portal/models/Treatment_model.dart';
import 'package:skinsync_clinic_portal/models/responses/base_response_model.dart';
import '../repositories/treatment_repository.dart';
import '../utils/enums.dart';
import '../utils/exception.dart';
import 'api_base_helper.dart';

class TreatmentServices implements TreatmentRepository {
  final ApiBaseHelper _api;

  TreatmentServices({required ApiBaseHelper api}) : _api = api;

  @override
  Future<List<TreatmentModel>> getTreatments({required int clinicId}) async {
    final jsonResponse = await _api.get(
      Endpoint.getTreatments,

      pathParams: {'clinicId': clinicId.toString()},
    );
    final response = BaseApiResponseModel<List<TreatmentModel>>.fromJson(
      jsonResponse,
      (treatmentList) {
        treatmentList as List;
        return treatmentList
            .map(
              (json) => TreatmentModel.fromJson(json as Map<String, dynamic>),
            )
            .toList();
      },
    );

    if (!response.isSuccess) {
      throw BadRequestException(response.message);
    }
    return response.data ?? [];
  }
}
