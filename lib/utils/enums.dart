enum SharedPreferencesKeys {
  themeModeKey("theme-mode"),
  accessTokenKey("access-token");

  const SharedPreferencesKeys(this.keyText);

  final String keyText;
}

enum DoctorRole { doctor, injector }

enum Endpoint {
  login('clinic/login'),
  getTreatments('clinics/{clinicId}/treatments'),
  createDoctor('clinic/doctors/register'),
  getDoctors('doctors');

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
  api('http://3.128.27.193/api/');

  final String url;

  const BaseUrls(this.url);
}
