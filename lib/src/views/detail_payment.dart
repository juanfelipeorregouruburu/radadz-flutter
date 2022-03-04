import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';

class DetailPaymentPage extends StatelessWidget {
  const DetailPaymentPage({Key key}) : super(key: key);

  static BoxDecoration decoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
        bottomLeft: Radius.circular(10),
        bottomRight: Radius.circular(10)
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.3),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: Container(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40.h,
              ),
              Center(
                child: Text(
                  'Detalle pagos ',
                  style: StyleGeneral.styleTextTitle,
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                decoration: decoration,
                width: 400.w,
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: Text(
                        'Hora inicio: 08:23 AM',
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 1,
                        style: TextStyle(
                          color: StyleGeneral.BLACK,
                          fontSize:
                          ScreenUtil().setSp(15),
                          fontFamily: 'Poppins-Semi',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),

                    Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: Text(
                        'Hora finalización: 07:45 PM',
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 1,
                        style: TextStyle(
                          color: StyleGeneral.BLACK,
                          fontSize:
                          ScreenUtil().setSp(15),
                          fontFamily: 'Poppins-Semi',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),

                    Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: Text(
                        'total tokens ganados: 25',
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 1,
                        style: TextStyle(
                          color: StyleGeneral.BLACK,
                          fontSize:
                          ScreenUtil().setSp(15),
                          fontFamily: 'Poppins-Semi',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),

                    Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: Text(
                        'total dinero ganado: COP 125.000',
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 1,
                        style: TextStyle(
                          color: StyleGeneral.BLACK,
                          fontSize:
                          ScreenUtil().setSp(15),
                          fontFamily: 'Poppins-Semi',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),


                  ],
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                decoration: decoration,
                width: 400.w,
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: Text(
                        'Hora inicio: 08:23 AM',
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 1,
                        style: TextStyle(
                          color: StyleGeneral.BLACK,
                          fontSize:
                          ScreenUtil().setSp(15),
                          fontFamily: 'Poppins-Semi',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),

                    Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: Text(
                        'Hora finalización: 07:45 PM',
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 1,
                        style: TextStyle(
                          color: StyleGeneral.BLACK,
                          fontSize:
                          ScreenUtil().setSp(15),
                          fontFamily: 'Poppins-Semi',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),

                    Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: Text(
                        'total tokens ganados: 25',
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 1,
                        style: TextStyle(
                          color: StyleGeneral.BLACK,
                          fontSize:
                          ScreenUtil().setSp(15),
                          fontFamily: 'Poppins-Semi',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),

                    Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: Text(
                        'total dinero ganado: COP 125.000',
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 1,
                        style: TextStyle(
                          color: StyleGeneral.BLACK,
                          fontSize:
                          ScreenUtil().setSp(15),
                          fontFamily: 'Poppins-Semi',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
