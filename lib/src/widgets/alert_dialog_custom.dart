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
