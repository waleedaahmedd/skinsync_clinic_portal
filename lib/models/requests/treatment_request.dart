class TreatmentRequest {
  final int treatmentId;
  final List<int> treatmentsSubSecId;

  const TreatmentRequest({
    required this.treatmentId,
    this.treatmentsSubSecId = const <int>[],
  });

  Map<String, dynamic> toJson() {
    return {
      'treatment_id': treatmentId,
      'treatments_sub_sec_id': treatmentsSubSecId,
    };
  }
}
