import 'dart:developer';

import 'package:skinsync_clinic_portal/models/requests/create_role_request_model.dart';
import 'package:skinsync_clinic_portal/models/requests/update_role_request.dart';
import 'package:skinsync_clinic_portal/models/responses/base_response_model.dart';
import 'package:skinsync_clinic_portal/models/responses/get_feature_response.dart';
import 'package:skinsync_clinic_portal/models/responses/get_roles_response.dart';
import 'package:skinsync_clinic_portal/repositories/role_repository.dart';
import 'package:skinsync_clinic_portal/services/api_base_helper.dart';
import 'package:skinsync_clinic_portal/services/locator.dart';
import 'package:skinsync_clinic_portal/utils/enums.dart';

class RoleService extends RoleRepository {
  @override
  Future<GetFeatureResponse> fetchFeature() async {
    final response = await locator<ApiBaseHelper>().get(Endpoint.getFeature);
    final model = GetFeatureResponse.fromJson(response);
    if (!model.isSuccess) {
      throw Exception(model.message);
    }
    return model;
  }
 @override
  Future<GetRoleResponse> fetchRole() async {
    final response = await locator<ApiBaseHelper>().get(Endpoint.roles);
    final model = GetRoleResponse.fromJson(response);
    if (!model.isSuccess) {
      throw Exception(model.message);
    }
    return model;
  }

  @override
  Future<BaseApiResponseModel> registerRole({
    required CreateRoleRequest request,
  }) async {
    final response = await locator<ApiBaseHelper>().post(
      Endpoint.roles,
      body: request.toJson(),
    );
    log('RESPONSE: $response');
    final model = BaseApiResponseModel.fromJson(response, (json) => json);
    if (!model.isSuccess) {
      throw Exception(model.message);
    }
    return model;
  }


  @override
 Future<BaseApiResponseModel> updateRole({
  required UpdateRoleRequest request,
  required String roleId
 }) async {
   final response = await locator<ApiBaseHelper>().put(
      Endpoint.roles,
      
      body: request.toJson(),
       queryParams: {
      "id": roleId,
    },
    );
    log('RESPONSE: $response');
    final model = BaseApiResponseModel.fromJson(response, (json) => json);
    if (!model.isSuccess) {
      throw Exception(model.message);
    }
    return model;
 }
}
