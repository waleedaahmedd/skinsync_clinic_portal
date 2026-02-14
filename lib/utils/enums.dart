enum SharedPreferencesKeys {
  themeModeKey("theme-mode"),
  accessTokenKey("access-token");

  const SharedPreferencesKeys(this.keyText);

  final String keyText;
}

enum Endpoint {
  login('clinic/login'),
  getClinicTreatments('clinics/{clinicId}/treatments'),
  getAdminTreatments('treatments/masters'),
  getAdminTreatmentsSideAreas('/clinic/side-areas/treatment/{treatmentId}'),
  addClinicTreatment('/clinic/treatments');

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
