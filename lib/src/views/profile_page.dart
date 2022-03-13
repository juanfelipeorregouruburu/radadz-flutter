import 'package:flutter/material.dart';
import 'package:radadz_app/src/slider/navigation.dart';
import 'package:radadz_app/src/utils/export.dart';

class ProfilePage extends StatefulWidget with NavigationStates {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final prefs = new Preferences();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(prefs.getDriverId);
    context.read<ListDriverBloc>().getDriver(driver_id: "1");
  }

  @override
  Widget build(BuildContext context) {
    final listDriverProvider = context.watch<ListDriverBloc>();

    return listDriverProvider.isLoading
        ? ActivityIndicator(marginTop: 50)
        : Scaffold(
            key: _scaffoldKey,
            extendBodyBehindAppBar: true,
            backgroundColor: Colors.white,
            body: ProfileDriver(driver: listDriverProvider.selectDriver,));
  }
}
