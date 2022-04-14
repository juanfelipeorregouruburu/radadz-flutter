import 'package:flutter/material.dart';
import 'package:radadz_app/src/slider/sliderbar.dart';
import 'package:radadz_app/src/utils/export.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    statusBarLight();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SideBar(),
    );
  }
}
