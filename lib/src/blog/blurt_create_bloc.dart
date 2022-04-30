import 'package:rxdart/rxdart.dart';
import 'package:radadz_app/src/utils/export.dart';

class BlurtCreateBloc {
  final repository = Repository();
  final blurtCreate = PublishSubject<BlurtResponseModel>();

  get data => blurtCreate.stream;
  String driver_id, message;

  BlurtCreateBloc({this.driver_id, this.message});

  BlurtCreate() async {
    BlurtResponseModel _blurt = await repository.blurt_create(driver_id, message);
    blurtCreate.sink.add(_blurt);
  }

  disponse() {
    blurtCreate.close();
  }

}