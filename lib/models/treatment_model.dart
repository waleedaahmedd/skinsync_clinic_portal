class TreatmentModel {
  int? id;
  int? price;
  String? name;
  String? description;
  bool? isArea;
  List<SideAreaModel>? sideAreas;

  TreatmentModel({this.id, this.name, this.description, this.isArea});

  TreatmentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['treatment_price'];
    name = json['name'];
    description = json['description'];
    isArea = json['is_area'];
    sideAreas = json['side_areas'] != null
        ? (json['side_areas'] as List)
              .map((e) => SideAreaModel.fromJson(e))
              .toList()
        : null;
  }
}

class SideAreaModel {
  int? id;
  String? name;
  double? perSyringePrice;

  SideAreaModel({this.id, this.name, this.perSyringePrice});

  SideAreaModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    perSyringePrice = json['per_syringe_price'];
  }
  Map<String, dynamic> toJson() {
    return {"id": id, "name": name, "per_syringe_price": perSyringePrice};
  }
}
