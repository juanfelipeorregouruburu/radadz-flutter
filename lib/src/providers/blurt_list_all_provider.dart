import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:radadz_app/src/utils/export.dart';

class BlurtListAllProvider {

  Future<BlurtListModel> BlurtListAll() async {
    var url = Uri.parse(API.GET_BLURT_LIST_ALL);

    final response = await http.get(url);

    if(response.statusCode == 200) {
      return BlurtListModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    }else{
      throw Exception("Fallo al petición");
    }
  }

}