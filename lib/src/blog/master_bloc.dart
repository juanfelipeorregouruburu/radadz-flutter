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

class VehicleTypeBloc {
  final repository = Repository();
  final vehicle = PublishSubject<VehicleTypeModel>();

  get data => vehicle.stream;

  VehicleTypeBloc();

  VehicleTypes() async {
    VehicleTypeModel _vehicle = await repository.vehiclesListRepository();
    vehicle.sink.add(_vehicle);
  }

  disponse() {
    vehicle.close();
  }

}

final blocBankAccountType = BankAccountTypeBloc();
final blocBankList = BankListBloc();
final blocDocumentType = DocumentTypeBloc();
final blocVehicleType = VehicleTypeBloc();