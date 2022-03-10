import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:radadz_app/src/utils/export.dart';

class LoginProvider {

  Future<SingninModel> SignIn(String phone, String password) async {
    var url = Uri.parse(API.SET_LOGIN );
    final response = await http.post(url, body: {
      "username": phone,
      "password": password,
    });
    print(response.body);
    if(response.statusCode == 200) {
      return SingninModel.fromJson(json.decode(response.body));
    }else{
      throw Exception("Fallo al petición");
    }
  }

}