import 'dart:async';
import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ResetVerificationCodePage extends StatefulWidget {
  const ResetVerificationCodePage({Key? key}) : super(key: key);

  @override
  State<ResetVerificationCodePage> createState() => _ResetVerificationCodePageState();
}

class _ResetVerificationCodePageState extends State<ResetVerificationCodePage> {

  final ResetVerifyCodeBloc _verifyCodeBloc = ResetVerifyCodeBloc();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool isLoading = false;

  TextEditingController _inputCodeController = new TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _inputCodeController.dispose();
  }

  bool hasError = false;
  String currentText = "";
  bool isValidate = false;
  StreamController<ErrorAnimationType>? errorController;

  verifyCode(){
    setState(() {
      isLoading = true;
    });

    _verifyCodeBloc.code = currentText;
    _verifyCodeBloc.setResetVerifyCode();

    _verifyCodeBloc.data.listen((data){
      setState(() {
        isLoading = false;
      });

      if(data.error == 1){
        Preferences.setCodeVerification = currentText;
        Navigator.pushNamed(context, "reset_change_password");
      }

    });
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: StyleGeneral.BLACK_DARK,
        appBar: AppBar(
          backgroundColor: StyleGeneral.BLACK,
          leading: IconButton(
            icon: Icon(StyleGeneral.iconBackAppBar, color: StyleGeneral.WHITE),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text("toolbar_verify_code".tr(), style: StyleGeneral.styleTextToolbar),
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
                      child: Image (image: AssetImage('assets/loudtv_logo.png'))
                  ),

                 Form(
                   key: _key,
                   autovalidateMode: AutovalidateMode.onUserInteraction,
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Align(
                         alignment: Alignment.center,
                         child: Text(
                           'verify_code_text'.tr(),
                           textAlign: TextAlign.center,
                           style: TextStyle(color: StyleGeneral.WHITE, letterSpacing: .5 , fontSize: ScreenUtil().setSp(13), fontFamily: 'Poppins-Ligth')
                         ),
                       ),

                       SizedBox(
                         height: 30.h,
                       ),

                       PinCodeTextField(
                         appContext: context,
                         backgroundColor: StyleGeneral.BLACK_DARK,
                         errorAnimationController: errorController,
                         controller: _inputCodeController,
                         length: 6,
                         obscureText: false,
                         obscuringCharacter: '*',
                         textStyle:TextStyle(
                           color: StyleGeneral.WHITE,
                           fontWeight: FontWeight.bold,
                         ),
                         pastedTextStyle: TextStyle(
                           color: StyleGeneral.WHITE,
                           fontWeight: FontWeight.bold,
                         ),

                         keyboardType: TextInputType.number,
                         cursorColor: Colors.white,
                         animationDuration: const Duration(milliseconds: 300),
                         onCompleted: (value){
                           isValidate = value.length == 4 ? true : false;
                         },
                         validator: (String? value) {
                           if (value!.length < 6) {
                             return  'verify_validate_code'.tr();
                           } else {
                             return null;
                           }
                         },
                         animationType: AnimationType.fade,
                         onChanged: (value) {
                           setState(() {
                             currentText = value;
                             isValidate = value.length == 6 ? true : false;
                           });
                         }
                     ),


                       SizedBox(
                         height: 100.h,
                       ),

                       isLoading ? ActivityIndicator(color: Colors.white, size: 50.w) : CustomButton(
                         text: 'verify_code_button'.tr(),
                         fullscreen: true,
                         onTap: (){
                           verifyCode();
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
      )
    );
  }
}
