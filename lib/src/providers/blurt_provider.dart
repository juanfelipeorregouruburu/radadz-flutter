import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:radadz_app/src/utils/export.dart';

class BlurtProvider {

  /* CreateBlurtDriver */
  Future<BlurtResponseModel> CreateBlurtDriver(String driver_id, String message) async {
    var url = Uri.parse(API.blurtCreate );

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

  /* BlurtListAll */
  Future<BlurtListModel> BlurtListAll() async {
    var url = Uri.parse(API.blurtListAll);

    final response = await http.get(url);

    if(response.statusCode == 200) {
      return BlurtListModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    }else{
      throw Exception("Fallo al petición");
    }
  }

  /* UpdateBlurtDriver */
  Future<BlurtResponseModel> UpdateBlurtDriver(String driver_id, String blurt_id) async {
    var url = Uri.parse(API.blurtEnable);

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

  /* BlurtListDriver */
  Future<BlurtListModel> BlurtListDriver(String driver_id) async {
    var url = Uri.parse(API.blurtListDriverId);

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