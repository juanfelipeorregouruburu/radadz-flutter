import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';


class AlertMessageError extends StatelessWidget {
  final Color? bgColor;
  final String? icon;
  final String? message;
  final double? circularBorderRadius;

  const AlertMessageError({
    this.icon,
    this.message,
    this.circularBorderRadius = 15.0,
    this.bgColor = Colors.black87,
  }) :  assert(bgColor != null),
        assert(circularBorderRadius != null);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: icon != null ? Image(image: AssetImage(icon == "success" ? "assets/icono_success.png" :  "assets/icono_warning.png") , color: Colors.white, height: 70.h, width: 70.w, ) : null,
      content: message != null ? Text( message! , textAlign: TextAlign.center, style: StyleGeneral.styleTextAlert) : null,
      backgroundColor: bgColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(circularBorderRadius!)
      ),
    );
  }
}