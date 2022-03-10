import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:radadz_app/src/utils/export.dart';

class DocumentTypeProvider {

  Future<DocumentTypeModel> DocumentsTypes() async {
    var url = Uri.parse(API.GET_TYPE_DOCUMENTS );

    final response = await http.get(url);

    if(response.statusCode == 200) {
      return DocumentTypeModel.fromJson(json.decode(response.body));
    }else{
      throw Exception("Fallo al petición");
    }
  }

}