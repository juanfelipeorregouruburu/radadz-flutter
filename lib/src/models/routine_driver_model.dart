import 'dart:convert';

RoutineDriverModel routineDriverFromJson(String str) => RoutineDriverModel.fromJson(json.decode(str));

String routineDriverToJson(RoutineDriverModel data) => json.encode(data.toJson());

class RoutineDriverModel {
  List<RoutineDriver>? routinesDriver;

  RoutineDriverModel({
    this.routinesDriver,
  });

  factory RoutineDriverModel.fromJson(Map<String, dynamic> json) => RoutineDriverModel(
    routinesDriver: List<RoutineDriver>.from(json["data"].map((x) => RoutineDriver.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(routinesDriver!.map((x) => x.toJson())),
  };

}

class RoutineDriver {
  int? id;
  String? name;

  RoutineDriver({
    this.id,
    this.name
  });

  factory RoutineDriver.fromJson(Map<String, dynamic> json) => RoutineDriver(
    id: json["id"],
    name: json["routine"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "routine": name
  };

  @override
  String toString() {
    return 'RoutineDriver{id: $id, name: $name}';
  }
}