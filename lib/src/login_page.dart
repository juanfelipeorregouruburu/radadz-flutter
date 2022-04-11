import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';
import 'package:flutter/gestures.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final prefs = new Preferences();
  bool _isLoading = false;
  SignInBloc _signInBloc;

  OutlineInputBorder borderinput = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: BorderSide(color: Colors.white),
  );

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
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          backgroundColor: StyleGeneral.BLACK_DARK,
          body: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: (){
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width,
                      child: Image (image: AssetImage('assets/logo_radaz_transparente.png'))
                    ),

                    Form(
                      key: formState,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'login_hello'.tr(),
                                style: TextStyle(color: StyleGeneral.WHITE, letterSpacing: .5 , fontSize: ScreenUtil().setSp(18), fontFamily: 'Poppins-Bold'),
                                textAlign: TextAlign.center,
                              ),

                            Text(
                              'login_info'.tr(),
                              style: TextStyle(color: StyleGeneral.WHITE, letterSpacing: .5 , fontSize: ScreenUtil().setSp(13), fontFamily: 'Poppins-Ligth'),
                              textAlign: TextAlign.center,
                            ),

                            SizedBox(
                              height: 20.h,
                            ),

                            SizedBox(
                              height: size.height / 10,
                              child: InputCustom(
                                focusNode: _phoneFocus,
                                controller: _inputPhoneController,
                                keyboardType: TextInputType.phone,
                                obscureText: false,
                                hintText: 'enter_phone'.tr(),
                                onFieldSubmitted: (term) {
                                  _fieldFocusChange(context, _phoneFocus, _passwordFocus);
                                },
                                validator: (value) {
                                  if (value.isEmpty) return 'required_field'.tr();
                                  return null;
                                },
                              ),
                            ),

                            SizedBox(height: 10.h,),

                            SizedBox(
                              height: size.height / 10,
                              child: CustomInputTextfieldPassword(
                                focusNode: _passwordFocus,
                                controller: _inputPasswordController,
                                keyboardType: TextInputType.text ,
                                textInputAction: TextInputAction.done,
                                obscureText: !_passwordVisible,
                                hintText:  'enter_password'.tr(),
                                validator:  (value) {
                                  if (value.isEmpty) return 'required_field'.tr();
                                  return null;
                                },
                                onPressed: (){
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                            ),


                            SizedBox(
                              height: 30.h,
                            ),

                            _isLoading ? ActivityIndicator(color: Colors.white, size: 50.w) : CustomButton(
                              text: 'login_button'.tr(),
                              fullscreen: true,
                              onTap: (){
                                _signIn();
                              },
                            ),

                            SizedBox(
                              height: 15.h,
                            ),

                            Container(
                            margin: EdgeInsets.fromLTRB(10.h, 20.w, 10.w, 20.h),
                            child: Center(
                              child: Text.rich(
                                        TextSpan(
                                            children: [
                                              TextSpan(
                                                  text: "no_register".tr(),
                                                  style: TextStyle(
                                                      color: StyleGeneral.WHITE,
                                                      letterSpacing: .5,
                                                      fontSize: ScreenUtil().setSp(14),
                                                      fontFamily: 'Poppins-Medium')
                                              ),
                                              TextSpan(
                                                  text: "text_create_account".tr(),
                                                  recognizer: TapGestureRecognizer()
                                                    ..onTap = () {
                                                      Navigator.pushNamed(context, "intro");
                                                    },
                                                  style: TextStyle(
                                                      color: StyleGeneral.WHITE,
                                                      fontSize: ScreenUtil().setSp(16),
                                                      fontFamily: 'Poppins-Bold')
                                              )
                                          ]
                                  )
                                ),
                              )
                            )

                          ],
                        ),
                      ),
                    )

                  ],
                ),
              ),
            ),
          ),
        ),
      )
    );

  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  _signIn() async {

    if (formState.currentState.validate()) {

      setState(() {
        _isLoading = true;
      });

      _signInBloc.phone = _inputPhoneController.text.trim();;
     _signInBloc.password = _inputPasswordController.text.trim();
      _signInBloc.SingIn();

      _signInBloc.data.listen((data) {

        if (data.error == 1) {
          prefs.setAuth = true;
          prefs.setToken = data.token;
          prefs.setDriverId = data.driver_id;
          Navigator.pushReplacementNamed(context, "home");
        } else {
          prefs.setAuth = false;
          setState(() {
            _isLoading = false;
          });

          var dialog = AlertMessageError(
              icon: "error",
              message: data.response
          );

          showDialog(
              context: context,
              builder: (BuildContext context) {
                Future.delayed(Duration(seconds: 3), () {
                  Navigator.of(context).pop(true);
                });
                return dialog;
              }
          );
        }
      });
    }

  }
}
