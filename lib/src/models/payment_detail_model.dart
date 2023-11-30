import 'dart:convert';

class PaymentDetailModel {
  final String response;
  final int msg;
  final List<Datum> data;
  final Driver driver;
  final TripPayment tripPayment;

  PaymentDetailModel({
    required this.response,
    required this.msg,
    required this.data,
    required this.driver,
   required this.tripPayment,
  });

  factory PaymentDetailModel.fromRawJson(String str) => PaymentDetailModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PaymentDetailModel.fromJson(Map<String, dynamic> json) => PaymentDetailModel(
    response: json["response"],
    msg: json["msg"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    driver: Driver.fromJson(json["driver"]),
    tripPayment: TripPayment.fromJson(json["trip_payment"]),
  );

  Map<String, dynamic> toJson() => {
    "response": response,
    "msg": msg,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "driver": driver.toJson(),
    "trip_payment": tripPayment.toJson(),
  };
}

class Datum {
  final int id;
  final String startTime;
  final String endDate;
  // final String totalFinishedVideoTime;
  // final String tokensEarnedForFinishedVideos;
  // final String totalInterruptedVideoTime;
  // final String tokensEarnedForInterruptedVideos;
  // final String tokensEarnedForImageTime;
  // final String totalBlurTime;
  // final String tokensEarnedForBlurTime;
  // final String totalTokensEarned;
  // final String totalImageTime;
  // final String totalMoneyEarned;
  // final String tokensGeneralBlurt;
  // final String tokensCustomBlurt;
  // final int driver;
  // final int tripPayment;
  // final int tripStatus;

  Datum({
    required this.id,
    required this.startTime,
    required this.endDate,
    // required this.totalFinishedVideoTime,
    // required this.tokensEarnedForFinishedVideos,
    // required this.totalInterruptedVideoTime,
    // required this.tokensEarnedForInterruptedVideos,
    // required this.tokensEarnedForImageTime,
    // required this.totalBlurTime,
    // required this.tokensEarnedForBlurTime,
    // required this.totalTokensEarned,
    // required this.totalImageTime,
    // required this.totalMoneyEarned,
    // required this.tokensGeneralBlurt,
    // required this.tokensCustomBlurt,
    // required this.driver,
    // required this.tripPayment,
    // required this.tripStatus,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    startTime: json["start_time"],
    endDate: json["end_date"],
    // totalFinishedVideoTime: json["total_finished_video_time"],
    // tokensEarnedForFinishedVideos: json["tokens_earned_for_finished_videos"],
    // totalInterruptedVideoTime: json["total_interrupted_video_time"],
    // tokensEarnedForInterruptedVideos: json["tokens_earned_for_interrupted_videos"],
    // tokensEarnedForImageTime: json["tokens_earned_for_image_time"],
    // totalBlurTime: json["total_blur_time"],
    // tokensEarnedForBlurTime: json["tokens_earned_for_blur_time"],
    // totalTokensEarned: json["total_tokens_earned"],
    // totalImageTime: json["total_image_time"],
    // totalMoneyEarned: json["total_money_earned"],
    // tokensGeneralBlurt: json["tokens_general_blurt"],
    // tokensCustomBlurt: json["tokens_custom_blurt"],
    // driver: json["driver"],
    // tripPayment: json["trip_payment"],
    // tripStatus: json["trip_status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "start_time": startTime,
    "end_date": endDate,
    // "total_finished_video_time": totalFinishedVideoTime,
    // "tokens_earned_for_finished_videos": tokensEarnedForFinishedVideos,
    // "total_interrupted_video_time": totalInterruptedVideoTime,
    // "tokens_earned_for_interrupted_videos": tokensEarnedForInterruptedVideos,
    // "tokens_earned_for_image_time": tokensEarnedForImageTime,
    // "total_blur_time": totalBlurTime,
    // "tokens_earned_for_blur_time": tokensEarnedForBlurTime,
    // "total_tokens_earned": totalTokensEarned,
    // "total_image_time": totalImageTime,
    // "total_money_earned": totalMoneyEarned,
    // "tokens_general_blurt": tokensGeneralBlurt,
    // "tokens_custom_blurt": tokensCustomBlurt,
    // "driver": driver,
    // "trip_payment": tripPayment,
    // "trip_status": tripStatus,
  };
}

class Driver {
  final int id;
  final String firstName;
  final String secondName;
  final String firstLastname;
  final String secondLastname;
  final String documentNumber;
  final String accounNumber;
  final DocumentType documentType;
  final BankName bankName;
  final AccountType accountType;

