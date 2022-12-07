import 'dart:convert';

VehicleManufacturerModel vehicleManufacturerModelFromJson(String str) => VehicleManufacturerModel.fromJson(json.decode(str));

String vehicleManufacturerModelToJson(VehicleManufacturerModel data) => json.encode(data.toJson());

class VehicleManufacturerModel {
  List<VehicleManufacturer>? vehiclesManufacturer;

  VehicleManufacturerModel({
    this.vehiclesManufacturer,
  });

  factory VehicleManufacturerModel.fromJson(Map<String, dynamic> json) => VehicleManufacturerModel(
    vehiclesManufacturer: List<VehicleManufacturer>.from(json["data"].map((x) => VehicleManufacturer.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(vehiclesManufacturer!.map((x) => x.toJson())),
  };

}

class VehicleManufacturer {
  int? id;
  String? name;

  VehicleManufacturer({
    this.id,
    this.name
  });

  factory VehicleManufacturer.fromJson(Map<String, dynamic> json) => VehicleManufacturer(
    id: json["id"],
    name: json["manufacturer"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "manufacturer": name
  };

  @override
  String toString() {
    return 'VehicleManufacturer{id: $id, name: $name}';
  }
}