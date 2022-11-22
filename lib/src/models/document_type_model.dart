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
  String? id;
  String? name;
  String? description;

  DocumentType({
    this.id,
    this.name,
    this.description,
  });

  factory DocumentType.fromJson(Map<String, dynamic> json) => DocumentType(
    id: json["id"].toString(),
    name: json["docuement_type"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "docuement_type": name,
    "description": description
  };

  @override
  String toString() {
    return 'FeedDocument{id: $id, name: $name, description: $description}';
  }
}