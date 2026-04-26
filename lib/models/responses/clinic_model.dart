class Clinic {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? address;
  String? logo;
  String? status;
  String? cc;
  String? country;

  Clinic({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.address,
    this.logo,
    this.status,
    this.cc,
    this.country,
  });

  Clinic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    address = json['address'];
    logo = json['logo'];
    status = json['status'];
    cc = json['cc'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'logo': logo,
      'status': status,
      'cc': cc,
      'country': country,
    };
  }
}
