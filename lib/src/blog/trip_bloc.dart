import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';
import 'package:rxdart/rxdart.dart';

class TripStartBloc {
  final repository = Repository();
  final tripStart = PublishSubject<TripStartModel>();

  get data => tripStart.stream;
  String driver_id, trip_payment_id;

  TripStartBloc({this.driver_id , this.trip_payment_id});

  TripStart() async {
    TripStartModel _tripStart = await repository.tripStartRepository(driver_id , trip_payment_id);
    tripStart.sink.add(_tripStart);
  }

  disponse() {
    tripStart.close();
  }

}

class TripEndBloc {
  final repository = Repository();
  final tripEnd = PublishSubject<TripEndModel>();

  get data => tripEnd.stream;
  String driver_id, trip_id;

  TripEndBloc({this.driver_id , this.trip_id});

  TripEnd() async {
    TripEndModel _tripEnd = await repository.tripEndRepository(driver_id, trip_id);
    tripEnd.sink.add(_tripEnd);
  }

  disponse() {
    tripEnd.close();
  }

}

class ListTripHistoryDriverBloc with ChangeNotifier {
  final repository = Repository();
  final debouncer = Debouncer();

  TripHistoryModel _tripHistoryModel;
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  TripHistoryModel get listTripsHistory => _tripHistoryModel;

  set listTripsHistory(TripHistoryModel data) {
    _tripHistoryModel = data;
    notifyListeners();
  }

  Future getListTripHistoryDriver({@required String driver_id,@required String start_time, @required String end_date}) async {
    isLoading = true;
    debouncer.run(() async {
      TripHistoryModel _tripModel = await repository.listTripHistoryDriverRepository(driver_id,start_time,end_date);
      isLoading = false;
      listTripsHistory = _tripModel;
    });
  }

}

class TripHistoryDetailDriverBloc with ChangeNotifier {
  final repository = Repository();
  final debouncer = Debouncer();

  TripDetailHistoryModel _tripDetailHistoryModel;
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  TripDetailHistoryModel get tripDetailHistoryModel => _tripDetailHistoryModel;

  set tripDetailHistoryModel(TripDetailHistoryModel data) {
    _tripDetailHistoryModel = data;
    notifyListeners();
  }

  Future getTripHistoryDetailDriver({@required String trip_id}) async {
    isLoading = true;
    debouncer.run(() async {
      TripDetailHistoryModel _tripDetail = await repository.tripDetailHistoryDriverRepository(trip_id);
      isLoading = false;
      tripDetailHistoryModel = _tripDetail;
    });
  }

}

class ListPaymentHistoryDriverBloc with ChangeNotifier {
  final repository = Repository();
  final debouncer = Debouncer();

  PaymentHistoryModel _paymentHistoryModel;
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  PaymentHistoryModel get listPaymentHistory => _paymentHistoryModel;

  set listPaymentHistory(PaymentHistoryModel data) {
    _paymentHistoryModel = data;
    notifyListeners();
  }

  Future getListPaymentHistoryDriver({@required String driver_id,@required String start_time, @required String end_date}) async {
    isLoading = true;
    debouncer.run(() async {
      PaymentHistoryModel _tripPaymentModel = await repository.listPaymentHistoryDriverRepository(driver_id, start_time, end_date);
      isLoading = false;
      listPaymentHistory = _tripPaymentModel;
    });
  }

}

class ListTripPaymentDriverBloc with ChangeNotifier {
  final repository = Repository();
  final debouncer = Debouncer();

  TripPaymentHistoryModel _tripPaymentHistoryModel;
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  TripPaymentHistoryModel get listTripPaymentsHistory => _tripPaymentHistoryModel;

  set listTripPaymentsHistory(TripPaymentHistoryModel data) {
    _tripPaymentHistoryModel = data;
    notifyListeners();
  }

  Future getListTripPaymentHistoryDriver({@required String trip_payment_id}) async {
    isLoading = true;
    debouncer.run(() async {
      TripPaymentHistoryModel _tripPaymentModel = await repository.listTripPaymentDriverRepository(trip_payment_id);
      isLoading = false;
      listTripPaymentsHistory = _tripPaymentModel;
    });
  }

}