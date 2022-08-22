import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:radadz_app/src/utils/export.dart';

class LoginProvider {

  Future<SingninModel> SignIn(String phone, String password) async {
    var url = Uri.parse(API.login );
    final response = await http.post(url, body: {
      "username": phone,
      "password": password,
    });

    if(response.statusCode == 200) {
      return SingninModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    }else{
      throw Exception("Fallo al petición");
    }
  }

}