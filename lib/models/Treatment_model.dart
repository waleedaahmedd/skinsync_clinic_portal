class TreatmentModel {
  int? id;
  String? name;
  String? description;
  int? price;

  TreatmentModel({this.id, this.name, this.description, this.price});

  TreatmentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
  }
}
