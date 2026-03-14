class UpdateRoleRequest {
  final String roleName;
  final List<FeaturePermissionModel> features;

  UpdateRoleRequest({
    required this.roleName,
    required this.features,
  });

  Map<String, dynamic> toJson() {
    return {
      'role_name': roleName,
      'features': features.map((f) => f.toJson()).toList(),
    };
  }
}
class FeaturePermissionModel {
  final int featureId;
  final List<int> permissionIds;

  FeaturePermissionModel({
    required this.featureId,
    required this.permissionIds,
  });

  Map<String, dynamic> toJson() {
    return {
      'feature_id': featureId,
      'permission_ids': permissionIds,
    };
  }
}
