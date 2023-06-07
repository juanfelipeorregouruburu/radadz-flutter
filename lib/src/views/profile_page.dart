import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';

class ProfilePage extends StatefulWidget with NavigationStates {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.h),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace : ToolbarTitleCustom(title: 'profile_title'.tr())
        )
      ),
      body: ProfileDriver()
    );

  }
}
