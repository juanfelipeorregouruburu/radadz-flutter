import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';
import 'package:flutter/gestures.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> formState = new GlobalKey<FormState>();

  bool _isLoading = false;
  bool _passwordVisible = false;

  SignInBloc _signInBloc = new SignInBloc();

  TextEditingController _inputPhoneController = new TextEditingController();
  TextEditingController _inputPasswordController = new TextEditingController();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    statusBarDark();
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
                      child: Image (image: AssetImage('assets/loudtv_logo.png'))
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
                              textAlign: TextAlign.center
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
                              child: InputCustom(
                                focusNode: _phoneFocus,
                                controller: _inputPhoneController,
                                keyboardType: TextInputType.phone,
                                obscureText: false,
                                hintText: 'enter_phone'.tr(),
                                onFieldSubmitted: (term) {
                                  fieldFocusChange(context, _phoneFocus, _passwordFocus);
                                },
                                validator: (String? value) {
                                  if (value!.isEmpty) return 'required_field'.tr();
                                  return null;
                                }
                              )
                            ),

                            SizedBox(height: 10.h,),

                            SizedBox(

                              child: CustomInputTextFieldPassword(
                                focusNode: _passwordFocus,
                                controller: _inputPasswordController,
                                keyboardType: TextInputType.text ,
                                textInputAction: TextInputAction.done,
                                obscureText: !_passwordVisible,
                                hintText:  'enter_password'.tr(),
                                colorFill: StyleGeneral.GREY,
                                validator: (String? value) {
                                  if (value!.isEmpty) {
                                    return 'required_field'.tr();
                                  }else if (!validatePassword(value)) {
                                    return 'required_password_validate'.tr();
                                  }

                                  return null;
                                },
                                onPressed: (){
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                }
                              )
                            ),
                            SizedBox(
                              height: 10.h,
                            ),

                            passwordRestoredSection(),

                            SizedBox(
                              height: 30.h,
                            ),

                            _isLoading ? ActivityIndicator(color: Colors.white, size: 50.w) : CustomButton(
                              text: 'login_button'.tr(),
                              fullscreen: true,
                              onTap: (){
                                _signIn();
                              }
                            ),

                            SizedBox(
                              height: 5.h,
                            ),

                            Container(
                            margin: EdgeInsets.fromLTRB(10.h, 20.w, 10.w, 10.h),
                            child: Center(
                              child: Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "no_register".tr(),
                                        style: TextStyle(color: StyleGeneral.WHITE, fontSize: ScreenUtil().setSp(12), fontFamily: 'Poppins-Medium')
                                      ),
                                      TextSpan(
                                        text: "text_create_account".tr(),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.pushNamed(context, "register");
                                          },
                                        style: TextStyle(color: StyleGeneral.WHITE, fontSize: ScreenUtil().setSp(13), fontFamily: 'Poppins-Bold')
                                      )
                                    ]
                                  )
                                )
                              )
                            )
                          ]
                        )
                      )
                    )
                  ]
                )
              )
            )
          )
        )
      )
    );

  }

  Widget passwordRestoredSection() {

    return Container(
      margin: EdgeInsets.only(top: 5.h),
      alignment: Alignment.topRight,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, "reset_password");
        },
        child: Text(
          "login_forgot_password".tr(),
          style:TextStyle(
            color: StyleGeneral.WHITE,
            fontSize: ScreenUtil().setSp(13.sp),
            fontFamily: "Poppins-Regular",
          ),
          textAlign: TextAlign.right,
        )
      )
    );
  }

  _signIn() async {

    if (formState.currentState!.validate()) {

      setState(() {
        _isLoading = true;
      });

      _signInBloc.phone = _inputPhoneController.text.trim();;
     _signInBloc.password = _inputPasswordController.text.trim();
      _signInBloc.SingIn();

      _signInBloc.data.listen((data) {

        setState(() {
          _isLoading = false;
        });

        if (data.error == 1) {
          Preferences.setAuth = true;
          Preferences.setToken = data.token;
          Preferences.setDriverId = data.driver_id;
          Preferences.setDriver = data.driver;

          Navigator.pushReplacementNamed(context, "home");
        } else {
          Preferences.setAuth = false;
          final snackBar = customSnackBar('Error' , data.response, ContentType.failure);
          ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(snackBar);
        }
      });
    }else{
      final snackBar = customSnackBar('Info' , 'register_form_incomplete'.tr() , ContentType.help);
      ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(snackBar);
    }
  }
}
