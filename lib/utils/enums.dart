enum SharedPreferencesKeys {
  themeModeKey("theme-mode"),
  accessTokenKey("access-token"),
  refreshTokenKey('refresh-token'),
  accessTokenExpiryKey('access-token-expiry'),
  refreshTokenExpiryKey('refresh-token-expiry'),
  userKey('user-key');

  const SharedPreferencesKeys(this.keyText);

  final String keyText;
}

enum DoctorRole { owner, doctor, injector }

enum Role { doctor, injector, user }

enum Endpoint {
  login('clinic/login'),
  refreshToken('clinic/auth/refresh'),
  me('clinic/me'),
  getClinicTreatments('clinic/treatments'),
  createDoctor('clinic/doctors/register'),
  getDoctors('clinic/doctors'),
  getAdminTreatments('treatments/masters'),
  getAdminTreatmentsSideAreas('clinic/side-areas/treatment/{treatmentId}'),
  addClinicTreatment('clinic/side-areas/bulk'),
  changePassword('clinic/change-password'),
  forgetPassword('clinic/forgot-password'),
  resetPassword('clinic/reset-password'),
  verifyOtp('clinic/verify-reset-otp'),
  deleteTreatment('clinic/treatments/{treatment_id}'),
  updateDoctorTreatment('clinic/doctors'),
  getFeature("clinic/features"),
  roles("clinic/roles"),
  catalog('clinic/products/catalog'),
  clinicProducts('clinic/products'),
  getMe("clinic/me"),;

  final String path;
  const Endpoint(this.path);

  String withParams(Map<String, String> params) {
    var updatedPath = path;
    params.forEach((key, value) {
      updatedPath = updatedPath.replaceAll('{$key}', value);
    });
    return updatedPath;
  }
}

enum BaseUrls {
  // api('http://3.128.27.193/api/');
  api('https://api.skinsyncai.com/api/');
  // api('https://s21hn0m8-8084.asse.devtunnels.ms/api/');

  final String url;

  const BaseUrls(this.url);
}

enum AuthScreen { login, forgetPassword, verifyOtp, createNewPassword }

enum DiscountType { per, flat }
