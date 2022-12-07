import 'dart:convert';

VehicleModel vehicleModelFromJson(String str) => VehicleModel.fromJson(json.decode(str));

String vehicleModelToJson(VehicleModel data) => json.encode(data.toJson());

class VehicleModel {
  List<Vehicle>? vehicles;

  VehicleModel({
    this.vehicles,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) => VehicleModel(
    vehicles: List<Vehicle>.from(json["data"].map((x) => Vehicle.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(vehicles!.map((x) => x.toJson())),
  };

}

class Vehicle {
  int? id;
  String? name;

  Vehicle({
    this.id,
    this.name
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) => Vehicle(
      id: json["id"],
      name: json["model"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "model": name
  };

  @override
  String toString() {
    return 'Vehicle{id: $id, name: $name}';
  }
}