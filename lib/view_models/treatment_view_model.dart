import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skinsync_clinic_portal/models/Treatment_model.dart';
import 'package:skinsync_clinic_portal/repositories/treatment_repository.dart';

import '../services/locator.dart';
import '../utils/exception.dart';
import 'auth_view_model.dart';
import 'base_view_model.dart';

final treatmentViewModelProvider = NotifierProvider(
  () => TreamententViewModel._(),
);

class TreamententViewModel extends BaseViewModel<TreatmentState> {
  TreamententViewModel._() : super(TreatmentState());

  final TreatmentRepository _treatmentRepository =
      locator<TreatmentRepository>();

  @override
  void init() {
    super.init();
    getTreatments();
  }

  Future<bool> getTreatments() async {
    return await runSafely<bool?>(showLoading: false, () async {
          state = state.copyWith(loading: true);
          final authState = ref.read(authViewModelProvider);
          final clinicId = authState.user?.clinicId;
          if (clinicId == null) {
            throw BadRequestException("Clinic ID not found");
          }
          final response = await _treatmentRepository.getTreatments(
            clinicId: kDebugMode ? 9 : clinicId,
          );

          state = state.copyWith(treatments: response, loading: false);

          return true;
        }) ??
        false;
  }
}

class TreatmentState {
  final List<TreatmentModel> treatments;
  final bool loading;

  TreatmentState({this.treatments = const [], this.loading = false});

  TreatmentState copyWith({bool? loading, List<TreatmentModel>? treatments}) {
    return TreatmentState(
      loading: loading ?? this.loading,
      treatments: treatments ?? this.treatments,
    );
  }
}
