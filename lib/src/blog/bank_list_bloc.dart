import 'package:rxdart/rxdart.dart';
import 'package:radadz_app/src/utils/export.dart';

class BankListBloc {
  final repository = Repository();
  final bankList = PublishSubject<BankListModel>();

  get data => bankList.stream;

  BankListBloc();

  BankList() async {
    BankListModel _bankList = await repository.banks_list();
    bankList.sink.add(_bankList);
  }

  disponse() {
    bankList.close();
  }

}

final blocBankList = BankListBloc();