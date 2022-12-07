import 'dart:convert';

DocumentTypeModel documentModelFromJson(String str) => DocumentTypeModel.fromJson(json.decode(str));

String documentModelToJson(DocumentTypeModel data) => json.encode(data.toJson());

class DocumentTypeModel {
  List<DocumentType>? documentsType;

  DocumentTypeModel({
    this.documentsType,
  });

  factory DocumentTypeModel.fromJson(Map<String, dynamic> json) => DocumentTypeModel(
    documentsType: List<DocumentType>.from(json["data"].map((x) => DocumentType.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(documentsType!.map((x) => x.toJson())),
  };

}

class DocumentType {
  int? id;
  String? name;

  DocumentType({
    this.id,
    this.name
  });

  factory DocumentType.fromJson(Map<String, dynamic> json) => DocumentType(
    id: json["id"],
    name: json["docuement_type"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "docuement_type": name
  };

  @override
  String toString() {
    return 'DocumentType{id: $id, name: $name}';
  }
}