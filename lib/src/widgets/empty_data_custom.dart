import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';

class EmptyDataView extends StatelessWidget {

  final String message;
  const EmptyDataView({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final img_text = Container(
      width: ScreenUtil().setWidth(360),
      height:ScreenUtil().setHeight(150),
      child: Image (image: AssetImage('assets/icono_cerrar.png'), color: StyleGeneral.BLACK , fit: BoxFit.cover ),
    );

    return Padding(
        padding: EdgeInsets.all(30.r),
      child: Column(
        children: [
          img_text ,
          Text(
            message,
            style: TextStyle(
                color: StyleGeneral.BLACK,
                letterSpacing: .5,
                fontSize: ScreenUtil().setSp(18),
                fontFamily: 'Poppins-Semi'),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
