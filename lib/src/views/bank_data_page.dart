import 'package:flutter/material.dart';
import 'package:radadz_app/src/slider/navigation.dart';
import 'package:radadz_app/src/utils/export.dart';

class BankDataPage extends StatefulWidget with NavigationStates{
  const BankDataPage({Key key}) : super(key: key);

  @override
  _BankDataPageState createState() => _BankDataPageState();
}

class _BankDataPageState extends State<BankDataPage> {

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
                flexibleSpace : ToolbarTitleCustom(title: 'data_bank_title'.tr())
            ),
          ),
          body: DataBankDriver()
    ) ;

  }

}


