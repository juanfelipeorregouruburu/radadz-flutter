import 'package:radadz_app/src/utils/export.dart';
import 'package:rxdart/rxdart.dart';

class ResetPasswordBloc{
  final repository = Repository();

  final resetPassword = PublishSubject<ResponseModel>();

  get data => resetPassword.stream;
  String phone;

  ResetPasswordBloc({ this.phone});

  setResetPassword() async {
    ResponseModel _responseModel = await repository.resetPasswordRepository(phone);
    resetPassword.sink.add(_responseModel);
  }

  disponse() {
    resetPassword.close();
  }
}

class ResetVerifyCodeBloc{
  final repository = Repository();

  final resetVerifyCode = PublishSubject<ResponseModel>();

  get data => resetVerifyCode.stream;
  String code;

  ResetVerifyCodeBloc({ this.code});

  setResetVerifyCode() async {
    ResponseModel _responseModel = await repository.resetVerifyCodeRepository(code);
    resetVerifyCode.sink.add(_responseModel);
  }

  disponse() {
    resetVerifyCode.close();
  }
}

class ResetChangePasswordBloc{
  final repository = Repository();

  final resetChangePassword = PublishSubject<ResponseModel>();

  get data => resetChangePassword.stream;
  String code;
  String password;

  ResetChangePasswordBloc({this.code , this.password});

  setResetChangePassword() async {
    ResponseModel _responseModel = await repository.resetChangePasswordRepository(code,password);
    resetChangePassword.sink.add(_responseModel);
  }

  disponse() {
    resetChangePassword.close();
  }
}