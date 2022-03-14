import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:radadz_app/src/utils/export.dart';

class ListPaymentReceivedDriverBloc with ChangeNotifier {
  final repository = Repository();
  final debouncer = Debouncer();

  PaymentRecivedModel _paymentRecivedModel;
  Payment _selectPayment;
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Payment get selectPayment => _selectPayment;

  set selectPayment(Payment selectPayment) {
    _selectPayment = selectPayment;
    notifyListeners();
  }

  PaymentRecivedModel get paymentReceivedList => _paymentRecivedModel;

  set paymentsReceived(PaymentRecivedModel data) {
    _paymentRecivedModel = data;
    notifyListeners();
  }

  void selectOrderDetail(Payment payment) {
    final newOrder = Payment(payment.toJson());
    selectPayment = newOrder;
  }

  Future getPaymentReceivedDriver({@required String driver_id,@required String start_time, @required String end_date}) async {
    isLoading = true;

    debouncer.run(() async {
      PaymentRecivedModel _paymentReceived = await repository.list_payment_received_driver(driver_id, start_time, end_date);
      isLoading = false;
      paymentsReceived = _paymentReceived;
    });

  }


}