import 'package:rxdart/rxdart.dart';
import 'package:radadz_app/src/utils/export.dart';

class BankAccountTypeBloc {
  final repository = Repository();
  final bankAccountType = PublishSubject<BankAcountTypeModel>();

  get data => bankAccountType.stream;

  BankAccountTypeBloc();

  BankAccountTypeList() async {
    BankAcountTypeModel _bankTypeAccount = await repository.accountTypeBankRepository();
    bankAccountType.sink.add(_bankTypeAccount);
  }

  disponse() {
    bankAccountType.close();
  }

}

class BankListBloc {
  final repository = Repository();
  final bankList = PublishSubject<BankListModel>();

  get data => bankList.stream;

  BankListBloc();

  BankList() async {
    BankListModel _bankList = await repository.bankListRepository();
    bankList.sink.add(_bankList);
  }

  disponse() {
    bankList.close();
  }

}

class DocumentTypeBloc {
  final repository = Repository();
  final documentType = PublishSubject<DocumentTypeModel>();

  get data => documentType.stream;

  DocumentTypeBloc();

  DocumentTypes() async {
    DocumentTypeModel _documentType = await repository.documentListRepository();
    documentType.sink.add(_documentType);
  }

  disponse() {
    documentType.close();
  }

}

class RoutineDriverBloc {
  final repository = Repository();
  final routineDriver = PublishSubject<RoutineDriverModel>();

  get data => routineDriver.stream;

  RoutineDriverBloc();

  RoutineDrivers() async {
    RoutineDriverModel _routineDriver = await repository.routineDriversRepository();
    routineDriver.sink.add(_routineDriver);
  }

  disponse() {
    routineDriver.close();
  }

}

class VehicleTypeBloc {
  final repository = Repository();
  final vehicle = PublishSubject<VehicleTypeModel>();

  get data => vehicle.stream;

  VehicleTypeBloc();

  VehicleTypes() async {
    VehicleTypeModel _vehicle = await repository.vehiclesTypeListRepository();
    vehicle.sink.add(_vehicle);
  }

  disponse() {
    vehicle.close();
  }

}

class VehicleColorBloc {
  final repository = Repository();
  final vehicle = PublishSubject<VehicleColorModel>();

  get data => vehicle.stream;

  VehicleColorBloc();

  VehiclesColor() async {
    VehicleColorModel _vehicle = await repository.vehiclesColorListRepository();
    vehicle.sink.add(_vehicle);
  }

  disponse() {
    vehicle.close();
  }

}

class VehicleManufacturerBloc {
  final repository = Repository();
  final vehicle = PublishSubject<VehicleManufacturerModel>();

  get data => vehicle.stream;

  VehicleManufacturerBloc();

  VehiclesManufacturer() async {
    VehicleManufacturerModel _vehicle = await repository.vehiclesManufacturerListRepository();
    vehicle.sink.add(_vehicle);
  }

  disponse() {
    vehicle.close();
  }

}

class VehiclesBloc {
  final repository = Repository();
  final vehicle = PublishSubject<VehicleModel>();

  get data => vehicle.stream;

  String? manufacturerId;
  VehiclesBloc({this.manufacturerId});

  VehiclesModel() async {
    VehicleModel _vehicle = await repository.vehiclesListRepository(manufacturerId);
    vehicle.sink.add(_vehicle);
  }

  disponse() {
    vehicle.close();
  }

}

final blocBankAccountType = BankAccountTypeBloc();
final blocBankList = BankListBloc();
final blocDocumentType = DocumentTypeBloc();
final blocRoutineDriver = RoutineDriverBloc();
final blocVehicleType = VehicleTypeBloc();
final blocVehicleColor = VehicleColorBloc();
final blocVehicleManufacturer = VehicleManufacturerBloc();
final blocVehicles = VehiclesBloc();