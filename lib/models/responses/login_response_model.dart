import '../user_model.dart';

class LoginResponseModel {
  String? accessToken;
  String? refreshToken;
  int? accessExpiresAt;
  int? refreshExpiresAt;
  UserModel? user;

  LoginResponseModel({
    this.accessToken,
    this.refreshToken,
    this.accessExpiresAt,
    this.refreshExpiresAt,
    this.user,
  });

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    accessExpiresAt = json['access_expires_at'];
    refreshExpiresAt = json['refresh_expires_at'];
    user = json['clinic_user'] != null
        ? UserModel.fromJson(json['clinic_user'])
        : null;
  }
}
