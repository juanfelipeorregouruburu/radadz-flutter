import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:radadz_app/src/models/payment_detail_model.dart';
import 'package:radadz_app/src/models/payment_model.dart';
import 'package:radadz_app/src/utils/export.dart';

class PaymentProvider {
  
  /* GetPaymentList */
  Future<PaymentModel> getPaymentList(String driverId) async {
    var url = Uri.parse(API.getPaymentList);
    String token = Preferences.getToken;

    final response = await http.post(url,
      headers: {
       HttpHeaders.authorizationHeader: "token $token"
      },body: {
        "driver_id": driverId
      }
    );

    if(response.statusCode == 200) {
      return PaymentModel.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    }else{
      throw Exception("Fallo al petición");
    }
  }

  /* GetPaymentList */
  Future<PaymentDetailModel> getPaymentDetail(String tripPaymentId) async {
    var url = Uri.parse(API.getPaymentDetail );
    String token = Preferences.getToken;

    final response = await http.post(url , headers: {
       HttpHeaders.authorizationHeader: "token $token"
      }, body: {
        "trip_payment_id": tripPaymentId
      }
    );

    if(response.statusCode == 200) {
      return PaymentDetailModel.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    }else{
      throw Exception("Fallo al petición");
    }
  }
}