import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:radadz_app/src/utils/export.dart';

class InputCustom extends StatelessWidget {
  final String? hintText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final FocusNode focusNode;
  final GestureTapCallback? onTap;
  final Function? onFieldSubmitted;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final TextEditingController controller;

  const InputCustom({
    Key? key,
    this.hintText,
    this.obscureText  = false,
    this.onFieldSubmitted,
    this.onTap,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    required this.focusNode,
    required this.validator,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: controller,
      textAlign: TextAlign.left,
      obscureText: this.obscureText,
      keyboardType:this.keyboardType ,
      textCapitalization: TextCapitalization.words,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: (s) {
        onFieldSubmitted!(s);
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: StyleGeneral.GREY,
        hintText: hintText,
        hintStyle: TextStyle(
          color: StyleGeneral.BLACK,
          fontSize: ScreenUtil().setSp(12.sp),
          fontFamily: "Poppins-Regular",
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: const BorderSide(
              color: Colors.white,
            )
        )
      ),
      style: new TextStyle(
        color: StyleGeneral.BLACK,
        fontSize: ScreenUtil().setSp(15),
        fontFamily: "Poppins-Regular",
      ),
      validator: validator
    );
  }
}

class InputTextField extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String? hintText;
  final String? labelText;
  final bool obscureText ;
  final int? maxLength;
  final String? Function(String?)? validator;
  final FocusNode focusNode;
  final Function? onFieldSubmitted;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final TextEditingController controller;

  const InputTextField({
      Key? key ,
      this.hintText,
      this.labelText,
      this.onTap,
      this.obscureText  = false,
      this.maxLength ,
      this.onFieldSubmitted,
      this.textInputAction = TextInputAction.next,
      this.keyboardType = TextInputType.text,
      required this.focusNode,
      required this.validator,
      required this.controller,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      controller: controller,
      textAlign: TextAlign.left,
      obscureText: this.obscureText,
      keyboardType:this.keyboardType ,
      textCapitalization: TextCapitalization.words,
      textInputAction: textInputAction,
      maxLength: maxLength,
      focusNode: focusNode,
      decoration: InputDecoration(
        labelText: labelText,
        fillColor: Colors.transparent,
        filled: true,
        hintText: hintText,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: const BorderSide(
              color: Colors.white,
            )),
      ),
      style: new TextStyle(
        color: StyleGeneral.BLACK,
        fontSize: ScreenUtil().setSp(13.sp),
        fontFamily: "Poppins-Regular",
      ),
      validator: validator
    );
  }
}

class CustomInputTextFieldPassword extends StatelessWidget {
  final GestureTapCallback? onPressed;
  final String? hintText;
  final String? labelText;
  final bool obscureText;
  final Color colorFill;
  final bool passwordVisible;
  final String? Function(String?)? validator;
  final FocusNode focusNode;
  final Function? onFieldSubmitted;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final TextEditingController controller;

  const CustomInputTextFieldPassword({
    Key? key ,
    this.hintText,
    this.labelText,
    this.onPressed,
    this.obscureText  = false,
    this.colorFill  = Colors.transparent,
    this.passwordVisible  = false,
    this.onFieldSubmitted,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    required this.focusNode,
    required this.validator,
    required this.controller,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      textAlign: TextAlign.left,
      textInputAction: textInputAction,
      obscureText: this.obscureText,
      keyboardType:this.keyboardType ,
      cursorColor: StyleGeneral.BLACK,
      textCapitalization: TextCapitalization.words,
      onFieldSubmitted: (s) {
        onFieldSubmitted!(s);
      },
      decoration: InputDecoration(
        labelText: labelText,
        fillColor: colorFill,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
          color: StyleGeneral.BLACK,
          fontSize: ScreenUtil().setSp(12.sp),
          fontFamily: "Poppins-Regular",
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: const BorderSide(
              color: Colors.white,
            )
        ),
        suffixIcon: IconButton(
            icon: Icon(passwordVisible? Icons.visibility: Icons.visibility_off),
            onPressed: onPressed
        ),
      ),
      style: new TextStyle(
        color: StyleGeneral.BLACK,
        fontSize: ScreenUtil().setSp(15),
        fontFamily: "Poppins-Regular",
      ),
      validator: validator
    );
  }
}
