class PaymentRecivedModel {
  int _error;
  String _message;
  List<Payment> _payments = [];

  PaymentRecivedModel.fromJson(Map<String, dynamic> json) {
    _error = json['msg'];
    _message = json['response'];

    if (_error == 1) {
      List<Payment> temp = [];
      for (int i = 0; i < json['data'].length; i++) {
        Payment data = Payment(json['data'][i]);
        temp.add(data);
      }
      _payments = temp;
    }
  }

  int get error => _error;
  String get message => _message;
  List<Payment> get payments => _payments;
}

class Payment{
  int _paymentId;
  String _paymentTime;
  String _totalTtokensCanceled;
  String _totalMoneyPayed;
  List<Trip> _trips = [];

  Payment(parsedJson){
    _paymentId = parsedJson['id'];
    _paymentTime = parsedJson['payment_time'];
    _totalTtokensCanceled = parsedJson['total_tokens_canceled'];
    _totalMoneyPayed = parsedJson['total_money_payed'];

    List<Trip> tempTips = [];

    for (int i = 0; i < parsedJson['trips'].length; i++) {
      Trip data_trips = Trip(parsedJson['trips'][i]);
      tempTips.add(data_trips);
    }

    _trips = tempTips;

  }

  int get payment_id => _paymentId;
  String get paymentDate => _paymentTime;
  String get tokensCancel => _totalTtokensCanceled;
  String get moneyPayment => _totalMoneyPayed;
  List<Trip> get trips => _trips;

  Map<String, dynamic> toJson() => {
    "id": _paymentId == null ? null : _paymentId,
    "payment_time": _paymentTime == null ? null : _paymentTime,
    "total_money_payed": _totalTtokensCanceled == null ? null : _totalTtokensCanceled,
    "total_money_payed": _totalMoneyPayed == null ? null : _totalMoneyPayed,
    "trips": _trips == null
        ? null
        : List<dynamic>.from(
      _trips.map(
            (x) => x.toJson(),
      ),
    ),
  };
}

class Trip {
  int _tripId;
  String _startTime;
  String _endDate;
  String _totalTokensEarned;
  String _totalMoneyEarned;


  Trip(parsedJson){
    _tripId = parsedJson['id'];
    _startTime = parsedJson['start_time'];
    _endDate = parsedJson['end_date'];
    _totalTokensEarned = parsedJson['total_tokens_earned'];
    _totalMoneyEarned = parsedJson['total_money_earned'];
  }

  int get tripId => _tripId;
  String get startTime => _startTime;
  String get endTime => _endDate;
  String get tokenEarned => _totalTokensEarned;
  String get moneyEarned => _totalMoneyEarned;

  Map<String, dynamic> toJson() => {
    "id": _tripId == null ? null : _tripId,
    "start_time": _startTime == null ? null : _startTime,
    "end_date": _endDate == null ? null : _endDate,
    "total_tokens_earned": _totalTokensEarned == null ? null : _totalTokensEarned,
    "total_money_earned": _totalMoneyEarned == null ? null : _totalMoneyEarned
  };

}