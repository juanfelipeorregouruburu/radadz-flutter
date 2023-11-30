import 'dart:convert';

class PaymentModel {
  final String response;
  final int msg;
  final List<Datum> data;

  PaymentModel({
    required this.response,
    required this.msg,
    required this.data,
  });

  factory PaymentModel.fromRawJson(String str) => PaymentModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
    response: json["response"],
    msg: json["msg"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "response": response,
    "msg": msg,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  final int id;
  final String paymentTime;
  final String totalTokensCanceled;
  final String totalMoneyPayed;
  final String paymentDocumentUrl;
  final String accountNumber;
  final AccountType accountType;
  final BankName bankName;

  Datum({
    required this.id,
    required this.paymentTime,
    required this.totalTokensCanceled,
    required this.totalMoneyPayed,
    required this.paymentDocumentUrl,
    required this.accountNumber,
    required this.accountType,
    required this.bankName,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    paymentTime: json["payment_time"],
    totalTokensCanceled: json["total_tokens_canceled"],
    totalMoneyPayed: json["total_money_payed"],
    paymentDocumentUrl: json["payment_document_url"],
    accountNumber: json["account_number"],
    accountType: AccountType.fromJson(json["account_type"]),
    bankName: BankName.fromJson(json["bank_name"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "payment_time": paymentTime,
    "total_tokens_canceled": totalTokensCanceled,
    "total_money_payed": totalMoneyPayed,
    "payment_document_url": paymentDocumentUrl,
    "account_number": accountNumber,
    "account_type": accountType.toJson(),
    "bank_name": bankName.toJson(),
  };
}

class AccountType {
  final int id;
  final String accountType;
  final String description;

  AccountType({
    required this.id,
    required this.accountType,
    required this.description,
  });

  factory AccountType.fromRawJson(String str) => AccountType.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AccountType.fromJson(Map<String, dynamic> json) => AccountType(
    id: json["id"],
    accountType: json["account_type"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "account_type": accountType,
    "description": description,
  };
}

class BankName {
  final int id;
  final String bankType;
  final String description;

  BankName({
    required this.id,
    required this.bankType,
    required this.description,
  });

  factory BankName.fromRawJson(String str) => BankName.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BankName.fromJson(Map<String, dynamic> json) => BankName(
    id: json["id"],
    bankType: json["bank_type"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "bank_type": bankType,
    "description": description,
  };
}
