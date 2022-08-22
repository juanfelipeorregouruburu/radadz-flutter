import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:radadz_app/src/utils/export.dart';

class DriverProvider {

  final pref = Preferences();

  Future<SaveDriverModel> SaveDriver(String name_first, String name_second, String lastName_first, String lastName_second,
      String document_type, String document_number, String email ,  String phone,
      String password, String address, String date_birth , String licence_number ,
      String vehicule_type, String vehicule_year, String driving_daily_routine ) async {

    var url = Uri.parse(API.driverCreate );

    final response = await http.post(url, body: {
      "first_name": name_first,
      "second_name": name_second,
      "first_lastname": lastName_first,
      "second_lastname": lastName_second,
      "document_type": document_type,
      "document_number": document_number,
      "email": email,
      "driver_password": password,
      "phone": phone,
      "address": address,
      "birth_date": date_birth,
      "license_plate_number": licence_number,
      "vehicle_type": vehicule_type,
      "vehicle_year": vehicule_year,
      "driving_daily_routine": driving_daily_routine,
      "staff_approval_date":"yes"
    });

    if(response.statusCode == 200) {
      return SaveDriverModel.fromJson(json.decode(response.body));
    }else{
      throw Exception("Fallo al petición");
    }
  }

  /* UpdateDriver */
  Future<UpdateDriverModel> UpdateDriver(String driver_id , String name_first, String name_second, String lastName_first, String lastName_second,
      String document_type, String document_number, String email ,  String phone,
      String address, String date_birth , String licence_number ,
      String vehicule_type, String vehicule_year, String driving_daily_routine ) async {

    var url = Uri.parse(API.driverUpdate);

    String token = await pref.getToken;
    final response = await http.post(url,headers: {
      HttpHeaders.authorizationHeader: "token $token"
    }, body: {
      "id": driver_id,
      "first_name": name_first,
      "second_name": name_second,
      "first_lastname": lastName_first,
      "second_lastname": lastName_second,
      "document_type": document_type,
      "document_number": document_number,
      "email": email,
      "phone": phone,
      "address": address,
      "birth_date": date_birth,
      "license_plate_number": licence_number,
      "vehicle_type": vehicule_type,
      "vehicle_year": vehicule_year,
      "driving_daily_routine": driving_daily_routine,
      "staff_approval_date":"yes"
    });

    if(response.statusCode == 200) {
      return UpdateDriverModel.fromJson(json.decode(response.body));
    }else{
      throw Exception("Fallo al petición");
    }
  }

  /* UpdateDataBankDriver */
  Future<UpdateDataBankModel> UpdateDataBankDriver(String driver_id, String data_bank, String account_number ,  String account_type) async {
    var url = Uri.parse(API.driverDataBank );

    String token = await pref.getToken;
    final response = await http.post(url,
        headers: {
          HttpHeaders.authorizationHeader: "token $token"
        }, body: {
          "id_driver": driver_id,
          "bank_name": data_bank,
          "accoun_number": account_number,
          "account_type": account_type
        });

    if(response.statusCode == 200) {
      return UpdateDataBankModel.fromJson(json.decode(response.body));
    }else{
      throw Exception("Fallo al petición");
    }
  }

  /* ListPaymentReceivedDriver */
  Future<PaymentRecivedModel> ListPaymentReceivedDriver(String driver_id, String start_time, String end_date) async {
    var url = Uri.parse(API.driverListPaymentReceived );

    String token = await pref.getToken;
    final response = await http.post(url,headers: {
      HttpHeaders.authorizationHeader: "token $token"
    }, body: {
      "driver_id": driver_id,
      "start_time": start_time,
      "end_date": end_date
    });

    if(response.statusCode == 200) {
      return PaymentRecivedModel.fromJson(json.decode(response.body));
    }else{
      throw Exception("Fallo al petición");
    }
  }

}
