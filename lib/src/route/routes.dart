import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';


Map<String, WidgetBuilder> getAplicationRoutes() {
  return <String, WidgetBuilder>{
    'home': (BuildContext context) => HomePage(),
    'login': (BuildContext context) => LoginPage(),
    'register': (BuildContext context) => RegisterPage(),
    'detailPayment': (BuildContext context) => DetailPaymentPage(),
  };
}