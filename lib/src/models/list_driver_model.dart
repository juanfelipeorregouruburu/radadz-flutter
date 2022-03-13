class ListDriverModel {
  int _error;
  String _response;
  List<Driver> _driver = [];

  ListDriverModel.fromJson(Map<String , dynamic> json) {
    _error = json['msg'];
    _response = json['response'];

    if(_error == 1){
      List<Driver> temp = [];
      for (int i = 0; i < json['data'].length; i++) {
        Driver data = Driver(json['data'][i]);
        temp.add(data);
      }
      _driver = temp;
    }
  }

  int get error => _error;
  String get response => _response;
  List<Driver> get drivers => _driver;
}

class Driver {

  String _Id;
  String _firstName;
  String _secondName;
  String _firstLastname;
  String _secondLastname;
  String _documentNumber;
  String _email;
  String _phone;
  String _address;
  String _birthDate;
  String _licensePlateNumber;
  String _vehicleYear;
  String _drivingDailyRoutine;
  String _accoutNumber;
  DocumentTypeDriver _documentType;
  VehicleTypeDriver _vehicleType;
  BankNameDriver _bankNameDriver;
  AccountTypeDriver _accountTypeDriver;


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
    _accoutNumber = parsedJson['accoun_number'];
    _drivingDailyRoutine = parsedJson['driving_daily_routine'];

    _documentType = DocumentTypeDriver(parsedJson['document_type']);
    _vehicleType = VehicleTypeDriver(parsedJson['vehicle_type']);
    _bankNameDriver = BankNameDriver(parsedJson['bank_name']);
    _accountTypeDriver = AccountTypeDriver(parsedJson['account_type']);
  }

  String get id => _Id ;
  String get first_name => _firstName ;
  String get second_name => _secondName ;
  String get first_lastname => _firstLastname ;
  String get second_lastname => _secondLastname ;
  String get document_number => _documentNumber ;
  String get email => _email ;
  String get phone => _phone;
  String get address => _address ;
  String get birth_date => _birthDate ;
  String get license_plate_number => _licensePlateNumber ;
  String get vehicle_year => _vehicleYear ;
  String get driving_daily_routine => _drivingDailyRoutine ;
  String get accoutNumber => _accoutNumber ;
  DocumentTypeDriver get document_type => _documentType ;
  VehicleTypeDriver get vehicle_type => _vehicleType ;
  BankNameDriver get bank_name_driver => _bankNameDriver ;
  AccountTypeDriver get account_type_bank_driver => _accountTypeDriver ;

}

class DocumentTypeDriver{
  String _Id;
  String _documentType;
  String _description;

  DocumentTypeDriver(parsedJson) {
     _Id = parsedJson['id'].toString();
    _documentType = parsedJson['docuement_type'];
    _description = parsedJson['description'];
  }

  String get id => _Id;
  String get type => _documentType;
  String get description => _description;
}

class VehicleTypeDriver{
  String _Id;
  String _vehicleType;
  String _description;

  VehicleTypeDriver(parsedJson) {
    _Id = parsedJson['id'].toString();
    _vehicleType = parsedJson['vehicle_type'];
    _description = parsedJson['description'];
  }

  String get id => _Id.toString();
  String get type => _vehicleType;
  String get description => _description;
}

class AccountTypeDriver{
  String _Id;
  String _accountType;
  String _description;

  AccountTypeDriver(parsedJson) {
    _Id = parsedJson['id'].toString();
    _accountType = parsedJson['account_type'];
    _description = parsedJson['description'];
  }

  String get id => _Id;
  String get name => _accountType;
  String get description => _description;
}

class BankNameDriver{
  String _Id;
  String _BankName;
  String _description;

  BankNameDriver(parsedJson) {
    _Id = parsedJson['id'].toString();
    _BankName = parsedJson['bank_type'];
    _description = parsedJson['description'];
  }

  String get id => _Id;
  String get name => _BankName;
  String get description => _description;
}