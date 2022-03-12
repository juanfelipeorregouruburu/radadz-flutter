import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:radadz_app/src/utils/export.dart';


class SaveDriverProvider {

  Future<SaveDriverModel> SaveDriver(String name_first, String name_second, String lastName_first, String lastName_second,
                              String document_type, String document_number, String email ,  String phone,
                              String password, String address, String date_birth , String licence_number ,
                              String vehicule_type, String vehicule_year, String driving_daily_routine ) async {

    var url = Uri.parse(API.SET_SAVE_DRIVER );
    print(url);

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

    print(response.body);

    if(response.statusCode == 200) {
      return SaveDriverModel.fromJson(json.decode(response.body));
    }else{
      throw Exception("Fallo al petición");
    }
  }


}