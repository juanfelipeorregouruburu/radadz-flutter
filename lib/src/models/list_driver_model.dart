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
  String _first_name;
  String _second_name;
  String _first_lastname;
  String _second_lastname;
  String _document_number;
  String _email;
  String _phone;
  String _address;
  String _birth_date;
  String _license_plate_number;
  String _vehicle_year;
  String _driving_daily_routine;
  DocumentTypeDriver _documentType;
  VehicleTypeDriver _vehicleType;


  Driver(parsedJson) {
    _Id = parsedJson['id'].toString();
    _first_name = parsedJson['first_name'];
    _second_name = parsedJson['second_name'];
    _first_lastname = parsedJson['first_lastname'];
    _second_lastname = parsedJson['second_lastname'];
    _document_number = parsedJson['document_number'];
    _email = parsedJson['email'];
    _phone = parsedJson['phone'];
    _address = parsedJson['address'];
    _birth_date = parsedJson['birth_date'];
    _license_plate_number = parsedJson['license_plate_number'];
    _vehicle_year = parsedJson['vehicle_year'];
    _driving_daily_routine = parsedJson['driving_daily_routine'];

    _documentType = DocumentTypeDriver(parsedJson['document_type']);
    _vehicleType = VehicleTypeDriver(parsedJson['vehicle_type']);
  }

  String get id => _Id ;
  String get first_name => _first_name ;
  String get second_name => _second_name ;
  String get first_lastname => _first_lastname ;
  String get second_lastname => _second_lastname ;
  String get document_number => _document_number ;
  String get email => _email ;
  String get phone => _phone;
  String get address => _address ;
  String get birth_date => _birth_date ;
  String get license_plate_number => _license_plate_number ;
  String get vehicle_year => _vehicle_year ;
  String get driving_daily_routine => _driving_daily_routine ;
  DocumentTypeDriver get document_type => _documentType ;
  VehicleTypeDriver get vehicle_type => _vehicleType ;

}

class DocumentTypeDriver{
  String _Id;
  String _document_type;
  String _description;

  DocumentTypeDriver(parsedJson) {
     _Id = parsedJson['id'].toString();
    _document_type = parsedJson['docuement_type'];
    _description = parsedJson['description'];
  }

  String get id => _Id;
  String get type => _document_type;
  String get description => _description;
}

class VehicleTypeDriver{
  String _Id;
  String _vehicle_type;
  String _description;

  VehicleTypeDriver(parsedJson) {
    _Id = parsedJson['id'].toString();
    _vehicle_type = parsedJson['vehicle_type'];
    _description = parsedJson['description'];
  }

  String get id => _Id.toString();
  String get type => _vehicle_type;
  String get description => _description;
}