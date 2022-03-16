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
  String _accountNumber;
  List<Trip> _trips = [];
  BankNamePayment _bankNamePayment;
  AccountTypePayment _accountTypePayment;

  Payment(parsedJson){
    _paymentId = parsedJson['id'];
    _paymentTime = parsedJson['payment_time'];
    _totalTtokensCanceled = parsedJson['total_tokens_canceled'];
    _totalMoneyPayed = parsedJson['total_money_payed'];


    if(parsedJson['bank_name'] != null){_bankNamePayment = BankNamePayment(parsedJson['bank_name']);}
    if(parsedJson['account_type'] != null){_accountTypePayment = AccountTypePayment(parsedJson['account_type']);}
    if(parsedJson['account_number'] != null){_accountNumber = parsedJson['account_number'];}

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
  String get accoutNumber => _accountNumber ;
  BankNamePayment get bankNamePayment => _bankNamePayment ;
  AccountTypePayment get accountTypeBankPayment => _accountTypePayment ;
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


class AccountTypePayment{
  String _Id;
  String _accountType;
  String _description;

  AccountTypePayment(parsedJson) {
    _Id = parsedJson['id'].toString();
    _accountType = parsedJson['account_type'];
    _description = parsedJson['description'];
  }

  String get id => _Id;
  String get name => _accountType;
  String get description => _description;

  Map<String, dynamic> toJson() => {
    "id": id,
    "account_type": name,
    "description": description,
  };
}

class BankNamePayment{
  String _Id;
  String _BankName;
  String _description;

  BankNamePayment(parsedJson) {
    _Id = parsedJson['id'].toString();
    _BankName = parsedJson['bank_type'];
    _description = parsedJson['description'];
  }

  String get id => _Id;
  String get name => _BankName;
  String get description => _description;

  Map<String, dynamic> toJson() => {
    "id": id,
    "bank_type": name,
    "description": description,
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