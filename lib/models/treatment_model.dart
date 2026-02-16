class TreatmentModel {
  int? id;
  String? name;
  String? description;
  bool? isArea;

  TreatmentModel({this.id, this.name, this.description, this.isArea});

  TreatmentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    isArea = json['is_area'];
  }
}

class SideAreaModel {
  int? id;
  String? name;
  int? price;

  SideAreaModel({this.id, this.name, this.price});

  SideAreaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "price": price};
  }
}
