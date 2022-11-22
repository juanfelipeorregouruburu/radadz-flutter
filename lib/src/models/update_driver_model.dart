import 'package:radadz_app/src/models/driver_model.dart';

class UpdateDriverModel {
  int? _error;
  String? _response;
  Driver? _driver;

  UpdateDriverModel.fromJson(Map<String , dynamic> json) {
    _error = json['msg'];
    _response = json['response'];
    if(_error == 1){
      _driver = Driver(json['data']);
    }
  }

  int get error => _error!;
  String get response => _response!;
  Driver get driver => _driver!;
}