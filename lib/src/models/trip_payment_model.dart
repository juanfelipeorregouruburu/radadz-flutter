class TripPaymentHistoryModel {
  int _error;
  int _totalTrips;
  String _message;
  List<Trip> _trips = [];

  TripPaymentHistoryModel.fromJson(Map<String, dynamic> json) {
    _error = json['msg'];
    _message = json['response'];

    if (_error == 1) {
      _totalTrips = json['total_trips'];
      List<Trip> temp = [];
      for (int i = 0; i < json['data'].length; i++) {
        Trip data = Trip(json['data'][i]);
        temp.add(data);
      }
      _trips = temp;
    }
  }

  int get error => _error;
  String get message => _message;
  int get totalTrips => _totalTrips;
  List<Trip> get payments => _trips;
}


class Trip {
  String _startTime;
  String _endDate;
  String _totalTokensEarned;
  String _totalMoneyEarned;

  Trip(parsedJson){
    _startTime = parsedJson['start_time'];
    _endDate = parsedJson['end_date'];
    _totalTokensEarned = parsedJson['total_tokens_earned'];
    _totalMoneyEarned = parsedJson['total_money_earned'];
  }

  String get startTime => _startTime;
  String get endTime => _endDate;
  String get tokenEarned => _totalTokensEarned;
  String get moneyEarned => _totalMoneyEarned;

}