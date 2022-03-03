import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';

class SplashScreen extends StatefulWidget {
  final bool autenticado;
  const SplashScreen({Key key , this.autenticado}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{

  var route = "";
  @override
  void initState() {

    print(widget.autenticado);

    if(!widget.autenticado){
      route = "home";
    }else if(!widget.autenticado){
      route = "login";
    }
    print('route: '+route);

    super.initState();
    Timer(Duration(seconds: 4), () => Navigator.pushReplacementNamed(context, route));
  }


  @override
  Widget build(BuildContext context) {

    final AnimationController _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);
    final Animation<double> _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    @override
    void dispose() {
      _controller.dispose();
      super.dispose();
    }


    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                color: StyleGeneral.BLACK_DARK
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            child: FadeTransition(
              opacity: _animation,
              child: const Padding(
                padding: EdgeInsets.all(8),
                child: Image(image: AssetImage('assets/logo_tipo.png')),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(50),
                    child: Container(),
                  )),
              Expanded(flex: 4, child: Container()),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Theme.of(context).platform == TargetPlatform.android
                                ? Container(
                                child: Center(
                                    child: CircularProgressIndicator(
                                      valueColor:
                                      new AlwaysStoppedAnimation<Color>(
                                          Colors.white),
                                    )))
                                : Container(
                                child: Center(
                                    child: CupertinoActivityIndicator())),
                          ]),
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}