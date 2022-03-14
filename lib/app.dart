import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:radadz_app/src/utils/export.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


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
        builder: () => MultiProvider(
          providers: [
            ChangeNotifierProvider<ListDriverBloc>(
              create: (_) => ListDriverBloc(),
            ),
            ChangeNotifierProvider<ListPaymentReceivedDriverBloc>(
              create: (_) => ListPaymentReceivedDriverBloc(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
           // home: SplashScreen(autenticado: widget.autenticado),
            home: Intro(),
            routes: getAplicationRoutes(),
            theme: ThemeData(
                primarySwatch: colorCustom),
            builder: EasyLoading.init()
            // builder: (context, widget) {
            //   return MediaQuery(
            //     //Setting font does not change with system font size
            //     data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            //     child: widget,
            //   );
            // },
          ),
        )
    );
  }

}

