class TripStartModel {
  int _error;
  String _response;
  int _tripPayment_id;
  int _tripId;
  String _startTime;

  TripStartModel.fromJson(Map<String , dynamic> json) {
    _error = json['msg'];
    _response = json['response'];

    if(_error == 1){
      _tripPayment_id = json['trip_payment_id'];
      _tripId = json['trip_id'];
      _startTime = json['start_time'];
    }

  }

  int get error => _error;
  String get response => _response;
  int get trip_payment_id => _tripPayment_id;
  int get trip_id => _tripId ;
  String get start_time => _startTime;
}