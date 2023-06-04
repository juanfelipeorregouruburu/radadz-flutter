import 'package:radadz_app/src/utils/export.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:radadz_app/src/slider/menu_item.dart';
import 'dart:convert';
import 'dart:async';

class SliderLayout extends StatefulWidget {
  const SliderLayout({Key? key}) : super(key: key);

  @override
  _SliderLayoutState createState() => _SliderLayoutState();
}

class _SliderLayoutState extends State<SliderLayout> with SingleTickerProviderStateMixin<SliderLayout> {

  final prefs = new Preferences();
  AnimationController? _animationController;
  StreamController<bool>? isSidebarOpenedStreamController;
  Stream<bool>? isSidebarOpenedStream;
  StreamSink<bool>? isSidebarOpenedSink;
  final _animationDuration = const Duration(milliseconds: 100);

  String? nameUser;
  Map<String, dynamic>? _map;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController!.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController!.sink;

    _map = jsonDecode(Preferences.getDriver);
    nameUser =  _map!['first_name'] +" "+_map!['second_name'] ;
  }

  @override
  void dispose() {
    _animationController!.dispose();
    isSidebarOpenedStreamController!.close();
    isSidebarOpenedSink!.close();
    super.dispose();
  }

  onIconPressed() {
    final animationStatus = _animationController!.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedSink!.add(false);
      _animationController!.reverse();
    } else {
      isSidebarOpenedSink!.add(true);
      _animationController!.forward();
    }
  }


  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 5.h,
          bottom: 0,
          left: (isSideBarOpenedAsync.data ?? false) ? 0 : -screenWidth,
          right: (isSideBarOpenedAsync.data ?? false) ? -75.w : screenWidth - 75.w,
          child: Row(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(color: Colors.black),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10.h, 0, 15.h, 5.h),
                        width: 75.h,
                        height: 25.w,
                        alignment: Alignment.center,
                        child: Text(
                          'version'.tr() + " 1.0.21",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: ScreenUtil().setSp(8),
                            fontFamily: 'Poppins-Semi',
                          )
                        )
                      )
                    ),

                    Container(
                      padding: EdgeInsets.only(left: 30.w, right: 10.w, top: 50.w),
                      child: Column(
                        children: [
                          Flexible(
                            flex:2,
                            fit: FlexFit.loose,
                            child: IntrinsicHeight(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 8,
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text('menu_title_top'.tr(), textAlign: TextAlign.left, style: TextStyle(color: StyleGeneral.WHITE, fontSize: ScreenUtil().setSp(25), fontFamily: 'Poppins-Bold'))
                                        ),

                                        SizedBox(height: 5),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Text(nameUser!,
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.left,
                                            maxLines: 2,
                                            style: TextStyle(color: StyleGeneral.WHITE, fontSize: ScreenUtil().setSp(18), fontFamily: 'Poppins-Regular')
                                          )
                                        )
                                      ]
                                    )
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: GestureDetector(
                                      onTap: () {
                                        onIconPressed();
                                      },
                                      child: Container(
                                        width: 50.w,
                                        height: 50.w,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: StyleGeneral.GREEN,
                                        ),
                                        child: Icon(Icons.arrow_forward_ios, color: Colors.white, size: ScreenUtil().setHeight(28))
                                      )
                                    )
                                  )
                                ]
                              )
                            )
                          ),

                          SizedBox(height: 35.h),

                          Flexible(
                            flex: 6,
                            fit: FlexFit.tight,
                            child: SingleChildScrollView(
                              child: Container(
                                child: Column(
                                  children: [
                                    MenuItem(
                                      title:'menu_title_start_trip'.tr(),
                                      icon: AssetImage("assets/menu/icono_marker.png"),
                                      onTap: () {
                                        onIconPressed();
                                        BlocProvider.of<NavigationBloc>(context).emit(TripStartPage());
                                      },
                                      padding: 16.w,
                                    ),

                                    SizedBox(height: 15.h),
                                    MenuItem(
                                      title: 'menu_title_history_trip'.tr(),
                                      icon: AssetImage("assets/menu/icono_terminos_politica.png"),
                                      onTap: () {
                                        onIconPressed();
                                        BlocProvider.of<NavigationBloc>(context).emit(TripHistoryPage());
                                      },
                                      padding: 16.w,
                                    ),

                                    SizedBox(height: 15.h),
                                    MenuItem(
                                      title: 'menu_title_history_payment'.tr(),
                                      icon: AssetImage("assets/menu/icono_tipo_pago.png"),
                                      onTap: () {
                                        onIconPressed();
                                        BlocProvider.of<NavigationBloc>(context).emit(PaymentHistoryPage());
                                      },
                                      padding: 16.w,
                                    ),

                                    SizedBox(height: 15.h),
                                    MenuItem(
                                      title: 'menu_title_bank_data'.tr(),
                                      icon: AssetImage("assets/menu/icono_home.png"),
                                      onTap: () {
                                        onIconPressed();
                                        BlocProvider.of<NavigationBloc>(context).emit(BankDataPage());
                                      },
                                      padding: 16.w,
                                    ),

                                    SizedBox(height: 15.h),
                                    MenuItem(
                                      title: 'menu_title_profile_data'.tr(),
                                      icon: AssetImage("assets/menu/icono_usuario.png"),
                                      onTap: () {
                                        onIconPressed();
                                        BlocProvider.of<NavigationBloc>(context).emit(ProfilePage());
                                      },
                                      padding: 16.w,
                                    ),

                                    SizedBox(height: 15.h),
                                    MenuItem(
                                      title: 'menu_title_blurts'.tr(),
                                      icon: AssetImage("assets/menu/icono_terminos_politica.png"),
                                      onTap: () {
                                        onIconPressed();
                                        BlocProvider.of<NavigationBloc>(context).emit(BlurtPage());
                                      },
                                      padding: 16.w,
                                    ),
                                    SizedBox(height: 25.h),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Image(image: AssetImage("assets/menu/icono_cerra.png"))
                                        ),
                                        Expanded(
                                          flex: 8,
                                          child: GestureDetector(
                                            onTap: (){
                                              prefs.clearPreferences();
                                              Navigator.pushReplacementNamed(context, 'login');
                                            },
                                            child: Padding(
                                              padding: EdgeInsets.only(left: 10.w),
                                              child: Text('menu_title_log_out'.tr(), textAlign: TextAlign.left, style: TextStyle(fontSize: ScreenUtil().setSp(18), fontFamily: 'Poppins-Semi', color: Colors.white))
                                            )
                                          )
                                        )
                                      ]
                                    )
                                  ]
                                )
                              )
                            )
                          )
                        ]
                      )
                    )
                  ]
                )
              ),

              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  child: Container(
                    width: 75.w,
                    height: 110.h,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: Image(height: 50.h, width: 50.h, color: StyleGeneral.GREEN, image: AssetImage("assets/menu/icono_menu.png"))
                  )
                )
              )
            ]
          )
        );
      }
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}