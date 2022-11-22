class SaveDriverModel {
  int? _error;
  String? _response;
  String? _driverId;

  SaveDriverModel.fromJson(Map<String , dynamic> json) {
    _error = json['msg'];
    _response = json['response'];
    if(_error == 1){
      _driverId = json['driver_id'].toString() ;
    }
  }

  int get error => _error!;
  String get response => _response!;
  String get driver_id => _driverId!;
}