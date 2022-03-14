import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';
import 'package:radadz_app/src/utils/theme_helper.dart';
import 'package:radadz_app/src/widgets/header_widget.dart';

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
  final GlobalKey<FormState> _key = GlobalKey();

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

  double _headerHeight = 250;
  Key _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
          backgroundColor: StyleGeneral.BLACK,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    child: Image (image: AssetImage('assets/background.png')),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),

                  Form(
                    key: _key,
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

                          InputCustom(
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

                          SizedBox(
                            height: 30.h,
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
                              hintText:  'enter_password'.tr(),
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
                              if (value.isEmpty) return 'required_field'.tr();
                              return null;
                            },
                          ),

                          SizedBox(
                            height: 40.h,
                          ),

                          _isLoading ? ActivityIndicator() : CustomButton(
                            text: 'login_button'.tr(),
                            fullscreen: true,
                            onTap: (){
                              _signIn();
                            },
                          ),

                          SizedBox(
                            height: 15.h,
                          ),

                          GestureDetector(
                            onTap: () =>  Navigator.pushNamed(context, "intro"),
                            child: Center(
                              child: Text(
                                "no_register".tr(),
                                style: TextStyle(fontSize: ScreenUtil().setSp(15),fontFamily: 'Poppins-Bold', color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
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
      )
    );

  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  _signIn() async {

    // if (formState.currentState.validate()) {

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
          showError(data.response);
        }
      });
    //}

  }
}
