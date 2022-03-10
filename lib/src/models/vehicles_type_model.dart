import 'dart:convert';

VehicleTypeModel vehicleModelFromJson(String str) => VehicleTypeModel.fromJson(json.decode(str));

String vehicleModelToJson(VehicleTypeModel data) => json.encode(data.toJson());

class VehicleTypeModel {
  List<VehicleType> vehiclesType;

  VehicleTypeModel({
    this.vehiclesType,
  });

  factory VehicleTypeModel.fromJson(Map<String, dynamic> json) => VehicleTypeModel(
    vehiclesType: List<VehicleType>.from(json["data"].map((x) => VehicleType.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(vehiclesType.map((x) => x.toJson())),
  };

}

class VehicleType {
  String id;
  String name;
  String description;

  VehicleType({
    this.id,
    this.name,
    this.description,
  });

  factory VehicleType.fromJson(Map<String, dynamic> json) => VehicleType(
    id: json["id"].toString(),
    name: json["vehicle_type"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vehicle_type": name,
    "description": description
  };

  @override
  String toString() {
    return 'FeedVehicle{id: $id, name: $name, description: $description}';
  }
}