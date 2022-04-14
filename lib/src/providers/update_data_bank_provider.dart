import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:radadz_app/src/utils/export.dart';

class UpdateDataBankProvider {
  final pref = Preferences();
  Future<updateDataBankModel> UpdateDataBankDriver(String driver_id, String data_bank, String account_number ,  String account_type) async {
    var url = Uri.parse(API.UPDT_DATE_BANK );

    String token = await pref.getToken;
    final response = await http.post(url,
      headers: {
        HttpHeaders.authorizationHeader: "token $token"
      }, body: {
      "id_driver": driver_id,
      "bank_name": data_bank,
      "accoun_number": account_number,
      "account_type": account_type,
    });

    if(response.statusCode == 200) {
      return updateDataBankModel.fromJson(json.decode(response.body));
    }else{
      throw Exception("Fallo al petición");
    }
  }

}