import 'dart:convert';

VehicleTypeModel vehicleTypeModelFromJson(String str) => VehicleTypeModel.fromJson(json.decode(str));

String vehicleTypeModelToJson(VehicleTypeModel data) => json.encode(data.toJson());

class VehicleTypeModel {
  List<VehicleType>? vehiclesType;

  VehicleTypeModel({
    this.vehiclesType,
  });

  factory VehicleTypeModel.fromJson(Map<String, dynamic> json) => VehicleTypeModel(
    vehiclesType: List<VehicleType>.from(json["data"].map((x) => VehicleType.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(vehiclesType!.map((x) => x.toJson())),
  };

}

class VehicleType {
  int? id;
  String? name;

  VehicleType({
    this.id,
    this.name
  });

  factory VehicleType.fromJson(Map<String, dynamic> json) => VehicleType(
    id: json["id"],
    name: json["vehicle_type"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vehicle_type": name
  };

  @override
  String toString() {
    return 'FeedVehicle{id: $id, name: $name}';
  }
}