import 'dart:convert';

BankAcountTypeModel bankAcountTypeModelFromJson(String str) => BankAcountTypeModel.fromJson(json.decode(str));

String BankAcountTypeModelToJson(BankAcountTypeModel data) => json.encode(data.toJson());

class BankAcountTypeModel {
  List<BankAccountType>? bankAcountType;

  BankAcountTypeModel({
    this.bankAcountType,
  });

  factory BankAcountTypeModel.fromJson(Map<String, dynamic> json) => BankAcountTypeModel(
    bankAcountType: List<BankAccountType>.from(json["data"].map((x) => BankAccountType.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(bankAcountType!.map((x) => x.toJson())),
  };

}

class BankAccountType {
  int? id;
  String? name;
  String? description;

  BankAccountType({
    this.id,
    this.name,
    this.description,
  });

  factory BankAccountType.fromJson(Map<String, dynamic> json) => BankAccountType(
    id: json["id"],
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
    return 'BankAccountType{id: $id, name: $name, description: $description}';
  }
}