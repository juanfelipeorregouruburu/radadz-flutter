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
  TripHistory _selectTrip;
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  TripHistory get selectPayment => _selectTrip;

  set selectTripHistory(TripHistory selectTrip) {
    _selectTrip = selectTrip;
    notifyListeners();
  }

  TripHistoryModel get tripHistoryList => _tripHistoryModel;

  set listTripHistory(TripHistoryModel data) {
    _tripHistoryModel = data;
    notifyListeners();
  }

  void selectTripDetail(TripHistory tripHistory) {
    final newTrip = TripHistory(tripHistory.toJson());
    selectTripHistory = newTrip;
  }

  Future getListTripHistoryDriver({@required String driver_id}) async {
    isLoading = true;

    debouncer.run(() async {
      TripHistoryModel _tripModel = await repository.listTripHistoryDriverRepository(driver_id);
      isLoading = false;
      listTripHistory = _tripModel;
    });

  }


}