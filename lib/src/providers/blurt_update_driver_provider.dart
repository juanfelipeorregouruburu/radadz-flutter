import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:radadz_app/src/utils/export.dart';

class BlurtUpdateDriverProvider {

  Future<BlurtResponseModel> UpdateBlurtDriver(String driver_id, String blurt_id) async {
    var url = Uri.parse(API.UPDT_BLURT_DRIVER);

    final response = await http.post(url, body: {
      "driver_id": driver_id,
      "blurt_id": blurt_id
    });

    if(response.statusCode == 200) {
      return BlurtResponseModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    }else{
      throw Exception("Fallo al petición");
    }
  }

}