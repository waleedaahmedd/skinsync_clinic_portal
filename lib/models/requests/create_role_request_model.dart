class CreateRoleRequest {
  final String roleName;
  final List<RoleFeatureRequest> features;

  CreateRoleRequest({required this.roleName, required this.features});

  Map<String, dynamic> toJson() => {
    "role_name": roleName,
    "features": features.map((e) => e.toJson()).toList(),
  };
}

class RoleFeatureRequest {
  final int featureId;
  final List<int> permissionIds;

  RoleFeatureRequest({required this.featureId, required this.permissionIds});

  Map<String, dynamic> toJson() => {
    "feature_id": featureId,
    "permission_ids": permissionIds,
  };
}
