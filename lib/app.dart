import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:radadz_app/src/utils/export.dart';
import 'package:easy_localization/easy_localization.dart';


class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    MaterialColor colorCustom = MaterialColor(0xFF48b74c, StyleGeneral.colors);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return ScreenUtilInit(
        designSize: Size(360, 690),
        builder: () => MultiProvider(
          providers: [
            ChangeNotifierProvider<ListPaymentHistoryDriverBloc>(create: (_) => ListPaymentHistoryDriverBloc()),
            ChangeNotifierProvider<ListTripPaymentDriverBloc>(create: (_) => ListTripPaymentDriverBloc()),
            ChangeNotifierProvider<ListTripHistoryDriverBloc>(create: (_) => ListTripHistoryDriverBloc()),
            ChangeNotifierProvider<TripHistoryDetailDriverBloc>(create: (_) => TripHistoryDetailDriverBloc()),
            ChangeNotifierProvider<ListBlurtAllBloc>(create: (_) => ListBlurtAllBloc()),
            ChangeNotifierProvider<ListBlurtDriverBloc>(create: (_) => ListBlurtDriverBloc())
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            home: Preferences.getAuth ? HomePage() : LoginPage(),
            routes: getAplicationRoutes(),
            builder: (context, widget) {
              ScreenUtil.setContext(context);
              return MediaQuery(
                //Setting font does not change with system font size
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget!,
              );
            },
            theme: ThemeData(
                scaffoldBackgroundColor: Colors.blueGrey[50],
                primarySwatch: colorCustom
            ),
          ),
        )
    );
  }

}

