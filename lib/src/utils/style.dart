import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StyleGeneral {

  static final Map<int, Color> colors =
  {
    50:Color.fromRGBO(136,14,79, .1),
    100:Color.fromRGBO(136,14,79, .2),
    200:Color.fromRGBO(136,14,79, .3),
    300:Color.fromRGBO(136,14,79, .4),
    400:Color.fromRGBO(136,14,79, .5),
    500:Color.fromRGBO(136,14,79, .6),
    600:Color.fromRGBO(136,14,79, .7),
    700:Color.fromRGBO(136,14,79, .8),
    800:Color.fromRGBO(136,14,79, .9),
    900:Color.fromRGBO(136,14,79, 1),
  };
  //Color
  static final Color BLACK = Color(0xFF303030);
  static final Color BLACK_DARK = Color(0xFF191919);
  static final Color WHITE = Colors.white;
  static final Color RED = Color(0xFFB20B32);
  static final Color YELLOW = Color(0xFFFFD200);
  static final Color ORANGE = Color(0xFFFF8B00);
  static final Color GREEN = Color(0xFF2C7245);

  static final Color GREEN_LIGTH_50 = Color(0xFF96d68e);
  static final Color GREEN_LIGTH_25 = Color(0xFFbce3b7);
  static final Color BLUE = Color(0xFF1977F2);
  static final Color BLACK_LIGTH = Color(0xFF303030);
  static final Color BLACK_LIGTH_50 = Color(0xFF707070);
  static final Color BLACK_LIGTH_75 = Color(0xFF939393);
  static final Color BLACK_LIGTH_25 = Color(0xFFE0DEDE);
  static final Color GREY_LIGTH = Color(0xFF939393);
  static final Color GREY = Color(0xFFF8F8F8);
  static final Color RED_LIGTH = Color(0xFF9F0000);


  static final styleTextTitlePage = TextStyle(
      color: StyleGeneral.BLACK,
      letterSpacing: .5,
      fontSize: ScreenUtil().setSp(20),
      fontFamily: 'Poppins-Semi');
  static final styleTextTitleComfirmar = TextStyle(
      color: StyleGeneral.BLACK,
      letterSpacing: .5,
      fontSize: ScreenUtil().setSp(15),
      fontFamily: 'Poppins-Semi');
  static final styleTextDescription = TextStyle(
      color: StyleGeneral.BLACK,
      letterSpacing: .5,
      fontSize: ScreenUtil().setSp(17),
      fontFamily: 'Poppins-Semi');
  static final styleTextButtonRedes = TextStyle(
      color: StyleGeneral.WHITE,
      fontSize: ScreenUtil().setSp(13),
      fontFamily: 'Poppins-Medium');
  static final styleTextButtonCustom = TextStyle(
      color: StyleGeneral.WHITE,
      fontSize: ScreenUtil().setSp(15),
      fontFamily: 'Poppins-Semi');
  static final styleTextSubtitle = TextStyle(
      color: StyleGeneral.BLACK,
      letterSpacing: .5,
      fontSize: ScreenUtil().setSp(15),
      fontFamily: 'Poppins-Semi');
  //PADDING
  static final double FONT_SIZE_TITLE_DETAIL = ScreenUtil().setSp(5);

  static final styleTextTitle = TextStyle(color: StyleGeneral.BLACK, fontSize: ScreenUtil().setSp(18), fontFamily: 'Poppins-Bold');
  static final styleTextTitleMenuHeader = TextStyle(color: StyleGeneral.BLACK, letterSpacing: .5 , fontSize: ScreenUtil().setSp(17), fontFamily: 'Poppins-Semi');
  static final styleTextTitleMenu = TextStyle(color: StyleGeneral.WHITE, letterSpacing: .5 , fontSize: ScreenUtil().setSp(17), fontFamily: 'Poppins-Semi');
  static final styleTextTitleTerminos = TextStyle(color: StyleGeneral.WHITE, letterSpacing: .5 , fontSize: ScreenUtil().setSp(17), fontFamily: 'Poppins-Semi');

}

void statusBarLight(){
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.white, // this one for android
      statusBarBrightness: Brightness.light// this one for iOS
  ));
}

void statusBarDark(){
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.black, // this one for android
      statusBarBrightness: Brightness.dark// this one for iOS
  ));
}