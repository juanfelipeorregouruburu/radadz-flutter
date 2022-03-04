import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:radadz_app/src/utils/export.dart';

class InputCustom extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Function validator;
  final FocusNode focusNode;
  final Function onFieldSubmitted;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final TextEditingController controller;

  const InputCustom({
    Key key,
    this.hintText,
    this.obscureText  = false,
    this.onFieldSubmitted,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    @required this.focusNode,
    @required this.validator,
    @required this.controller,
  }) : super(key: key);

  static OutlineInputBorder borderinput = OutlineInputBorder(
    borderRadius: BorderRadius.circular(15.0),
    borderSide: BorderSide(color: Colors.green),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.left,
      obscureText: this.obscureText,
      keyboardType:this.keyboardType ,
      textCapitalization: TextCapitalization.words,
      textInputAction: textInputAction,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 14.0, bottom: 12.h, top: 12.h),
        filled: true,
        fillColor: StyleGeneral.GREY,
        hintText: hintText,
        enabledBorder: borderinput,
        border: borderinput,
        focusedBorder: borderinput,
      ),
      style: new TextStyle(
        color: StyleGeneral.BLACK,
        fontSize: ScreenUtil().setSp(15),
        fontFamily: "Poppins-Regular",
      ),
      validator: validator,
    );
  }
}

class InputTextfield extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final Function validator;
  final FocusNode focusNode;
  final Function onFieldSubmitted;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final TextEditingController controller;

  const InputTextfield({
      Key key ,
      this.hintText,
      this.obscureText  = false,
      this.onFieldSubmitted,
      this.textInputAction = TextInputAction.next,
      this.keyboardType = TextInputType.text,
      @required this.focusNode,
      @required this.validator,
      @required this.controller,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.left,
      obscureText: this.obscureText,
      keyboardType:this.keyboardType ,
      textCapitalization: TextCapitalization.words,
      textInputAction: textInputAction,
      focusNode: focusNode,
      decoration: InputDecoration(
        labelText: hintText,
        fillColor: Colors.transparent,
        filled: true,
        hintText: "ema@gmail.com",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              color: Colors.white,
            )),
      ),
      style: new TextStyle(
        color: StyleGeneral.BLACK,
        fontSize: ScreenUtil().setSp(15.sp),
        fontFamily: "Poppins-Regular",
      ),
      validator: validator,
    );
  }
}
