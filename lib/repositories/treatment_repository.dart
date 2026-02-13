import '../models/Treatment_model.dart';

abstract class TreatmentRepository {
  Future<List<TreatmentModel>> getTreatments({required int clinicId});
  // Future<baseres> getTreatments({required int clinicId});
}
