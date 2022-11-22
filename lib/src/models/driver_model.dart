class Driver {

  String? _Id;
  String? _firstName;
  String? _secondName;
  String? _firstLastname;
  String? _secondLastname;
  String? _documentNumber;
  String? _email;
  String? _phone;
  String? _address;
  String? _birthDate;
  String? _licensePlateNumber;
  String? _vehicleYear;
  String? _drivingDailyRoutine;
  String? _accoutNumber;
  DocumentTypeDriver? _documentType;
  VehicleTypeDriver? _vehicleType;
  BankNameDriver? _bankNameDriver;
  AccountTypeDriver? _accountTypeDriver;

  Driver(parsedJson) {
    _Id = parsedJson['id'].toString();
    _firstName = parsedJson['first_name'];
    _secondName = parsedJson['second_name'];
    _firstLastname = parsedJson['first_lastname'];
    _secondLastname = parsedJson['second_lastname'];
    _documentNumber = parsedJson['document_number'];
    _email = parsedJson['email'];
    _phone = parsedJson['phone'];
    _address = parsedJson['address'];
    _birthDate = parsedJson['birth_date'];
    _licensePlateNumber = parsedJson['license_plate_number'];
    _vehicleYear = parsedJson['vehicle_year'];
    _drivingDailyRoutine = parsedJson['driving_daily_routine'];
    _documentType = DocumentTypeDriver(parsedJson['document_type']);
    _vehicleType = VehicleTypeDriver(parsedJson['vehicle_type']);
    if(parsedJson['accoun_number'] != null){_accoutNumber = parsedJson['accoun_number'];}
    if(parsedJson['bank_name'] != null){_bankNameDriver = BankNameDriver(parsedJson['bank_name']);}
    if(parsedJson['account_type'] != null){_accountTypeDriver = AccountTypeDriver(parsedJson['account_type']);}
  }

  Map<String, dynamic> toJson() => {
    "id": _Id == null ? null : _Id,
    "first_name": _firstName == null ? null : _firstName,
    "second_name": _secondName == null ? null : _secondName,
    "first_lastname": _firstLastname == null ? null : _firstLastname,
    "second_lastname": _secondLastname == null ? null : _secondLastname,
    "document_number": _documentNumber == null ? null : _documentNumber,
    "email": _email == null ? null : _email,
    "phone": _phone == null ? null : _phone,
    "address": _address == null ? null : _address,
    "birth_date": _birthDate == null ? null : _birthDate,
    "license_plate_number": _licensePlateNumber == null ? null : _licensePlateNumber,
    "vehicle_year": _vehicleYear == null ? null : _vehicleYear,
    "driving_daily_routine": _drivingDailyRoutine == null ? null : _drivingDailyRoutine,
    "account_number": _accoutNumber == null ? null : _accoutNumber,
    "document_type": _documentType == null ? null : _documentType!.toJson(),
    "vehicle_type": _vehicleType == null ? null : _vehicleType!.toJson(),
    "bank_name": _bankNameDriver == null ? null : _bankNameDriver!.toJson(),
    "account_type": _accountTypeDriver == null ? null : _accountTypeDriver!.toJson()
  };

}

class DocumentTypeDriver{
  String? _Id;
  String? _documentType;
  String? _description;

  DocumentTypeDriver(parsedJson) {
    _Id = parsedJson['id'].toString();
    _documentType = parsedJson['docuement_type'];
    _description = parsedJson['description'];
  }

  Map<String, dynamic> toJson() => {
    "id": _Id,
    "docuement_type": _documentType,
    "description": _description,
  };
}

class VehicleTypeDriver{
  String? _Id;
  String? _vehicleType;
  String? _description;

  VehicleTypeDriver(parsedJson) {
    _Id = parsedJson['id'].toString();
    _vehicleType = parsedJson['vehicle_type'];
    _description = parsedJson['description'];
  }

  Map<String, dynamic> toJson() => {
    "id": _Id,
    "vehicle_type": _vehicleType,
    "description": _description,
  };
}

class AccountTypeDriver{
  String? _Id;
  String? _accountType;
  String? _description;

  AccountTypeDriver(parsedJson) {
    _Id = parsedJson['id'].toString();
    _accountType = parsedJson['account_type'];
    _description = parsedJson['description'];
  }

  Map<String, dynamic> toJson() => {
    "id": _Id,
    "account_type": _accountType,
    "description": _description,
  };
}

class BankNameDriver{
  String? _Id;
  String? _BankName;
  String? _description;

  BankNameDriver(parsedJson) {
    _Id = parsedJson['id'].toString();
    _BankName = parsedJson['bank_type'];
    _description = parsedJson['description'];
  }

  Map<String, dynamic> toJson() => {
    "id": _Id,
    "bank_type": _BankName,
    "description": _description,
  };
}