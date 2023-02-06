import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';

class TabMyBlurtsPage extends StatefulWidget {
  const TabMyBlurtsPage({Key? key}) : super(key: key);

  @override
  State<TabMyBlurtsPage> createState() => _TabMyBlurtsPageState();
}

class _TabMyBlurtsPageState extends State<TabMyBlurtsPage> {

  bool state_button = true;
  bool stateView = false;

  @override
  Widget build(BuildContext context) {
    final listBlurtProvider = context.watch<ListBlurtDriverBloc>();

    stateView = listBlurtProvider.getStateButton;
    state_button = !listBlurtProvider.getStateButton;

    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Stack(
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 10.h),
                      if (state_button)
                          GestureDetector(
                          onTap: (){
                            listBlurtProvider.setStateButton(true);
                          },
                          child: Container(
                            margin: EdgeInsets.fromLTRB(10.h, 10.h, 15.h, 5.h),
                            width: 95.h,
                            height: 30.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.w),
                              color: StyleGeneral.GREEN ,
                            ),
                            child: Text(
                              'register_blurt'.tr(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: ScreenUtil().setSp(12),
                                fontFamily: 'Poppins-Semi',
                              ),
                            ),
                          ),
                        ),

                      stateView ? CreateBlurtDriverPage() : CardBlurtDriverWidget()

                    ]
                  )
              ]
            )
          )
        )
      )
    );
  }
}
