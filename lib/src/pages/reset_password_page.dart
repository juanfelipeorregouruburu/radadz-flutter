import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final ResetPasswordBloc _resetPasswordBloc = ResetPasswordBloc();
  bool isLoading = false;
  bool stateButton = false;
  bool colorButton = false;

  /* Editext */
  TextEditingController _inputPhoneController = new TextEditingController();
  final FocusNode _phoneFocus = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _inputPhoneController.dispose();
  }

  sendCode(){
    setState(() {
      isLoading = true;
    });

    _resetPasswordBloc.phone = _inputPhoneController.text.trim();
    _resetPasswordBloc.setResetPassword();

    _resetPasswordBloc.data.listen((data){
      setState(() {
        isLoading = false;
      });

      if(data.error == 1){
        Navigator.pushNamed(context, "reset_verify_code");
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
          title: Text("toolbar_reset_password".tr(), style: StyleGeneral.styleTextToolbar),
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
                   key: _key,
                   autovalidateMode: AutovalidateMode.onUserInteraction,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text(
                         'reset_password_text'.tr(),
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

                           },
                           validator: (value) {
                             if (value.isEmpty) return 'required_field'.tr();
                             return null;
                           }
                         )
                       ),

                       SizedBox(
                         height: 30.h,
                       ),

                       isLoading ? ActivityIndicator(color: Colors.white, size: 50.w) : CustomButton(
                         text: 'reset_button'.tr(),
                         fullscreen: true,
                         onTap: (){
                           if(_key.currentState.validate()){
                             sendCode();
                           }
                         }
                       )
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
}
