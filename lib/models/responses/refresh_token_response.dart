import 'base_response_model.dart';
import 'login_response_model.dart';

class RefreshTokenResponse extends BaseApiResponseModel<LoginResponseModel> {
  const RefreshTokenResponse({
    super.data,
    required super.isSuccess,
    required super.message,
  });

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) {
    return RefreshTokenResponse(
      data: json['data'] != null
          ? LoginResponseModel.fromJson(json['data'])
          : null,
      isSuccess: json['is_success'],
      message: json['message'],
    );
  }
}
