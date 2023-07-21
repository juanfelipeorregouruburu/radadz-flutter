import 'package:rxdart/rxdart.dart';
import 'package:radadz_app/src/utils/export.dart';

class SignInBloc {
  final repository = Repository();
  final singIn = PublishSubject<SingInModel>();

  get data => singIn.stream;
  String? phone, password,token;

  SignInBloc({this.phone, this.password});

  SingIn() async {
    SingInModel _signIn = await repository.signIn(phone, password);
    singIn.sink.add(_signIn);
  }

  disponse() {
    singIn.close();
  }

}

class DeleteAccountBloc {
  final repository = Repository();
  final deleteAccount = PublishSubject<ResponseModel>();

  get data => deleteAccount.stream;
  String? userId;

  DeleteAccountBloc({this.userId});

  SetDeleteAccount() async {
    ResponseModel _signIn = await repository.DeleteAccountRepository(userId);
    deleteAccount.sink.add(_signIn);
  }

  disponse() {
    deleteAccount.close();
  }

}