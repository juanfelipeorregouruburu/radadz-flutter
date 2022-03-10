import 'package:rxdart/rxdart.dart';
import 'package:radadz_app/src/utils/export.dart';

class VehicleTypeBloc {
  final repository = Repository();
  final vehicle = PublishSubject<VehicleTypeModel>();

  get data => vehicle.stream;

  VehicleTypeBloc();

  VehicleTypes() async {
    VehicleTypeModel _vehicle = await repository.vehicles_type();
    vehicle.sink.add(_vehicle);
  }

  disponse() {
    vehicle.close();
  }

}

final blocVehicleType = VehicleTypeBloc();