import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radadz_app/src/slider/navigation.dart';
import 'package:radadz_app/src/utils/export.dart';

class TripStartPage extends StatefulWidget with NavigationStates{
  const TripStartPage({Key key}) : super(key: key);

  @override
  _TripStartPageState createState() => _TripStartPageState();
}

class _TripStartPageState extends State<TripStartPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  bool _isStartStart = true;
  bool _isSynMaterial = false;
  bool _isSynDispositive = false;
  bool _isStartTrip = false;
  bool _isEndTrip = false;

  String textButton ='trip_state_button_syn_material'.tr();
  int stateBtn = 1;


  _changeText(){
    print(stateBtn);

    if(stateBtn == 1){
      setState(() {
        _isSynMaterial = true;
        textButton = 'trip_state_button_syn_dispotive'.tr();
      });
      stateBtn = 2;
    }else if(stateBtn == 2){

      setState(() {
        _isSynDispositive = true;
        textButton = 'trip_state_button_syn_start_trip'.tr();
      });
      stateBtn = 3;
    }else if(stateBtn == 3){
      setState(() {
        _isStartTrip = true;
        textButton = 'trip_state_button_syn_end_trip'.tr();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 120.h,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 5,
                        fit: FlexFit.tight,
                        child: Text(
                          'trip_state_text_syn_material'.tr(),
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          maxLines: 2,
                          style: TextStyle(
                            color: StyleGeneral.BLACK,
                            fontSize: ScreenUtil().setSp(14),
                            fontFamily: 'Poppins-Regular',
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.loose,
                        child: Container(
                          width: 35.h,
                          height: 35.h,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: _isSynMaterial ? StyleGeneral.GREEN : StyleGeneral.WHITE,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: StyleGeneral.GREEN,
                              width: 1.5,
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.done,
                              color: Colors.white,
                              size: ScreenUtil().setSp(15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 30.h,),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 5,
                        fit: FlexFit.tight,
                        child: Text(
                          'trip_state_text_syn_dispotive'.tr(),
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          maxLines: 2,
                          style: TextStyle(
                            color: StyleGeneral.BLACK,
                            fontSize: ScreenUtil().setSp(14),
                            fontFamily: 'Poppins-Regular',
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.loose,
                        child: Container(
                          width: 35.h,
                          height: 35.h,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: _isSynDispositive ? StyleGeneral.GREEN : StyleGeneral.WHITE,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: StyleGeneral.GREEN,
                              width: 1.5,
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.done,
                              color: Colors.white,
                              size: ScreenUtil().setSp(15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 30.h,),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 5,
                        fit: FlexFit.tight,
                        child: Text(
                          'trip_state_text_syn_start_trip'.tr(),
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          maxLines: 2,
                          style: TextStyle(
                            color: StyleGeneral.BLACK,
                            fontSize: ScreenUtil().setSp(14),
                            fontFamily: 'Poppins-Regular',
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.loose,
                        child: Container(
                          width: 35.h,
                          height: 35.h,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            color: _isStartTrip ? StyleGeneral.GREEN : StyleGeneral.WHITE,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: StyleGeneral.GREEN,
                              width: 1.5,
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.done,
                              color: Colors.white,
                              size: ScreenUtil().setSp(15),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 50.h,),

                  Center(
                    child: GestureDetector(
                      onTap: (){
                        _changeText();
                      },
                      child: Container(
                        width: 280.r,
                        height: 280.r,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                textButton,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                maxLines: 3,
                                style: TextStyle(
                                  color: StyleGeneral.WHITE,
                                  fontSize: ScreenUtil().setSp(17),
                                  fontFamily: 'Poppins-Regular',
                                ),
                              ),
                              SizedBox(height: 20.h,),

                              _isStartTrip ? Column(
                                children: [
                                  Center(
                                    child: Text(
                                      'trip_state_text_start_trip'.tr()+'4:46 am',
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      maxLines: 2,
                                      style: TextStyle(
                                        color: StyleGeneral.WHITE,
                                        fontSize: ScreenUtil().setSp(14),
                                        fontFamily: 'Poppins-Regular',
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20.h,),
                                  Center(
                                    child: Text(
                                      'trip_state_text_time_trip'.tr()+'3:32m',
                                      overflow: TextOverflow.ellipsis,
                                      softWrap: true,
                                      maxLines: 2,
                                      style: TextStyle(
                                        color: StyleGeneral.WHITE,
                                        fontSize: ScreenUtil().setSp(12),
                                        fontFamily: 'Poppins-Regular',
                                      ),
                                    ),
                                  ),
                                ],
                              ) : Container()

                            ],
                          ),
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: StyleGeneral.GREEN,
                        ),
                      ),
                    ),
                  )

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

