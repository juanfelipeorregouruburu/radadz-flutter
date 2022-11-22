import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:radadz_app/app.dart';
import 'package:radadz_app/src/utils/preferences.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:radadz_app/src/utils/supported_locales.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();
  await Preferences.init();

  runApp(EasyLocalization(
    supportedLocales: supportedLocales,
    path: 'assets/translations',
    fallbackLocale: english,
    child: const MyApp()
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return App();
  }
}
