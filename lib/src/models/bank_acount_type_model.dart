import 'dart:convert';

BankAcountTypeModel bankAcountTypeModelFromJson(String str) => BankAcountTypeModel.fromJson(json.decode(str));

String BankAcountTypeModelToJson(BankAcountTypeModel data) => json.encode(data.toJson());

class BankAcountTypeModel {
  List<BankAcountType>? bankAcountType;

  BankAcountTypeModel({
    this.bankAcountType,
  });

  factory BankAcountTypeModel.fromJson(Map<String, dynamic> json) => BankAcountTypeModel(
    bankAcountType: List<BankAcountType>.from(json["data"].map((x) => BankAcountType.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(bankAcountType!.map((x) => x.toJson())),
  };

}

class BankAcountType {
  String? id;
  String? name;
  String? description;

  BankAcountType({
    this.id,
    this.name,
    this.description,
  });

  factory BankAcountType.fromJson(Map<String, dynamic> json) => BankAcountType(
    id: json["id"].toString(),
    name: json["account_type"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "account_type": name,
    "description": description
  };

  @override
  String toString() {
    return 'FeedAccountTypeBank{id: $id, name: $name, description: $description}';
  }
}