import 'package:skinsync_clinic_portal/models/treatment_model.dart';

class AddTreatmentReqModel {
  final int treatmentId;
  final List<SideAreaModel> sideareas;

  AddTreatmentReqModel({required this.treatmentId, required this.sideareas});

  Map<String, dynamic> toJson() {
    return {
      'treatment_id': treatmentId,
      'side_area': sideareas
          .map(
            (area) => {'side_area_id': area.id, 'price': area.perSyringePrice},
          )
          .toList(),
    };
  }
}
