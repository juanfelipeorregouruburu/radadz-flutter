import 'package:rxdart/rxdart.dart';
import 'package:radadz_app/src/utils/export.dart';

class TripStartBloc {
  final repository = Repository();
  final tripStart = PublishSubject<TripStartModel>();

  get data => tripStart.stream;
  String driver_id;

  TripStartBloc({this.driver_id});

  TripStart() async {
    TripStartModel _tripStart = await repository.trip_start(driver_id);
    tripStart.sink.add(_tripStart);
  }

  disponse() {
    tripStart.close();
  }

}