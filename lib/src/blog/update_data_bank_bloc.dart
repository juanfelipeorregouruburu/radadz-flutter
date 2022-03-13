import 'package:rxdart/rxdart.dart';
import 'package:radadz_app/src/utils/export.dart';

class UpdateDataBankDriverBloc {
  final repository = Repository();
  final updateDataBankDriver = PublishSubject<ResponseModel>();

  get data => updateDataBankDriver.stream;
  String driver_id, bank_id, account_number, account_type_id;

  UpdateDataBankDriverBloc({this.driver_id, this.bank_id,this.account_number,this.account_type_id});

  UpdateDataBank() async {
    ResponseModel _UpdateDataBankDriver = await repository.update_data_bank_driver(driver_id, bank_id,account_number,account_type_id);
    updateDataBankDriver.sink.add(_UpdateDataBankDriver);
  }

  disponse() {
    updateDataBankDriver.close();
  }

}