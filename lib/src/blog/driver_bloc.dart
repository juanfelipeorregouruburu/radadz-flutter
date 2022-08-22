import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:radadz_app/src/utils/export.dart';

class SaveDriverBloc {

  final repository = Repository();
  final saveDriver = PublishSubject<SaveDriverModel>();
  get data => saveDriver.stream;

  String name_first ;
  String name_second ;
  String lastName_first ;
  String lastName_second ;
  String document_type ;
  String document_number ;
  String email ;
  String phone ;
  String address ;
  String password ;
  String date_birth ;
  String licence_number ;
  String vehicule_type ;
  String vehicule_year ;
  String driving_daily_routine ;


  SaveDriverBloc({this.name_first, this.name_second, this.lastName_first, this.lastName_second,
    this.document_type, this.document_number, this.email , this.phone, this.address, this.password, this.date_birth, this.licence_number, this.vehicule_type,
    this.vehicule_year, this.driving_daily_routine });

  SaveDriver() async {
    SaveDriverModel _saveDriver = await repository.saveDriverRepository(name_first, name_second, lastName_first , lastName_second , document_type, document_number,
        email, phone , password, address , date_birth,  licence_number , vehicule_type,
        vehicule_year , driving_daily_routine);
    saveDriver.sink.add(_saveDriver);
  }

  disponse() {
    saveDriver.close();
  }
}

class UpdateDriverBloc {

  final repository = Repository();
  final updateDriver = PublishSubject<UpdateDriverModel>();
  get data => updateDriver.stream;


  String driver_id ;
  String name_first ;
  String name_second ;
  String lastName_first ;
  String lastName_second ;
  String document_type ;
  String document_number ;
  String email ;
  String phone ;
  String address ;
  String date_birth ;
  String licence_number ;
  String vehicule_type ;
  String vehicule_year ;
  String driving_daily_routine ;


  UpdateDriverBloc({this.driver_id, this.name_first, this.name_second, this.lastName_first, this.lastName_second,
    this.document_type, this.document_number, this.email , this.phone, this.address, this.date_birth, this.licence_number, this.vehicule_type,
    this.vehicule_year, this.driving_daily_routine });

  UpdateDriver() async {
    UpdateDriverModel _updateDriver = await repository.updateDriverRepository(driver_id,name_first, name_second, lastName_first , lastName_second , document_type, document_number,
        email, phone , address , date_birth,  licence_number , vehicule_type, vehicule_year , driving_daily_routine);
    updateDriver.sink.add(_updateDriver);
  }

  disponse() {
    updateDriver.close();
  }
}

class UpdateDataBankDriverBloc {
  final repository = Repository();
  final updateDataBankDriver = PublishSubject<UpdateDataBankModel>();

  get data => updateDataBankDriver.stream;
  String driver_id, bank_id, account_number, account_type_id;

  UpdateDataBankDriverBloc({this.driver_id, this.bank_id,this.account_number,this.account_type_id});

  UpdateDataBank() async {
    UpdateDataBankModel _UpdateDataBankDriver = await repository.updateDriverDataBank(driver_id, bank_id,account_number,account_type_id);
    updateDataBankDriver.sink.add(_UpdateDataBankDriver);
  }

  disponse() {
    updateDataBankDriver.close();
  }

}

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
      PaymentRecivedModel _paymentReceived = await repository.listPaymentReceivedDriverRepository(driver_id, start_time, end_date);
      isLoading = false;
      paymentsReceived = _paymentReceived;
    });

  }

}