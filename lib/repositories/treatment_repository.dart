import 'package:skinsync_clinic_portal/models/requests/add_treatment_req_model.dart';

import '../models/treatment_model.dart';

abstract class TreatmentRepository {
  Future<List<TreatmentModel>> getClinicTreatments({required int clinicId});
  Future<List<TreatmentModel>> getAdminTreatments();
  Future<List<SideAreaModel>> getTreatmentsSideArea(int treatmentId);
  Future<TreatmentModel> addTreatment(AddTreatmentReqModel req);
}
