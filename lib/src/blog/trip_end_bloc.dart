import 'package:rxdart/rxdart.dart';
import 'package:radadz_app/src/utils/export.dart';

class TripEndBloc {
  final repository = Repository();
  final tripEnd = PublishSubject<TripEndModel>();

  get data => tripEnd.stream;
  String driver_id, trip_id;

  TripEndBloc({this.driver_id , this.trip_id});

  TripEnd() async {
    TripEndModel _tripEnd = await repository.trip_end(driver_id, trip_id);
    tripEnd.sink.add(_tripEnd);
  }

  disponse() {
    tripEnd.close();
  }

}