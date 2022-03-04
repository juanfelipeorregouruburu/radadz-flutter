import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:radadz_app/splash_screen.dart';
import 'package:radadz_app/src/register_page.dart';
import 'package:radadz_app/src/utils/export.dart';

class App extends StatefulWidget {
  final bool autenticado;
  const App({Key key, this.autenticado}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    MaterialColor colorCustom = MaterialColor(0xFF2C7245, StyleGeneral.colors);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return ScreenUtilInit(
        designSize: Size(360, 690),
        builder: () => MaterialApp(
          debugShowCheckedModeBanner: false,
         // home: SplashScreen(autenticado: widget.autenticado),
          home: ProfilePage(),
          routes: getAplicationRoutes(),
          theme: ThemeData(
              primarySwatch: colorCustom),
          builder: (context, widget) {
            return MediaQuery(
              //Setting font does not change with system font size
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget,
            );
          },
        )
    );
  }
}

