import 'package:flutter/material.dart';
import 'package:radadz_app/src/slider/navigation.dart';
import 'package:radadz_app/src/utils/export.dart';

class PaymentsPage extends StatefulWidget with NavigationStates{
  const PaymentsPage({Key key}) : super(key: key);

  @override
  _PaymentsPageState createState() => _PaymentsPageState();
}

class _PaymentsPageState extends State<PaymentsPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 40.h,
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 2,
                              child: GestureDetector(
                                onTap: (){
                                  showDatePicker(
                                    context: context,
                                    initialDate: DateTime(2022),
                                    firstDate: DateTime(2001),
                                    lastDate: DateTime(2025),
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 0),
                                  height: 55.h,
                                  width: double.infinity,
                                  decoration: decoration,
                                  child: Center(
                                    child: Text('2021-07-01',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: StyleGeneral.GREY_LIGTH,
                                        fontSize: ScreenUtil().setSp(17),
                                        fontFamily: 'Poppins-Regular',
                                      ),),
                                  ) ,
                                ),
                              ),
                            ),


                            Flexible(
                              flex: 2,
                              child: Container(
                                margin: EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 0),
                                height: 55.h,
                                width: double.infinity,
                                decoration: decoration,
                                child: Center(
                                  child: Text('2021-07-10',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: StyleGeneral.GREY_LIGTH,
                                      fontSize: ScreenUtil().setSp(17),
                                      fontFamily: 'Poppins-Regular',
                                    ),),
                                ) ,
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 5.h,),
                        GestureDetector(
                          onTap: (){
                            //prefs.clearPreferences();
                            //   Navigator.pushReplacementNamed(context, 'login');
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w , vertical: 10.h),
                            child: Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              margin: EdgeInsets.symmetric(horizontal: 50.w , vertical: 10.h),
                              height:55.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100.w),
                                color: StyleGeneral.GREEN,
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: Text( 'Buscar' , style: StyleGeneral.styleTextButtonCustom),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
              ),

              Flexible(
                flex: 5,
                fit: FlexFit.loose,
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, 'detailPayment');
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(25.w, 20.h, 25.w, 20.h),
                    width: 400,
                    decoration: decoration,
                    child: Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 1,
                            fit: FlexFit.loose,
                            child: Text(
                              'Fecha de pago:  25 marzo 2022',
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
                              'Total de viajes 8',
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
                              'Total dinero pagado : COP 236.000',
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
                              'Total tokens pagados : 835',
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
                              'Pago realizado al a cuenta de ahorros: 2153481212',
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              maxLines: 2,
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
                              'Bancolombia a nombre de Joaquin Camilo Perez',
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                              maxLines: 2,
                              style: TextStyle(
                                color: StyleGeneral.BLACK,
                                fontSize:
                                ScreenUtil().setSp(15),
                                fontFamily: 'Poppins-Semi',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      )
    );
  }
}
