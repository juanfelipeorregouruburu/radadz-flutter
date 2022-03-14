import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:radadz_app/src/utils/export.dart';

class ListDriverProvider {
  final pref = Preferences();
  Future<ListDriverModel> ListDriverId(String driver_id) async {
    var url = Uri.parse(API.GET_LIST_ID_DRIVER );
    String token = await pref.getToken;
    final response = await http.post(url, headers: {
      HttpHeaders.authorizationHeader: "token $token"
    }, body: {
      "driver_id": driver_id
    });

    if(response.statusCode == 200) {
      return ListDriverModel.fromJson(json.decode(response.body));
    }else{
      throw Exception("Fallo al petición");
    }
  }

}