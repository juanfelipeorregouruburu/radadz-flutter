import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:radadz_app/src/utils/export.dart';

class UpdateDataBankProvider {

  Future<ResponseModel> UpdateDataBankDriver(String driver_id, String data_bank, String account_number ,  String account_type) async {
    var url = Uri.parse(API.UPDT_DATE_BANK );

    final response = await http.post(url, body: {
      "id_driver": driver_id,
      "bank_name": data_bank,
      "accoun_number": account_number,
      "account_type": account_type,
    });

    if(response.statusCode == 200) {
      return ResponseModel.fromJson(json.decode(response.body));
    }else{
      throw Exception("Fallo al petición");
    }
  }

}