import 'dart:convert';

BankListModel bankModelFromJson(String str) => BankListModel.fromJson(json.decode(str));

String bankLlistModelToJson(BankListModel data) => json.encode(data.toJson());

class BankListModel {
  List<Bank>? bankType;

  BankListModel({
    this.bankType,
  });

  factory BankListModel.fromJson(Map<String, dynamic> json) => BankListModel(
    bankType: List<Bank>.from(json["data"].map((x) => Bank.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(bankType!.map((x) => x.toJson())),
  };

}

class Bank {
  int? id;
  String? name;
  String? description;

  Bank({
    this.id,
    this.name,
    this.description,
  });

  factory Bank.fromJson(Map<String, dynamic> json) => Bank(
    id: json["id"],
    name: json["bank_type"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "bank_type": name,
    "description": description
  };

  @override
  String toString() {
    return 'FeedBank{id: $id, name: $name, description: $description}';
  }
}