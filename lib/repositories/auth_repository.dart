import 'package:skinsync_clinic_portal/models/requests/login_request_model.dart';
import 'package:skinsync_clinic_portal/models/responses/login_response_model.dart';

abstract class AuthRepository {
  Future<LoginResponseModel> login({required LoginRequestModel req});
}
