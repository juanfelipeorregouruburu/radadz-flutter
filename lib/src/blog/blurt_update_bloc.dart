import 'package:rxdart/rxdart.dart';
import 'package:radadz_app/src/utils/export.dart';

class BlurtUpdateBloc {
  final repository = Repository();
  final blurtUpdate = PublishSubject<BlurtResponseModel>();

  get data => blurtUpdate.stream;
  String driver_id, blurt_id;

  BlurtUpdateBloc({this.driver_id, this.blurt_id});

  BlurtUpdate() async {
    BlurtResponseModel _blurt = await repository.blurt_update(driver_id, blurt_id);
    blurtUpdate.sink.add(_blurt);
  }

  disponse() {
    blurtUpdate.close();
  }

}