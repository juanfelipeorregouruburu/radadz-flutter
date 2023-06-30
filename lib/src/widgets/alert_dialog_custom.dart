import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';

class CustomAlertDialog extends StatelessWidget {
  final Color? bgColor;
  final String? title;
  final String? message;
  final String? positiveBtnText;
  final String? negativeBtnText;
  final GestureTapCallback? onPositivePressed;
  final GestureTapCallback? onNegativePressed;
  final double circularBorderRadius;

  CustomAlertDialog({
    this.title,
    this.message,
    this.circularBorderRadius = 15.0,
    this.bgColor = Colors.white,
    this.positiveBtnText,
    this.negativeBtnText,
    this.onPositivePressed,
    this.onNegativePressed,
  })  : assert(bgColor != null),
        assert(circularBorderRadius != null);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title != null ? Text(title!) : null,
      content: message != null ? Text(message!) : null,
      backgroundColor: bgColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(circularBorderRadius)),
      actions: <Widget>[

        Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            InkWell(
              child: Container(
                alignment: Alignment.center,
                width: 80.w,
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(negativeBtnText!, style: TextStyle(color: Colors.white),
                )
              ),
              onTap: () {
                Navigator.of(context).pop();
                onNegativePressed!();
              }
            ) ,
            SizedBox(width: 10.w),
            InkWell(
              child: Container(
                alignment: Alignment.center,
                width: 80.w,
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Text(positiveBtnText!, style: TextStyle(color: Colors.white),
                )
              ),
              onTap: () {
                Navigator.of(context).pop();
                if (onPositivePressed != null) {
                  onPositivePressed!();
                }
              }
            )
          ]
        )
      ]
    );
  }
}

class CustomAlertBlurtDialog extends StatelessWidget {
  final Color? bgColor;

  final String? message;
  final String? positiveBtnText;
  final GestureTapCallback? onPositivePressed;
  final double circularBorderRadius;

  CustomAlertBlurtDialog({
    this.message,
    this.circularBorderRadius = 15.0,
    this.bgColor = Colors.white,
    this.positiveBtnText,
    this.onPositivePressed,
  })  : assert(bgColor != null),
        assert(circularBorderRadius != null);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          alignment: Alignment.topRight,
          child: Icon(Icons.close , size: 24)
        )
      ),
      content: message != null ? Text(message! , style: TextStyle(color: StyleGeneral.BLACK, letterSpacing: .5, fontSize: ScreenUtil().setSp(14), fontFamily: 'Poppins-Regular')) : null,
      backgroundColor: bgColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(circularBorderRadius)),
      actions: <Widget>[

      ]
    );
  }
}

class CustomTimerDialog extends StatefulWidget {
  final String message;
  const CustomTimerDialog({Key? key , required this.message}) : super(key: key);

  @override
  State<CustomTimerDialog> createState() => _CustomTimerDialogState();
}

class _CustomTimerDialogState extends State<CustomTimerDialog> with SingleTickerProviderStateMixin<CustomTimerDialog>{
  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countDown,
  );

  AnimationController? controller;

  @override
  void initState() {
    super.initState();
    _stopWatchTimer.setPresetSecondTime(60);
    _stopWatchTimer.onStartTimer();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 60),
    )..addListener(() {
      setState(() {});
    });
    controller!.repeat();

    _stopWatchTimer.fetchEnded.listen((value) {
      if(value){
       Navigator.of(context).pop();
       controller!.dispose();
      }
    });

  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: AlertDialog(
        backgroundColor: Colors.white,
        insetPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 120.h),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
        content: Builder(
          builder: (context) {

            return Stack(
              alignment: Alignment.center,
              children: [

                Positioned(
                  top: 0,
                  child: Column(
                    children: [
                      Text('tab_blurt_time_down_text'.tr(), style: StyleGeneral.styleTextTitleMenuHeader),
                      SizedBox(height: 10.h),
                      Text(widget.message, maxLines: 2, overflow: TextOverflow.ellipsis, softWrap: true,  style: StyleGeneral.styleTextTextCardPaymentDescription),
                    ]
                  )
                ),

                SizedBox(
                  width: 200.h,
                  height: 200.h,
                  child: CircularProgressIndicator(
                    value: controller!.value,
                    backgroundColor: Colors.grey.shade300,
                    strokeWidth: 6.w,
                  )
                ),

                Center(
                  child: StreamBuilder<int>(
                    stream: _stopWatchTimer.rawTime,
                    initialData: _stopWatchTimer.rawTime.value,
                    builder: (context, snap) {
                      final value = snap.data;
                      final displayTime = StopWatchTimer.getDisplayTime(value!, hours: false , milliSecond: false);
                      return Text(
                        displayTime,
                        style: TextStyle(fontSize: ScreenUtil().setSp(64), color: StyleGeneral.BLACK, fontFamily: 'Roboto-Black')
                      );
                    }
                  )
                )
              ]
            );
          }
        )
      ),
    );
  }
}
