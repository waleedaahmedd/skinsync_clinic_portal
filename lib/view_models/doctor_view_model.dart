import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skinsync_clinic_portal/models/Treatment_model.dart';
import 'package:skinsync_clinic_portal/models/requests/register_doctor_request.dart';
import 'package:skinsync_clinic_portal/services/locator.dart';

import '../models/requests/treatment_request.dart';
import '../models/responses/register_doctor_response.dart';
import '../services/doctor_service.dart';
import '../utils/enums.dart';
import 'auth_view_model.dart';
import 'base_view_model.dart';

final doctorProvider = NotifierProvider.autoDispose(() => DoctorViewModel._());

class DoctorViewModel extends BaseViewModel<DoctorState> {
  DoctorViewModel._() : super(const DoctorState());

  void changeRole(DoctorRole? role) {
    if (state.role == role) {
      return;
    }
    state = state.copyWith(role: role);
  }

  void toggleSelectedTreatment(TreatmentModel treatment) {
    final contains = state.treatments.any((t) => t.treatmentId == treatment.id);
    if (contains) {
      final newList = List.of(state.treatments);
      newList.removeWhere((t) => t.treatmentId == treatment.id);
      state = state.copyWith(treatments: newList);
    } else {
      if (treatment.id == null) {
        return;
      }
      state = state.copyWith(
        treatments: [
          TreatmentRequest(treatmentId: treatment.id!),
          ...state.treatments,
        ],
      );
    }
  }

  Future<void> registerDoctor({
    required String name,
    required String specialization,
    required String email,
    required String phone,
  }) async {
    return await runSafely(() async {
      if (state.role == null) {
        throw Exception('Role not selected!');
      }
      if (state.treatments.isEmpty) {
        throw Exception('Add treatments first!');
      }
      state = state.copyWith(loading: true);
      await locator<DoctorService>().register(
        request: RegisterDoctorRequest(
          role: state.role!,
          name: name,
          image: null,
          specialization: specialization,
          contactInfo: ContactInfo(email: email, phone: phone),
          treatments: state.treatments,
        ),
      );
      state = state.copyWith(loading: false, success: true);
    });
  }

  Future<void> getDoctors() async {
    return await runSafely(() async {
      final authState = ref.read(authViewModelProvider);
      final clinicId = authState.user?.clinicId;
      state = state.copyWith(loading: true);
      final doctors = await locator<DoctorService>().fetchDoctors();
      state = state.copyWith(
        loading: false,
        doctors: doctors
            .where((doctor) => doctor.clinicId == clinicId)
            .toList(),
      );
    }, showLoading: false);
  }

  @override
  void onError(String message) {
    state = state.copyWith(loading: false);
    super.onError(message);
  }
}

class DoctorState {
  final bool loading;
  final DoctorRole? role;
  final List<TreatmentRequest> treatments;
  final List<Doctor> doctors;
  final bool success;

  const DoctorState({
    this.role,
    this.loading = false,
    this.treatments = const [],
    this.doctors = const [],
    this.success = false,
  });

  DoctorState copyWith({
    bool? loading,
    DoctorRole? role,
    List<TreatmentRequest>? treatments,
    List<Doctor>? doctors,
    bool? success,
  }) {
    return DoctorState(
      loading: loading ?? this.loading,
      role: role ?? this.role,
      treatments: treatments ?? this.treatments,
      doctors: doctors ?? this.doctors,
      success: success ?? false,
    );
  }
}
