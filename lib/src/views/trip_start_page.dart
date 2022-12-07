import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';
import 'package:radadz_app/src/utils/get_second.dart';
import 'package:radadz_app/src/widgets/travel_text_animated_widget.dart';

class TripStartPage extends StatefulWidget with NavigationStates{
  const TripStartPage({Key? key}) : super(key: key);

  @override
  _TripStartPageState createState() => _TripStartPageState();
}

class _TripStartPageState extends State<TripStartPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final debouncer = Debouncer();

  final prefs = new Preferences();
  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countUp,
  );

  final StopWatchTimer _stopWatchTimerStart = StopWatchTimer(
    mode: StopWatchMode.countUp,
  );

  bool _isLoading = false;
  bool _isStartTrip = false;
  int _cronometroView = 0;
  String textButton ='trip_state_button_syn_start_trip'.tr();
  int stateBtn = 1;
  String hour = '';
  int trip_id = 0;

  TripStartBloc _tripStartBloc = new TripStartBloc();
  TripEndBloc _tripEndBloc = new TripEndBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tripStartBloc = TripStartBloc();
    _tripEndBloc = TripEndBloc();

    verifyStateTrip();
  }

  verifyStateTrip(){
    print('getStartTrip ${Preferences.getStartTrip}');
    if(Preferences.getStartTrip){
     getSecondDiferenceHourAfter(Preferences.getHourTripStart);
     changeText(Preferences.getHourTripStart);
    }
  }

  changeText(hour_time){
     setState(() {
       _cronometroView= 1;
       _isStartTrip = true;
       hour = hour_time;
       textButton = 'trip_state_button_syn_end_trip'.tr();
       stateBtn = 2;
     });
  }

  getSecondDiferenceHour(date_time){
    _stopWatchTimerStart.onExecute.add(StopWatchExecute.reset);
    _stopWatchTimerStart.setPresetSecondTime(getSecondDiference(date_time));
    _stopWatchTimerStart.onExecute.add(StopWatchExecute.start);
  }

  getSecondDiferenceHourAfter(date_time){
    _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
    _stopWatchTimer.setPresetSecondTime(getSecondDiferenceAfter(date_time));
    _stopWatchTimer.onExecute.add(StopWatchExecute.start);
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  _tripMethod(){
    if(stateBtn == 1){
      _tripStart();
    }
    else if(stateBtn == 2){
      _tripEnd();
    }
  }

  _tripStart() async{


    setState(() {
      _isLoading = true ;
    });


    _tripStartBloc.driver_id = Preferences.getDriverId;
    _tripStartBloc.trip_payment_id = Preferences.getTripPaymentId.toString();

     _tripStartBloc.TripStart();

    _tripStartBloc.data.listen((data) {

      setState(() {
        _isLoading = false ;
      });

      String icon = data.error == 1 ? 'success' : 'error';

      if (data.error == 1) {

        setState(() {
          _isStartTrip = true;
          Preferences.setStartTrip = true;
          Preferences.setHourTripStart = data.start_time;
          Preferences.setTripPaymentId = data.trip_payment_id;
          Preferences.setTripId = data.trip_id;
          changeText(data.start_time);
          _cronometroView= 0;
          getSecondDiferenceHour(data.start_time);
        });

      }

      var dialog = AlertMessageError(icon: icon, message: data.response);

      showDialog(
          context: context,
          builder: (BuildContext context) {
            Future.delayed(Duration(seconds: 3), () {
              Navigator.of(context).pop(true);
            });
            return dialog;
          });
    });
  }

  _tripEnd() async {

    setState(() {
      _isLoading = true ;
    });

    _tripEndBloc.driver_id = Preferences.getDriverId;
    _tripEndBloc.trip_id = Preferences.getTripId.toString();

    _tripEndBloc.TripEnd();

    _tripEndBloc.data.listen((data) {

      setState(() {
        _isLoading = false ;
      });

      String icon = data.error == 1 ? 'success' : 'error';

      if (data.error == 1) {
        setState(() {
          _isStartTrip = false;
          textButton = 'trip_state_button_syn_start_trip'.tr();
          stateBtn = 1;
          Preferences.setStartTrip = false;
          Preferences.setHourTripStart = '';
          //_stopWatchTimer.onExecute.add(StopWatchExecute.reset);
        });

      }

      var dialog = AlertMessageError(icon: icon, message: data.response);

      showDialog(
          context: context,
          builder: (BuildContext context) {
            Future.delayed(Duration(seconds: 3), () {
              Navigator.of(context).pop(true);
            });
            return dialog;
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        body: Stack(
          children: [

            if(_isStartTrip)
              Positioned(
                left: 15,
                top: 50,
                child: TextAnimatedLiveWidget(),
              ),

            Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 90.h),


                    SizedBox(height: 50.h,),

                    Center(
                      child: GestureDetector(
                        onTap: (){
                          _tripMethod();
                        },
                        child: _isLoading ? Container(
                          padding: EdgeInsets.only(top: 100.h),
                          alignment: Alignment.topLeft,
                            width: 250.r,
                            height: 250.r,
                            child: ActivityIndicator()
                          ) : Container(
                          width: 250.r,
                          height: 250.r,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  textButton,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: StyleGeneral.WHITE,
                                    fontSize: ScreenUtil().setSp(25),
                                    fontFamily: 'Poppins-Semi',
                                  )
                                )
                              ]
                            )
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: StyleGeneral.GREEN,
                          )
                        )
                      )
                    ),

                    SizedBox(height: 50.h),

                    _isStartTrip ? Column(
                      children: [
                        Center(
                          child: Text(
                            'trip_state_text_syn_start_trip'.tr() + ": "+DateFormat('h:mm a').format(DateTime.parse(hour)),
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            maxLines: 2,
                            style: TextStyle(
                              color: StyleGeneral.BLACK,
                              fontSize: ScreenUtil().setSp(14),
                              fontFamily: 'Poppins-Semi',
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h),

                         _cronometroView == 0 ?

                           Center(
                              child: StreamBuilder<int>(
                                stream: _stopWatchTimerStart.rawTime,
                                initialData: _stopWatchTimerStart.rawTime.value,
                                builder: (context, snap) {
                                  final value = snap.data;
                                  final displayTime =
                                  StopWatchTimer.getDisplayTime(value!, hours: false , milliSecond: false);
                                  return Text(
                                      'trip_state_text_time_trip'.tr() + " "+displayTime,
                                      style: TextStyle(
                                          fontSize: ScreenUtil().setSp(14),
                                          color: StyleGeneral.BLACK,
                                          fontFamily: 'Poppins-Semi'
                                      )
                                  );
                                },
                              )
                          ) :

                          Center(
                              child: StreamBuilder<int>(
                                stream: _stopWatchTimer.rawTime,
                                initialData: _stopWatchTimer.rawTime.value,
                                builder: (context, snap) {
                                  final value = snap.data;
                                  final displayTime =
                                  StopWatchTimer.getDisplayTime(value!, hours: false , milliSecond: false);
                                  return Text(
                                      'trip_state_text_time_trip'.tr() + " "+displayTime,
                                      style: TextStyle(
                                          fontSize: ScreenUtil().setSp(14),
                                          color: StyleGeneral.BLACK,
                                          fontFamily: 'Poppins-Semi'
                                      )
                                  );
                                }
                              )
                          )

                      ]
                    ) : Container(),

                  ]
                )
              )
            )
          ]
        )
      )
    );
  }
}

