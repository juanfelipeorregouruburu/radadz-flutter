import 'package:rxdart/rxdart.dart';
import 'package:radadz_app/src/utils/export.dart';

class BankAcountTypeBloc {
  final repository = Repository();
  final bankAccountType = PublishSubject<BankAcountTypeModel>();

  get data => bankAccountType.stream;

  BankAcountTypeBloc();

  BankAccountTypeList() async {
    BankAcountTypeModel _bankTypeAccount = await repository.banks_account_types();
    bankAccountType.sink.add(_bankTypeAccount);
  }

  disponse() {
    bankAccountType.close();
  }

}

final blocBankAccountType = BankAcountTypeBloc();