import 'package:rxdart/rxdart.dart';
import 'package:radadz_app/src/utils/export.dart';

class SignInBloc {
  final repository = Repository();
  final singIn = PublishSubject<SingninModel>();

  get data => singIn.stream;
  String phone, password,token;

  SignInBloc({this.phone, this.password});

  SingIn() async {
    SingninModel _signIn = await repository.sign_in(phone, password);
    singIn.sink.add(_signIn);
  }

  disponse() {
    singIn.close();
  }

}