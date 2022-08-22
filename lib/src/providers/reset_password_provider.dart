import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:radadz_app/src/utils/export.dart';

class ResetPasswordProvider{

  Future<ResponseModel> resetPassword(String phone) async {
    var url = Uri.parse(API.resetPassword);

    final response = await http.post(url, body: {
      "phone": phone
    });

    if(response.statusCode == 200) {
      return ResponseModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception("Fall al petition");
    }
  }


  Future<ResponseModel> resetVerifyCode(String code) async {
    var url = Uri.parse(API.resetVerifyCode);

    final response = await http.post(url, body: {
      "token": code
    });

    print(response.body);
    if(response.statusCode == 200) {
      return ResponseModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception("Fall al petition");
    }
  }


  Future<ResponseModel> resetChangePasswordCode(String code, String password) async {
    var url = Uri.parse(API.resetChangePassword);

    final response = await http.post(url, body: {
      "token": code,
      "password": password
    });

    print(response.body);
    if(response.statusCode == 200) {
      return ResponseModel.fromJson(jsonDecode(response.body));
    }else{
      throw Exception("Fall al petition");
    }
  }

}