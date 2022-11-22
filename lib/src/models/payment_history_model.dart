class PaymentHistoryModel {
  int? _error;
  String? _message;
  List<Payment>? _payments = [];

  PaymentHistoryModel.fromJson(Map<String, dynamic> json) {
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

  int get error => _error!;
  String get message => _message!;
  List<Payment> get payments => _payments!;
}

class Payment{
  int? _paymentId;
  String? _paymentTime;
  String? _totalTokensCanceled;
  String? _totalMoneyPayed;
  String? _accountNumber;
  BankNamePayment? _bankNamePayment;
  AccountTypePayment? _accountTypePayment;

  Payment(parsedJson){
    _paymentId = parsedJson['id'];
    _paymentTime = parsedJson['payment_time'];
    _totalTokensCanceled = parsedJson['total_tokens_canceled'];
    _totalMoneyPayed = parsedJson['total_money_payed'];

    if(parsedJson['bank_name'] != null){_bankNamePayment = BankNamePayment(parsedJson['bank_name']);}
    if(parsedJson['account_type'] != null){_accountTypePayment = AccountTypePayment(parsedJson['account_type']);}
    if(parsedJson['account_number'] != null){_accountNumber = parsedJson['account_number'];}
  }

  int get payment_id => _paymentId!;
  String get paymentDate => _paymentTime!;
  String get tokensCancel => _totalTokensCanceled!;
  String get moneyPayment => _totalMoneyPayed!;
  String get accountNumber => _accountNumber! ;
  BankNamePayment get bankNamePayment => _bankNamePayment! ;
  AccountTypePayment get accountTypeBankPayment => _accountTypePayment! ;
}


class AccountTypePayment{
  String? _Id;
  String? _accountType;
  String? _description;

  AccountTypePayment(parsedJson) {
    _Id = parsedJson['id'].toString();
    _accountType = parsedJson['account_type'];
    _description = parsedJson['description'];
  }

  String get id => _Id!;
  String get name => _accountType!;
  String get description => _description!;
}

class BankNamePayment{
  String? _Id;
  String? _BankName;
  String? _description;

  BankNamePayment(parsedJson) {
    _Id = parsedJson['id'].toString();
    _BankName = parsedJson['bank_type'];
    _description = parsedJson['description'];
  }

  String get id => _Id!;
  String get name => _BankName!;
  String get description => _description!;
}