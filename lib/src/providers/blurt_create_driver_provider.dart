import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:radadz_app/src/utils/export.dart';

class BlurtCreateDriverProvider {

  Future<BlurtResponseModel> CreateBlurtDriver(String driver_id, String message) async {
    var url = Uri.parse(API.SET_BLURT_DRIVER );

    final response = await http.post(url, body: {
      "driver_id": driver_id,
      "message": message
    });

    if(response.statusCode == 200) {
      return BlurtResponseModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    }else{
      throw Exception("Fallo al petición");
    }
  }

}