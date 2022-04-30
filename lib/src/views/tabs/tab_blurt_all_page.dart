import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';

class TabBlurtsGeneralPage extends StatefulWidget {
  const TabBlurtsGeneralPage({Key key}) : super(key: key);

  @override
  State<TabBlurtsGeneralPage> createState() => _State();
}

class _State extends State<TabBlurtsGeneralPage> {
  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 15.w),
          child: CardBlurtAllWidget()
        ),
      ),
    );
  }
}
