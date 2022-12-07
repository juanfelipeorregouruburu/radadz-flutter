import 'dart:convert';

VehicleColorModel vehicleColorModelFromJson(String str) => VehicleColorModel.fromJson(json.decode(str));

String vehicleColorModelToJson(VehicleColorModel data) => json.encode(data.toJson());

class VehicleColorModel {
  List<VehicleColor>? vehiclesColor;

  VehicleColorModel({
    this.vehiclesColor,
  });

  factory VehicleColorModel.fromJson(Map<String, dynamic> json) => VehicleColorModel(
    vehiclesColor: List<VehicleColor>.from(json["data"].map((x) => VehicleColor.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(vehiclesColor!.map((x) => x.toJson())),
  };

}

class VehicleColor {
  int? id;
  String? name;

  VehicleColor({
    this.id,
    this.name
  });

  factory VehicleColor.fromJson(Map<String, dynamic> json) => VehicleColor(
      id: json["id"],
      name: json["color"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "color": name
  };

  @override
  String toString() {
    return 'VehicleColor{id: $id, name: $name}';
  }
}