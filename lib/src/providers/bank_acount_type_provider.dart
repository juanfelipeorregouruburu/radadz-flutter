import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:radadz_app/src/utils/export.dart';

class BankAcountTypeProvider {

  Future<BankAcountTypeModel> BankAccountTypes() async {
    var url = Uri.parse(API.GET_BANK_ACCOUNT_TYPE );

    final response = await http.get(url);

    if(response.statusCode == 200) {
      return BankAcountTypeModel.fromJson(json.decode(response.body));
    }else{
      throw Exception("Fallo al petición");
    }
  }

}