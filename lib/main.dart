import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:radadz_app/app.dart';
import 'package:radadz_app/src/utils/preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final preferences = new Preferences();
  await preferences.initPreferences();
  bool auth = preferences.getAuth;

  runApp(auth == false ? MyApp(auth: false) : MyApp(auth: true));
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
