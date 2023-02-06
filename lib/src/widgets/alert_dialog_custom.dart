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

        TextButton(
          child: Text(negativeBtnText!),
          style: TextButton.styleFrom(
            primary: Colors.redAccent,
          ),
          onPressed: () {
            Navigator.of(context).pop();
            onNegativePressed!();
          }
        ) ,
        TextButton(
          child: Text(positiveBtnText!),
            style: TextButton.styleFrom(
              primary: Colors.teal,
            ),
          onPressed: () {
            Navigator.of(context).pop();
            if (onPositivePressed != null) {
              onPositivePressed!();
            }
          }
        )

      ]
    );
  }
}



class CustomAlertBlurtDialog extends StatelessWidget {
  final Color? bgColor;
  final String? title;
  final String? message;
  final String? positiveBtnText;
  final GestureTapCallback? onPositivePressed;
  final double circularBorderRadius;

  CustomAlertBlurtDialog({
    this.title,
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
        title: title != null ? Text(title! , style: TextStyle(
            color: StyleGeneral.BLACK,
            letterSpacing: .5,
            fontSize: ScreenUtil().setSp(18),
            fontFamily: 'Poppins-Semi')) : null,
        content: message != null ? Text(message! ,  style: TextStyle(
            color: StyleGeneral.BLACK,
            letterSpacing: .5,
            fontSize: ScreenUtil().setSp(14),
            fontFamily: 'Poppins-Regular')
        ) : null,
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(circularBorderRadius)),
        actions: <Widget>[

          TextButton(
              child: Text(positiveBtnText!),
              style: TextButton.styleFrom(
                primary: Colors.teal,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                if (onPositivePressed != null) {
                  onPositivePressed!();
                }
              }
          )

        ]
    );
  }
}
