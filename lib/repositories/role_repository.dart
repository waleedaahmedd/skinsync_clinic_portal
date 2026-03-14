import 'package:skinsync_clinic_portal/models/requests/create_role_request_model.dart';
import 'package:skinsync_clinic_portal/models/responses/base_response_model.dart';
import 'package:skinsync_clinic_portal/models/responses/get_feature_response.dart';
import 'package:skinsync_clinic_portal/models/responses/get_roles_response.dart';

abstract class RoleRepository {
  Future<GetFeatureResponse> fetchFeature();
  Future<BaseApiResponseModel> registerRole({
    required CreateRoleRequest request,
  });
  Future<GetRoleResponse> fetchRole();
}
