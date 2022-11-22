import 'package:radadz_app/src/models/driver_model.dart';

class SingninModel {
  int? _error;
  String? _response;
  String? _driverId;
  String? _token;
  Driver? _driver;

  SingninModel.fromJson(Map<String , dynamic> json) {
    _error = json['msg'];
    _response = json['response'];
    if(_error == 1){
      _driverId = json['user_id'].toString() ;
      _token = json['token'] ;
      _driver = Driver(json['data']);
    }
  }

  int get error => _error!;
  String get response => _response!;
  String get driver_id => _driverId!;
  String get token => _token!;
  Driver get driver => _driver!;
}

