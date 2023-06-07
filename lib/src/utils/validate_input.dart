import 'package:flutter/material.dart';

fieldFocusChange(BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}

bool validateEmail(String? value) {
  bool emailValid = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$').hasMatch(value!);
  return emailValid;
}

bool validateText(String? value) {
  bool textValidate = RegExp(r"^[\p{L} ,.'-]*$", caseSensitive: false, unicode: true, dotAll: true).hasMatch(value!);
  return textValidate;
}

bool validatePassword(String? value) {
  bool textValidate = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$%+_&*~]).{8,32}$').hasMatch(value!);
  return textValidate;
}

bool validateNumber(String? value) {
  bool dateValidate = RegExp(r'^[0-9]+$').hasMatch(value!);
  return dateValidate;
}

bool validateAccountBankNumber(String? value) {
  bool dateValidate = RegExp(r'^[0-9]{9,20}$').hasMatch(value!);
  return dateValidate;
}

bool validateHour(String? value) {
  bool dateValidate = RegExp(r'^[0-9]+([.][0-9]+)?$').hasMatch(value!);
  return dateValidate;
}

bool validateDate(String? value) {
  bool dateValidate = RegExp(r'^\d{4}\-(0?[1-9]|1[012])\-(0?[1-9]|[12][0-9]|3[01])$').hasMatch(value!);
  return dateValidate;
}