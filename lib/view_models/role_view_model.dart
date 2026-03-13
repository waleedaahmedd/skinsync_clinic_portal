import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skinsync_clinic_portal/models/requests/create_role_request_model.dart';
import 'package:skinsync_clinic_portal/models/responses/get_feature_response.dart';
import 'package:skinsync_clinic_portal/services/locator.dart';
import 'package:skinsync_clinic_portal/services/role_service.dart';
import 'package:skinsync_clinic_portal/view_models/base_view_model.dart';

final roleProvider = NotifierProvider.autoDispose(() => RoleViewModel._());

class RoleViewModel extends BaseViewModel<RoleState> {
  RoleViewModel._() : super(const RoleState());

  Feature? getSelectedFeature(int featureId) {
    try {
      return state.selectedFeatures.firstWhere((e) => e.featureId == featureId);
    } catch (_) {
      return null;
    }
  }

  Future<void> getFeature() async {
    return await runSafely(() async {
      state = state.copyWith(loading: true);
      final feature = await locator<RoleService>().fetchFeature();
      state = state.copyWith(loading: false, features: feature.data);
    }, showLoading: false);
  }

  Future<bool?> createRole(String roleName) async {
    final request = CreateRoleRequest(
      roleName: roleName,
      features: state.selectedFeatures.map((feature) {
        return RoleFeatureRequest(
          featureId: feature.featureId!,
          permissionIds: feature.permissions!
              .map((p) => int.parse(p.permissionId!))
              .toList(),
        );
      }).toList(),
    );

    await runSafely(() async {
      state = state.copyWith(loading: true);

      await locator<RoleService>().registerRole(request: request);

      state = state.copyWith(loading: false, success: true);
    });
    return true;
  }

  /// Toggle action selection
  void toggleAction({
    required Feature feature,
    required Permissions permissions,
    required bool selected,
  }) {
    final updated = [...state.selectedFeatures];

    Feature? featureItem;
    try {
      featureItem = updated.firstWhere((e) => e.featureId == feature.featureId);
    } catch (_) {
      featureItem = null;
    }

    if (selected) {
      /// ADD action
      if (featureItem == null) {
        updated.add(
          Feature(
            featureId: feature.featureId,
            featureName: feature.featureName,
            permissions: [permissions],
          ),
        );
      } else {
        featureItem.permissions ??= [];
        if (!featureItem.permissions!.any(
          (a) => a.permissionId == permissions.permissionId,
        )) {
          featureItem.permissions!.add(permissions);
        }
      }
    } else {
      /// REMOVE action
      if (featureItem != null) {
        featureItem.permissions!.removeWhere(
          (a) => a.permissionId == permissions.permissionId,
        );

        if (featureItem.permissions!.isEmpty) {
          updated.remove(featureItem);
        }
      }
    }

    state = state.copyWith(selectedFeatures: updated);
  }

  /// Clear all selections
  void clear() {
    state = state.copyWith(selectedFeatures: []);
  }

  @override
  void onError(String message) {
    state = state.copyWith(loading: false);
    super.onError(message);
  }
}

class RoleState {
  final bool loading;
  final bool createRoleLoading;
  final List<Feature> features;
  final List<Feature> selectedFeatures;
  final bool success;

  const RoleState({
    this.loading = false,
    this.selectedFeatures = const [],
    this.features = const [],
    this.createRoleLoading = false,
    this.success = false,
  });

  RoleState copyWith({
    bool? loading,
    bool? createRoleLoading,
    List<Feature>? features,
    List<Feature>? selectedFeatures,
    bool? success,
  }) {
    return RoleState(
      loading: loading ?? this.loading,
      createRoleLoading: createRoleLoading ?? this.createRoleLoading,
      selectedFeatures: selectedFeatures ?? this.selectedFeatures,
      success: success ?? false,
      features: features ?? this.features,
    );
  }

  RoleState copyWithNull({
    bool? loading,
    bool? createRoleLoading,
    List<Feature>? selectedFeatures,
    List<Feature>? features,
    bool? success,
  }) {
    return RoleState(
      loading: loading ?? this.loading,
      createRoleLoading: createRoleLoading ?? this.createRoleLoading,
      selectedFeatures: selectedFeatures ?? this.selectedFeatures,
      features: features ?? this.features,
      success: success ?? false,
    );
  }
}
