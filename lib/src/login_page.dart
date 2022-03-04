import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final prefs = new Preferences();
  bool _isLoading = false;
  SignInBloc _signInBloc;

  final GlobalKey<FormState> formState = new GlobalKey<FormState>();

  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  TextEditingController _inputPhoneController = new TextEditingController();
  TextEditingController _inputPasswordController = new TextEditingController();

  bool _passwordVisible;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    statusBarDark();
    _signInBloc = new SignInBloc();
    _passwordVisible = false;
  }

  @override
  void dispose() {
    super.dispose();
    _inputPhoneController.dispose();
    _inputPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final img_text = Container(
      width: ScreenUtil().setWidth(360),
      height:ScreenUtil().setHeight(150),
      child: Image (image: AssetImage('assets/background.png')),
    );

    OutlineInputBorder borderinput = OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
      borderSide: BorderSide(color: Colors.white),
    );

    return Scaffold(
      backgroundColor: StyleGeneral.BLACK,
      body: Stack(
        children: [
          Positioned( top: 40.h,    left: 00.0 , child: img_text),
          Column(
            children: [
              Expanded(flex: 2, child: Container()),
              Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Flexible(
                              flex: 1,
                              fit:FlexFit.loose,
                              child: Text(
                                'Hola Conductor',
                                style: TextStyle(color: StyleGeneral.WHITE, letterSpacing: .5 , fontSize: ScreenUtil().setSp(18), fontFamily: 'Poppins-Bold'),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: 5.h,),
                            Flexible(
                              flex: 1,
                              fit:FlexFit.loose,
                              child: Text(
                                'Ingresa tu número de teléfono y contraseña',
                                style: TextStyle(color: StyleGeneral.WHITE, letterSpacing: .5 , fontSize: ScreenUtil().setSp(13), fontFamily: 'Poppins-Ligth'),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              child: SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                padding: EdgeInsets.fromLTRB(30.w, 20.h, 30.w, 10.h),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Form(
                                      key: formState,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          InputCustom(
                                            focusNode: _phoneFocus,
                                            controller: _inputPhoneController,
                                            keyboardType: TextInputType.phone,
                                            obscureText: false,
                                            hintText: 'Ingresa tu teléfono',
                                            onFieldSubmitted: (term) {
                                              _fieldFocusChange(context, _phoneFocus, _passwordFocus);
                                            },
                                            validator: (value) {
                                              if (value.isEmpty) return 'La campo es obligatorio';
                                              return null;
                                            },
                                          ),
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          TextFormField(
                                            controller: _inputPasswordController,
                                            textAlign: TextAlign.left,
                                            obscureText: !_passwordVisible,
                                            keyboardType: TextInputType.text ,
                                            textCapitalization: TextCapitalization.words,
                                            textInputAction: TextInputAction.done,
                                            focusNode: _passwordFocus,
                                            decoration: InputDecoration(
                                              contentPadding: EdgeInsets.only(left: 14.0, bottom: 12.h, top: 12.h),
                                              filled: true,
                                              fillColor: StyleGeneral.GREY,
                                              hintText:  'Ingresa tu contraseña',
                                              enabledBorder: borderinput,
                                              border: borderinput,
                                              focusedBorder: borderinput,
                                              errorStyle: TextStyle(color: Colors.white),
                                              suffixIcon: IconButton(
                                                icon: Icon(
                                                  // Based on passwordVisible state choose the icon
                                                  _passwordVisible
                                                      ? Icons.visibility
                                                      : Icons.visibility_off,
                                                  color: Theme.of(context).primaryColorDark,
                                                ),
                                                onPressed: () {
                                                  // Update the state i.e. toogle the state of passwordVisible variable
                                                  setState(() {
                                                    _passwordVisible = !_passwordVisible;
                                                  });
                                                },
                                              ),
                                            ),
                                            style: new TextStyle(
                                              color: StyleGeneral.BLACK,
                                              fontSize: ScreenUtil().setSp(15),
                                              fontFamily: "Poppins-Regular",
                                            ),
                                            validator:  (value) {
                                              if (value.isEmpty) return 'El campo es obligatorio';
                                              return null;
                                            },
                                          ),

                                          SizedBox(
                                            height: 30.h,
                                          ),
                                          _isLoading ? ActivityIndicator() : CustomButton(
                                            text: 'Ingresar',
                                            fullscreen: true,
                                            onTap: (){
                                              _signIn();
                                            },
                                          ),

                                          SizedBox(
                                            height: 15.h,
                                          ),

                                          GestureDetector(
                                            onTap: () =>  Navigator.pushReplacementNamed(context, "register"),
                                            child: Center(
                                              child: Text(
                                                "¡No estoy registrado!",
                                                style: TextStyle(fontSize: ScreenUtil().setSp(15),fontFamily: 'Poppins-Bold', color: Colors.white),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )

                          ]),
                    ),
                  ))
            ],
          )
        ],
      )
    );
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  _signIn() async {
     Navigator.pushReplacementNamed(context, "home");
    // if (formState.currentState.validate()) {
    //
    //   setState(() {
    //     _isLoading = true;
    //   });
    //
    //   _signInBloc.phone = _inputPhoneController.text.trim();;
    //   _signInBloc.password = _inputPasswordController.text.trim();
    //
    //   _signInBloc.SingIn();
    //
    //   _signInBloc.data.listen((data) {
    //     print(data);
    //    // Navigator.pushReplacementNamed(context, "home");
    //   });
    //
    // }
  }


}
