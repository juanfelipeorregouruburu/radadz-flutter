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
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: StyleGeneral.GREEN,
        child: Icon(Icons.question_mark_rounded),
        onPressed: () {
          var dialog = AlertMessageError(icon: 'warning', message: 'tab_blurt_driver_info_question'.tr() );
          showDialog(
              context: context,
              builder: (BuildContext context) {
                Future.delayed(Duration(seconds: 5), () {
                  Navigator.of(context).pop(true);
                });
                return dialog;
           }
         );
        }
      ),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(75.h),
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
