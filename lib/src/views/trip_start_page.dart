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
                  SizedBox(height: 80.h,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 5,
                        fit: FlexFit.tight,
                        child: Text(
                          "Material publicitario descargado.",
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
                            color: StyleGeneral.GREEN,
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
                          "Pantalla RadAdz Sincrozinada.",
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
                            color: StyleGeneral.GREEN,
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
                          "Viaje iniciado.",
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
                            color: StyleGeneral.GREEN,
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

                  SizedBox(height: 100.h,),

                  Center(
                    child: Container(
                      width: 280,
                      height: 280,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                "Terminar viaje",
                                overflow: TextOverflow.ellipsis,
                                softWrap: true,
                                maxLines: 2,
                                style: TextStyle(
                                  color: StyleGeneral.WHITE,
                                  fontSize: ScreenUtil().setSp(17),
                                  fontFamily: 'Poppins-Regular',
                                ),
                              ),
                            ),
                            SizedBox(height: 20.h,),
                            Center(
                              child: Text(
                                "Viaje iniciado : 4:46 AM",
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
                                "tiempo transcurrido : 3:32 m",
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
                        )
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: StyleGeneral.GREEN,
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

