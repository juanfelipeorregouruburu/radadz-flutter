class DriverModel {
  int? _error;
  String? _response;
  Driver? _driver;

  DriverModel.fromJson(Map<String , dynamic> json) {
    _error = json['msg'];
    _response = json['response'];
    if(_error == 1){
      _driver = Driver(json['data']) ;
    }
  }

  int get error => _error!;
  String get response => _response!;
  Driver get driver => _driver!;
}


class Driver {

  int? _Id;
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
  String? _accountNumber;
  bool? _isOwner;
  String? _ownerVehicleName;
  String? _ownerIdNumber;
  String? _expirationDateTechnicalMechanical ;
  String? _expirationDateSOAT ;
  String? _expirationDateDriverLicence ;
  DocumentTypeDriver? _documentType;
  VehicleModelDriver? _vehicleModelDriver;
  VehicleTypeDriver? _vehicleType;
  VehicleManufacturerDriver? _vehicleManufacturerDriver;
  VehicleColorDriver? _vehicleColorDriver;
  DailyRoutineDriver? _dailyRoutineDriver;
  BankNameDriver? _bankNameDriver;
  AccountTypeDriver? _accountTypeDriver;

  Driver(parsedJson) {
    _Id = parsedJson['id'];
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
    _isOwner = parsedJson['is_owner'];
    _ownerVehicleName = parsedJson['owner_vehicle_name'];
    _ownerIdNumber = parsedJson['owner_id_number'];
    _expirationDateTechnicalMechanical = parsedJson['expiration_date_of_the_technical_mechanical_review'];
    _expirationDateSOAT = parsedJson['soat_expiration_date'];
    _expirationDateDriverLicence = parsedJson['expiration_date_drivers_license'];
    _documentType = DocumentTypeDriver(parsedJson['document_type']);
    _vehicleModelDriver = VehicleModelDriver(parsedJson['vehicle_model']);
    _vehicleType = VehicleTypeDriver(parsedJson['vehicle_type']);
    _vehicleManufacturerDriver = VehicleManufacturerDriver(parsedJson['vehicle_manufacturer']);
    _vehicleColorDriver = VehicleColorDriver(parsedJson['vehicle_color']);
    _dailyRoutineDriver = DailyRoutineDriver(parsedJson['driving_daily_routine']);

    if(parsedJson['accoun_number'] != null){_accountNumber = parsedJson['accoun_number'];}
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
    "is_owner": _isOwner == null ? null : _isOwner,
    "owner_vehicle_name": _ownerVehicleName == null ? null : _ownerVehicleName,
    "owner_id_number": _ownerIdNumber == null ? null : _ownerIdNumber,
    "document_type": _documentType == null ? null : _documentType!.toJson(),
    "vehicle_model": _vehicleModelDriver == null ? null : _vehicleModelDriver!.toJson(),
    "vehicle_type": _vehicleType == null ? null : _vehicleType!.toJson(),
    "vehicle_manufacturer": _vehicleManufacturerDriver == null ? null : _vehicleManufacturerDriver!.toJson(),
    "vehicle_color": _vehicleColorDriver == null ? null : _vehicleColorDriver!.toJson(),
    "expiration_date_of_the_technical_mechanical_review" : _expirationDateTechnicalMechanical == null ? null : _expirationDateTechnicalMechanical,
    "soat_expiration_date" : _expirationDateSOAT == null ? null : _expirationDateSOAT,
    "expiration_date_drivers_license" : _expirationDateDriverLicence == null ? null : _expirationDateDriverLicence,
    "driving_daily_routine": _dailyRoutineDriver == null ? null : _dailyRoutineDriver!.toJson(),
    //
    "account_number": _accountNumber == null ? null : _accountNumber,
    "bank_name": _bankNameDriver == null ? null : _bankNameDriver!.toJson(),
    "account_type": _accountTypeDriver == null ? null : _accountTypeDriver!.toJson()
  };
}

class DocumentTypeDriver{
  int? id;
  String? documentType;


  DocumentTypeDriver(parsedJson) {
    id = parsedJson['id'];
    documentType = parsedJson['docuement_type'];
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "docuement_type": documentType,
  };

  @override
  String toString() {
    return 'DocumentTypeDriver{id: $id, type: $documentType}';
  }
}

class VehicleModelDriver{
  int? id;
  String? model;


  VehicleModelDriver(parsedJson) {
    id = parsedJson['id'];
    model = parsedJson['model'];
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "model": model
  };

  @override
  String toString() {
    return 'VehicleModelDriver{id: $id, model: $model}';
  }
}

class VehicleTypeDriver{
  int? id;
  String? vehicleType;


  VehicleTypeDriver(parsedJson) {
    id = parsedJson['id'];
    vehicleType = parsedJson['vehicle_type'];
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "vehicle_type": vehicleType
  };

  @override
  String toString() {
    return 'VehicleTypeDriver{id: $id, name: $vehicleType}';
  }

}

class VehicleManufacturerDriver{
  int? id;
  String? vehicleManufacturer;


  VehicleManufacturerDriver(parsedJson) {
    id = parsedJson['id'];
    vehicleManufacturer = parsedJson['manufacturer'];
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "manufacturer": vehicleManufacturer
  };

  @override
  String toString() {
    return 'VehicleManufacturerDriver{id: $id, name: $vehicleManufacturer}';
  }
}

class VehicleColorDriver{
  int? id;
  String? vehicleColor;


  VehicleColorDriver(parsedJson) {
    id = parsedJson['id'];
    vehicleColor = parsedJson['color'];
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "color": vehicleColor
  };

  @override
  String toString() {
    return 'VehicleColorDriver{id: $id, name: $vehicleColor}';
  }
}

class DailyRoutineDriver{
  int? id;
  String? routine;


  DailyRoutineDriver(parsedJson) {
    id = parsedJson['id'];
    routine = parsedJson['routine'];
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "routine": routine
  };

  @override
  String toString() {
    return 'DailyRoutineDriver{id: $id, name: $routine}';
  }
}

class AccountTypeDriver{
  int? _Id;
  String? _accountType;

  AccountTypeDriver(parsedJson) {
    _Id = parsedJson['id'];
    _accountType = parsedJson['account_type'];
  }

  Map<String, dynamic> toJson() => {
    "id": _Id,
    "account_type": _accountType
  };

}

class BankNameDriver{
  int? _Id;
  String? _BankName;

  BankNameDriver(parsedJson) {
    _Id = parsedJson['id'];
    _BankName = parsedJson['bank_type'];
  }

  Map<String, dynamic> toJson() => {
    "id": _Id,
    "bank_type": _BankName
  };
}