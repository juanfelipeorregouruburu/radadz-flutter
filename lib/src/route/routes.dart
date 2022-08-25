import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';


Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    'home': (BuildContext context) => HomePage(),
    'login': (BuildContext context) => LoginPage(),
    'intro': (BuildContext context) => Intro(),
    'register': (BuildContext context) => RegisterPage(),

    'reset_password': (BuildContext context) => const ResetPasswordPage(),
    'reset_verify_code': (BuildContext context) => const ResetVerificationCodePage(),
    'reset_change_password': (BuildContext context) => const ResetChangePasswordPage(),

  };
}