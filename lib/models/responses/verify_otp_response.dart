class VerifyOtpResponseModel {
  final bool isSuccess;
  final String message;
  final String resetToken;

  VerifyOtpResponseModel({
    required this.isSuccess,
    required this.message,
    required this.resetToken,
  });

  factory VerifyOtpResponseModel.fromJson(Map<String, dynamic> json) {
    return VerifyOtpResponseModel(
      isSuccess: json['is_success'] ?? false,
      message: json['message'] ?? '',
      resetToken: json['reset_token'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'is_success': isSuccess,
    'message': message,
    'reset_token': resetToken,
  };
}
