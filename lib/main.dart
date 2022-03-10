import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:radadz_app/app.dart';
import 'package:radadz_app/src/utils/preferences.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:radadz_app/src/utils/supported_locales.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final preferences = new Preferences();
  await EasyLocalization.ensureInitialized();
  await preferences.initPreferences();
  bool auth = preferences.getAuth;

  runApp(EasyLocalization(
    supportedLocales: supportedLocales,
    path: 'assets/translations',
    fallbackLocale: english,
    child:auth == false ? MyApp(auth: false) : MyApp(auth: true),
  ));
}

class MyApp extends StatelessWidget {
  final bool auth;
  const MyApp({Key key, this.auth}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return App(autenticado: auth);
  }
}
