import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:radadz_app/src/utils/export.dart';

class BlurtListDriverProvider {

  Future<BlurtListModel> BlurtListDriver(String driver_id) async {
    var url = Uri.parse(API.GET_BLURT_LIST_DRIVER_ID);

    final response = await http.post(url, body: {
      "driver_id": driver_id
    });

    if(response.statusCode == 200) {
    return BlurtListModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    }else{
      throw Exception("Fallo al petición");
    }
  }

}