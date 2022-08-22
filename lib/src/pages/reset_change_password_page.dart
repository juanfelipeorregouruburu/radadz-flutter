import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';

class ResetChangePasswordPage extends StatefulWidget {
  const ResetChangePasswordPage({Key key}) : super(key: key);

  @override
  State<ResetChangePasswordPage> createState() => _ResetChangePasswordPageState();
}

class _ResetChangePasswordPageState extends State<ResetChangePasswordPage> {

  final ResetChangePasswordBloc _changePasswordBloc = ResetChangePasswordBloc();
  final prefs = new Preferences();
  final GlobalKey<FormState> formState = new GlobalKey<FormState>();
  bool isLoading = false;
  bool stateButton = false;
  bool colorButton = false;

  /* Editext */
  final FocusNode passwordFocus = FocusNode();
  final FocusNode passwordConfirmFocus = FocusNode();
  final TextEditingController _inputPasswordController = TextEditingController();
  final TextEditingController _inputPasswordConfirmController = TextEditingController();

  bool _passwordVisible = false;
  bool _passwordVisibleVerify = false;
  bool isValidate = false;

  @override
  void dispose() {
    super.dispose();
    _inputPasswordController.dispose();
    _inputPasswordConfirmController.dispose();
  }

  changePassword(){
    setState(() {
      isLoading = true;
    });

    _changePasswordBloc.code = prefs.getCodeVerification;
    _changePasswordBloc.password = _inputPasswordController.text.trim();
    _changePasswordBloc.setResetChangePassword();

    _changePasswordBloc.data.listen((data){
      setState(() {
        isLoading = false;
      });

      if(data.error == 1){
        Navigator.pushReplacementNamed(context, "login");
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: StyleGeneral.BLACK_DARK,
        appBar: AppBar(
          backgroundColor: StyleGeneral.BLACK,
          leading: IconButton(
            icon: Icon(StyleGeneral.iconBackAppBar, color: StyleGeneral.WHITE),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text("toolbar_change_password_code".tr(), style: StyleGeneral.styleTextToolbar),
          centerTitle: true,
        ),
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
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(
                         'change_password_text_description'.tr(),
                         style: TextStyle(color: StyleGeneral.WHITE,  fontSize: ScreenUtil().setSp(13), fontFamily: 'Poppins-Ligth'),
                         textAlign: TextAlign.center,
                       ),

                       SizedBox(
                         height: 20.h,
                       ),

                       phoneTextField(),

                       phoneConfirmTextField(),

                       SizedBox(height: 30.h),

                       isLoading ? ActivityIndicator(color: Colors.white, size: 50.w) : CustomButton(
                         text: 'change_password_button'.tr(),
                         fullscreen: true,
                         onTap: (){

                         },
                       ),

                    ]
                   )
                 )
                ]
              )
            )
          )
        )
      ),
    );
  }

  _fieldFocusChange(BuildContext context, FocusNode currentFocus,
      FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  Widget phoneTextField() {

    return CustomInputTextfieldPassword(
      focusNode: passwordFocus,
      controller: _inputPasswordController,
      keyboardType: TextInputType.text ,
      textInputAction: TextInputAction.next,
      obscureText: !_passwordVisible,
      hintText:  'enter_password'.tr(),
      colorFill: StyleGeneral.GREY,
      onFieldSubmitted: (term) {
        _fieldFocusChange(context, passwordFocus, passwordConfirmFocus);
      },
      validator:  (value) {
        if (value.isEmpty) return 'required_field'.tr();
        return null;
      },
      onPressed: (){
        setState(() {
          _passwordVisible = !_passwordVisible;
        });
      },
    );
  }

  Widget phoneConfirmTextField() {

    return CustomInputTextfieldPassword(
      focusNode: passwordConfirmFocus,
      controller: _inputPasswordConfirmController,
      keyboardType: TextInputType.text ,
      textInputAction: TextInputAction.done,
      obscureText: !_passwordVisibleVerify,
      hintText:  'enter_password'.tr(),
      colorFill: StyleGeneral.GREY,
      validator:  (value) {
        if (value.isEmpty) return 'required_field'.tr();
        return null;
      },
      onPressed: (){
        setState(() {
          _passwordVisibleVerify = !_passwordVisible;
        });
      },
    );
  }
}




