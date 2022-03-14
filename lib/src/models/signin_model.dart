
class SingninModel {
  int _error;
  String _response;
  String _driverId;
  String _token;

  SingninModel.fromJson(Map<String , dynamic> json) {
    _error = json['msg'];
    _response = json['response'];
    if(_error == 1){
      _driverId = json['user_id'].toString() ;
      _token = json['token'] ;
    }
  }

  int get error => _error;
  String get response => _response;
  String get driver_id => _driverId;
  String get token => _token;

}