  Driver({
    required this.id,
    required this.firstName,
    required this.secondName,
    required this.firstLastname,
    required this.secondLastname,
    required this.documentNumber,
    required this.accounNumber,
    required this.documentType,
    required this.bankName,
    required this.accountType
  });

  factory Driver.fromRawJson(String str) => Driver.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Driver.fromJson(Map<String, dynamic> json) => Driver(
    id: json["id"],
    firstName: json["first_name"],
    secondName: json["second_name"],
    firstLastname: json["first_lastname"],
    secondLastname: json["second_lastname"],
    documentNumber: json["document_number"],
    accounNumber: json["accoun_number"],
    documentType: DocumentType.fromJson(json["document_type"]),
    bankName: BankName.fromJson(json["bank_name"]),
    accountType: AccountType.fromJson(json["account_type"]),

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "second_name": secondName,
    "first_lastname": firstLastname,
    "second_lastname": secondLastname,
    "document_number": documentNumber,
    "accoun_number": accounNumber,
    "document_type": documentType.toJson(),
    "bank_name": bankName.toJson(),
    "account_type": accountType.toJson()
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

class DocumentType {
  final int id;
  final String docuementType;
  final String description;

  DocumentType({
    required this.id,
    required this.docuementType,
    required this.description,
  });

  factory DocumentType.fromRawJson(String str) => DocumentType.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DocumentType.fromJson(Map<String, dynamic> json) => DocumentType(
    id: json["id"],
    docuementType: json["docuement_type"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "docuement_type": docuementType,
    "description": description,
  };
}

class DriverStatus {
  final int id;
  final String driverStatus;
  final String description;

  DriverStatus({
    required this.id,
    required this.driverStatus,
    required this.description,
  });

  factory DriverStatus.fromRawJson(String str) => DriverStatus.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DriverStatus.fromJson(Map<String, dynamic> json) => DriverStatus(
    id: json["id"],
    driverStatus: json["driver_status"],
    description: json["description"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "driver_status": driverStatus,
    "description": description,
  };
}

class DrivingDailyRoutine {
  final int id;
  final String routine;

  DrivingDailyRoutine({
    required this.id,
    required this.routine,
  });

  factory DrivingDailyRoutine.fromRawJson(String str) => DrivingDailyRoutine.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory DrivingDailyRoutine.fromJson(Map<String, dynamic> json) => DrivingDailyRoutine(
    id: json["id"],
    routine: json["routine"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "routine": routine,
  };
}

class VehicleColor {
  final int id;
  final String color;

  VehicleColor({
    required this.id,
    required this.color,
  });

  factory VehicleColor.fromRawJson(String str) => VehicleColor.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VehicleColor.fromJson(Map<String, dynamic> json) => VehicleColor(
    id: json["id"],
    color: json["color"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "color": color,
  };
}

class VehicleManufacturer {
  final int id;
  final String manufacturer;

  VehicleManufacturer({
    required this.id,
    required this.manufacturer,
  });

  factory VehicleManufacturer.fromRawJson(String str) => VehicleManufacturer.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VehicleManufacturer.fromJson(Map<String, dynamic> json) => VehicleManufacturer(
    id: json["id"],
    manufacturer: json["manufacturer"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "manufacturer": manufacturer,
  };
}

class VehicleType {
  final int id;
  final String vehicleType;

  VehicleType({
    required this.id,
    required this.vehicleType,
  });

  factory VehicleType.fromRawJson(String str) => VehicleType.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VehicleType.fromJson(Map<String, dynamic> json) => VehicleType(
    id: json["id"],
    vehicleType: json["vehicle_type"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "vehicle_type": vehicleType,
  };
}

class TripPayment {
  final int id;
  final String paymentTime;
  final double totalTimeVideoFinished;
  final double totalTokensVideoFinished;
  final double totalMoneyVideoFinished;
  final double totalTimeVideoInterrupted;
  final double totalTokensVideoInterrupted;
  final double totalMoneyVideoInterrupted;
  final double totalTimeImageFinished;
  final double totalTokensImageFinished;
  final double totalMoneyImageFinished;
  // final double totalTokensBlurtFinished;
  // final double totalTimeBlurtFinished;
  // final double totalMoneyBlurtFinished;
  // final double totalTime;
  final String totalTokensCanceled;
  final String totalMoneyPayed;


  TripPayment({
    required this.id,
    required this.paymentTime,
    required this.totalTimeVideoFinished,
    required this.totalTokensVideoFinished,
    required this.totalMoneyVideoFinished,
    required this.totalTimeVideoInterrupted,
    required this.totalTokensVideoInterrupted,
    required this.totalMoneyVideoInterrupted,
    required this.totalTimeImageFinished,
    required this.totalTokensImageFinished,
    required this.totalMoneyImageFinished,
    // required this.totalTokensBlurtFinished,
    // required this.totalTimeBlurtFinished,
    // required this.totalMoneyBlurtFinished,
    // required this.totalTime,
    required this.totalTokensCanceled,
    required this.totalMoneyPayed
  });

  factory TripPayment.fromRawJson(String str) => TripPayment.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TripPayment.fromJson(Map<String, dynamic> json) => TripPayment(
    id: json["id"],
    paymentTime: json["payment_time"],
    totalTimeVideoFinished: json["total_time_video_finished"] == null ? 0 : json["total_time_video_finished"]?.toDouble(),
    totalTokensVideoFinished: json["total_tokens_video_finished"] == null ? 0 : json["total_tokens_video_finished"]?.toDouble(),
    totalMoneyVideoFinished: json["total_money_video_finished"] == null ? 0 : json["total_money_video_finished"]?.toDouble(),
    totalTimeVideoInterrupted: json["total_time_video_interrupted"] == null ? 0 : json["total_time_video_interrupted"]?.toDouble(),
    totalTokensVideoInterrupted: json["total_tokens_video_interrupted"] == null ? 0 : json["total_tokens_video_interrupted"]?.toDouble(),
    totalMoneyVideoInterrupted: json["total_money_video_interrupted"] == null ? 0 : json["total_money_video_interrupted"]?.toDouble(),
    totalTimeImageFinished: json["total_time_image_finished"] == null ? 0 : json["total_time_image_finished"]?.toDouble(),
    totalTokensImageFinished: json["total_tokens_image_finished"] == null ? 0 : json["total_tokens_image_finished"],
    totalMoneyImageFinished: json["total_money_image_finished"] == null ? 0 : json["total_money_image_finished"],
    // totalTokensBlurtFinished: json["total_tokens_blurt_finished"],
    // totalTimeBlurtFinished: json["total_time_blurt_finished"],
    // totalMoneyBlurtFinished: json["total_money_blurt_finished"],
    // totalTime: json["total_time"]?.toDouble(),
     totalTokensCanceled: json["total_tokens_canceled"] == null ? 0 : json["total_tokens_canceled"],
     totalMoneyPayed: json["total_money_payed"] == null ? 0 :  json["total_money_payed"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
     "payment_time": paymentTime,
     "total_time_video_finished": totalTimeVideoFinished,
     "total_tokens_video_finished": totalTokensVideoFinished,
     "total_money_video_finished": totalMoneyVideoFinished,
     "total_time_video_interrupted": totalTimeVideoInterrupted,
     "total_tokens_video_interrupted": totalTokensVideoInterrupted,
     "total_money_video_interrupted": totalMoneyVideoInterrupted,
     "total_time_image_finished": totalTimeImageFinished,
     "total_tokens_image_finished": totalTokensImageFinished,
     "total_money_image_finished": totalMoneyImageFinished,
    //  "total_tokens_blurt_finished": totalTokensBlurtFinished,
    //  "total_time_blurt_finished": totalTimeBlurtFinished,
    //  "total_money_blurt_finished": totalMoneyBlurtFinished,
    // "total_time": totalTime,
     "total_tokens_canceled": totalTokensCanceled,
     "total_money_payed": totalMoneyPayed
  };
}
