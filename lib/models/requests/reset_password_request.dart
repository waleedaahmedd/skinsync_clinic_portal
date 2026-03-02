class ResetPasswordRequest {
  final String email;
  final String? resetToken;
  final String newPassword;

  ResetPasswordRequest({
    required this.email,
    required this.resetToken,
    required this.newPassword,
  });

  Map<String, dynamic> toJson() => {
    'email': email,
    'reset_token': resetToken,
    'new_password': newPassword,
  };
}
