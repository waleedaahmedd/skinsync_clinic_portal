import 'responses/clinic_model.dart';

class UserModel {
  int? id;
  int? clinicId;
  String? email;
  String? name;
  String? role;
  String? status;
  Clinic? clinic;

  UserModel({
    this.id,
    this.clinicId,
    this.email,
    this.name,
    this.role,
    this.status,
    this.clinic,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clinicId = json['clinic_id'];
    email = json['email'];
    name = json['name'];
    role = json['role'];
    status = json['status'];
    clinic = json['clinic'] != null ? Clinic.fromJson(json['clinic']) : null;
  }
}
