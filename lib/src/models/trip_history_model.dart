class TripHistoryModel {
  int _error;
  String _message;
  List<TripHistory> _tripHistory = [];

  TripHistoryModel.fromJson(Map<String, dynamic> json) {
    _error = json['msg'];
    _message = json['response'];

    if (_error == 1) {
      List<TripHistory> temp = [];
      for (int i = 0; i < json['data'].length; i++) {
        TripHistory data = TripHistory(json['data'][i]);
        temp.add(data);
      }
      _tripHistory = temp;
    }
  }

  int get error => _error;
  String get message => _message;
  List<TripHistory> get trips => _tripHistory;
}

class TripHistory {
  int _tripId;
  String _startTime;
  String _endTime;
  String _totalFinishedVideoTime;
  String _totalEarnedFinishedVideo;
  String _totalEarnedImageTime;
   String _totalTokensEarned;
   String _totalMoneyEarned;
   TripHistoryDriver _driver;

  TripHistory(parsedJson){
    _tripId = parsedJson['id'];
    _startTime = parsedJson['start_time'];
    _endTime = parsedJson['end_date'];
    _totalFinishedVideoTime = parsedJson['total_finished_video_time'];
    _totalEarnedFinishedVideo = parsedJson['tokens_earned_for_finished_videos'];
    _totalEarnedImageTime = parsedJson['tokens_earned_for_image_time'];
    _totalTokensEarned = parsedJson['total_tokens_earned'];
    _totalMoneyEarned = parsedJson['total_money_earned'];
     if(parsedJson['driver'] != null){_driver = TripHistoryDriver(parsedJson['driver']);}
  }

  int get id => _tripId;
  String get startTime => _startTime;
  String get endTime => _endTime;
  String get totalFinishedVideoTime => _totalFinishedVideoTime;
  String get totalEarnedFinishedVideo => _totalEarnedFinishedVideo;
  String get totalEarnedImageTime => _totalEarnedImageTime;
   String get totalTokensEarned => _totalTokensEarned;
   String get totalMoneyEarned => _totalMoneyEarned;
   TripHistoryDriver get driver => _driver ;

  Map<String, dynamic> toJson() => {
    "id": _tripId == null ? null : _tripId,
    "start_time": _startTime == null ? null : _startTime,
    "end_date": _endTime == null ? null : _endTime,
    "total_tokens_earned": _totalTokensEarned == null ? null : _totalTokensEarned,
    "total_money_earned": _totalMoneyEarned == null ? null : _totalMoneyEarned,
    "driver": _driver == null ? null : _driver.toJson(),
  };

}

class TripHistoryDriver {
  int _id;
  String _firstName;
  String _secondName;
  String _firstLastName;
  String _secondLastName;
  String _documentNumber;
  String _phone;
  String _address;
  String _vehicleYear;
  String _accountNumber;
  String _plateNumber;
  TripHistoryVehicleType _vehicleType;
  TripHistoryBank _bank;
  TripHistoryAccount _account;

  TripHistoryDriver(parsedJson){
    _id = parsedJson['id'];
    _firstName = parsedJson['first_name'];
    _secondName = parsedJson['second_name'];
    _firstLastName = parsedJson['first_lastname'];
    _secondLastName = parsedJson['second_lastname'];
    _documentNumber = parsedJson['document_number'];
    _phone = parsedJson['phone'];
    _address = parsedJson['address'];
    _vehicleYear = parsedJson['vehicle_year'];
    _accountNumber = parsedJson['accoun_number'];
    _plateNumber = parsedJson['license_plate_number'];
    if(parsedJson['vehicle_type'] != null){_vehicleType = TripHistoryVehicleType(parsedJson['vehicle_type']);}
    if(parsedJson['bank_name'] != null){_bank = TripHistoryBank(parsedJson['bank_name']);}
    if(parsedJson['account_type'] != null){_account = TripHistoryAccount(parsedJson['account_type']);}
  }

  int get id => _id;
  String get firstName => _firstName;
  String get secondName => _secondName;
  String get firstLastName => _firstLastName;
  String get secondLastName => _secondLastName;
  String get documentNumber => _documentNumber;
  String get phone => _phone;
  String get address => _address;
  String get vehicleYear => _vehicleYear;
  String get accountNumber => _accountNumber;
  String get plateNumber => _plateNumber;
  TripHistoryVehicleType get vehicleType => _vehicleType ;
  TripHistoryBank get bank => _bank ;
  TripHistoryAccount get accountType => _account ;

  Map<String, dynamic> toJson() => {
    "id": _id == null ? null : _id,
    "first_name": _firstName == null ? null : _firstName,
    "second_name": _secondName == null ? null : _secondName,
    "first_lastname": _firstLastName == null ? null : _firstLastName,
    "second_lastname": _secondLastName == null ? null : _secondLastName,
    "document_number": _documentNumber == null ? null : _documentNumber,
    "phone": _phone == null ? null : _phone,
    "address": _address == null ? null : _address,
    "vehicle_year": _vehicleYear == null ? null : _vehicleYear,
    "accoun_number": _accountNumber == null ? null : _accountNumber,
    "license_plate_number": _plateNumber == null ? null : _plateNumber,
    "vehicle_type": vehicleType == null ? null : vehicleType.toJson(),
    "bank_name": _bank == null ? null : _bank.toJson(),
    "account_type": _account == null ? null : _account.toJson(),
  };
}

class TripHistoryVehicleType{
  String _vehicleName;

  TripHistoryVehicleType(parsedJson){
    _vehicleName = parsedJson['vehicle_type'];
  }

  String get name => _vehicleName;

  Map<String, dynamic> toJson() => {
    "vehicle_type": _vehicleName == null ? null : _vehicleName
  };
}

class TripHistoryBank{
  String _bankName;

  TripHistoryBank(parsedJson){
    _bankName = parsedJson['bank_type'];
  }

  String get bankName => _bankName;

  Map<String, dynamic> toJson() => {
    "bank_type": _bankName == null ? null : _bankName
  };

}

class TripHistoryAccount{
  String _accountTypeName;

  TripHistoryAccount(parsedJson){
    _accountTypeName = parsedJson['account_type'];
  }

  String get name => _accountTypeName;

  Map<String, dynamic> toJson() => {
    "account_type": _accountTypeName == null ? null : _accountTypeName
  };
}