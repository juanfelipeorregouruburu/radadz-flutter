import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';

const double SIZE_INDICATOR = 30;

class ActivityIndicator extends StatelessWidget {
  final double size;
  final Color color;
  final double marginTop;

  const ActivityIndicator({
    Key? key,
    this.size = SIZE_INDICATOR,
    this.color = Colors.black,
    this.marginTop = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: marginTop),
      alignment: Alignment.topCenter,
      child: Container(
        width: size,
        height: size,
        alignment: Alignment.topCenter,
        child: Theme.of(context).platform == TargetPlatform.android
            ? CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(this.color),
        )
            : CupertinoActivityIndicator(),
      ),
    );
  }
}