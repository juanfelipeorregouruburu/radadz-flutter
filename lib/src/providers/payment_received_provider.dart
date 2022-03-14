import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:radadz_app/src/utils/export.dart';

class ListPaymentRecivedDriverProvider {

  Future<PaymentRecivedModel> ListPaymentReceivedDriver(String driver_id, String start_time, String end_date) async {
    var url = Uri.parse(API.GET_LIST_PAYMENT_RECEIVED_DRIVER );

    final response = await http.post(url, body: {
      "driver_id": driver_id,
      "start_time": start_time,
      "end_date": end_date,
    });

    if(response.statusCode == 200) {
      return PaymentRecivedModel.fromJson(json.decode(response.body));
    }else{
      throw Exception("Fallo al petición");
    }
  }

}