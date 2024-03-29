import 'dart:async';
import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';
import 'package:radadz_app/src/utils/get_second.dart';

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

  bool _visible = true;
  late Timer _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tripStartBloc = TripStartBloc();
    _tripEndBloc = TripEndBloc();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _visible = !_visible;
      });
    });

    verifyStateTrip();
  }

  verifyStateTrip(){
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
    _timer.cancel();
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

      final snackBar = customSnackBar(data.error == 1 ? 'success' : 'error' , data.response , data.error == 1 ? ContentType.success : ContentType.failure );
      ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(snackBar);

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

      if (data.error == 1) {
        setState(() {
          _isStartTrip = false;
          textButton = 'trip_state_button_syn_start_trip'.tr();
          stateBtn = 1;
          Preferences.setStartTrip = false;
          Preferences.setHourTripStart = '';
        });

      }

      final snackBar = customSnackBar(data.error == 1 ? 'success' : 'error' , data.response , data.error == 1 ? ContentType.success : ContentType.failure );
      ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(snackBar);

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
                          ) : AnimatedOpacity(
                             // opacity: _visible ? 1.0 : 0.0,
                              opacity: _isStartTrip ? _visible ? 1.0 : 0.0 : 1,
                              duration: const Duration(milliseconds: 1500),
                              child: Container(
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
                          ),
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

