import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';

class BlurtPage extends StatefulWidget with NavigationStates{
  const BlurtPage({Key? key}) : super(key: key);

  @override
  State<BlurtPage> createState() => _BlurtPageState();
}

class _BlurtPageState extends State<BlurtPage> with SingleTickerProviderStateMixin{

  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  Widget getTabBar() {
      return TabBar(
        controller: _tabController,
        indicatorColor: Theme.of(context).platform == TargetPlatform.iOS ? Colors.black54 : Colors.white,
        labelColor: Theme.of(context).platform == TargetPlatform.iOS ? Colors.black54 : Colors.white,
        tabs: <Widget>[
          Tab(text: 'tab_blurt_driver'.tr()),
          Tab(text: 'tab_blurt_all'.tr())
        ],
      );
  }

  Widget getTabBarPages(){
    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        TabMyBlurtsPage(),
        TabBlurtsGeneralPage()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;
    
    return Scaffold(
      floatingActionButton: Visibility(
        visible: !keyboardIsOpen,
        child: FloatingActionButton(
          backgroundColor: StyleGeneral.GREEN,
          child: Icon(Icons.question_mark_rounded),
          onPressed: () {
            var dialog = CustomAlertBlurtDialog(
              message: 'tab_blurt_driver_info_question'.tr(),
              onPositivePressed: () {

              },
              positiveBtnText: 'tab_blurt_dialog_close_button'.tr(),
            );
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) => dialog);
          }
        )
      ),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(85.h),
        child: Container(
          color: Theme.of(context).platform == TargetPlatform.iOS ? Colors.grey[50] : StyleGeneral.BLACK,
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Expanded(child: new Container()),
                getTabBar()
              ]
            )
          )
        )
      ),
      body: getTabBarPages(),
    );
  }
}
