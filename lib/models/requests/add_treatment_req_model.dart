import 'package:skinsync_clinic_portal/models/treatment_model.dart';

class AddTreatmentReqModel {
  final int treatmentId;
  final List<SideAreaModel> sideareas;

  AddTreatmentReqModel({required this.treatmentId, required this.sideareas});

  Map<String, dynamic> toJson() {
    return {
      'id': treatmentId,
      'sideareas': sideareas.map((area) => area.toJson()).toList(),
    };
  }
}
