import 'package:skinsync_clinic_portal/models/requests/login_request_model.dart';
import 'package:skinsync_clinic_portal/models/responses/login_response_model.dart';

import '../models/requests/change_password_request.dart';
import '../models/requests/forget_password_request.dart';
import '../models/requests/reset_password_request.dart';
import '../models/requests/verify_otp_request.dart';
import '../models/responses/base_response_model.dart';
import '../models/responses/verify_otp_response.dart';

abstract class AuthRepository {
  Future<LoginResponseModel> login({required LoginRequestModel req});

  Future<BaseApiResponseModel> changePassword({
    required ChangePasswordRequestModel req,
  });

  Future<BaseApiResponseModel> forgetPassword({
    required ForgetPasswordRequest req,
  });

  Future<VerifyOtpResponseModel> verifyOtp({required VerifyOtpRequest req});

  Future<BaseApiResponseModel> resetPassword({
    required ResetPasswordRequest req,
  });
   Future<LoginResponseModel> getMe();
}
