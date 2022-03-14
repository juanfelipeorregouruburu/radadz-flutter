import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radadz_app/src/slider/navigation.dart';
import 'package:radadz_app/src/utils/export.dart';


class BankDataPage extends StatefulWidget with NavigationStates{
  const BankDataPage({Key key}) : super(key: key);

  @override
  _BankDataPageState createState() => _BankDataPageState();
}

class _BankDataPageState extends State<BankDataPage> {
  final prefs = new Preferences();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ListDriverBloc>().getDriver(driver_id: prefs.getDriverId);
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
        body: DataBankDriver(driver: listDriverProvider.selectDriver,));

  }

}


