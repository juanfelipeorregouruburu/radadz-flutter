import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:radadz_app/src/utils/export.dart';

class DriverProvider {

  final pref = Preferences();

  Future<DriverModel> getDriver(String driverId ) async {
    print("driverId $driverId");

    var url = Uri.parse(API.getDriver );

    String token = await Preferences.getToken;
    print("token $token");
    final response = await http.post(url,
        headers: {
          HttpHeaders.authorizationHeader: "token $token"
        }, body: {
          "driver_id": driverId
        });

    if(response.statusCode == 200) {
      return DriverModel.fromJson(json.decode(response.body));
    }else{
      throw Exception("Fallo al petición");
    }
  }


  Future<SaveDriverModel> SaveDriver(String nameFirst , String nameSecond, String lastNameFirst, String lastNameSecond,
      String documentType, String documentNumber, String email ,  String phone, String password, String address, String birthDate ,
      String licencePlateNumber , String vehicleType, String vehicleYear, String drivingDailyRoutine , String vehicleModel , String vehicleManufacturer ,
      String vehicleColor , String isOwner, String ownerVehicleName, String ownerIdNumber ,  String expirationDateSOAT , String expirationDateDriverLicence ,
      String expirationDateTechnicalMechanical ) async {

    var url = Uri.parse(API.driverCreate );
    DateTime date = DateTime.now();

    final response = await http.post(url, body: {
      "first_name": nameFirst,
      "second_name": nameSecond,
      "first_lastname": lastNameFirst,
      "second_lastname": lastNameSecond,
      "document_type": documentType,
      "document_number": documentNumber,
      "email": email,
      "phone": phone,
      "address": address,
      "birth_date": birthDate,
      "license_plate_number": licencePlateNumber,
      "vehicle_type" : vehicleType,
      "vehicle_year": vehicleYear,
      "driving_daily_routine": drivingDailyRoutine,
      "registration_date": DateFormat("yyyy-MM-dd").format(date),
      "staff_approval_date":"yes",
      "driver_password":password,
      "vehicle_model" : vehicleModel,
      "vehicle_manufacturer" : vehicleManufacturer ,
      "vehicle_color" : vehicleColor,
      "is_owner" : isOwner ,
      "owner_vehicle_name" : ownerVehicleName,
      "owner_id_number" : ownerIdNumber,
      "expiration_date_of_the_technical_mechanical_review" : expirationDateTechnicalMechanical,
      "soat_expiration_date" : expirationDateSOAT,
      "expiration_date_drivers_license" : expirationDateDriverLicence
    });

    print(response.body);

    if(response.statusCode == 200) {
      return SaveDriverModel.fromJson(json.decode(response.body));
    }else{
      throw Exception("Fallo al petición");
    }
  }

  /* UpdateDriver */
  Future<UpdateDriverModel> UpdateDriver(String driverId ,String nameFirst , String nameSecond, String lastNameFirst, String lastNameSecond,
      String documentType, String documentNumber, String email , String address, String birthDate ,
      String licencePlateNumber , String vehicleType, String vehicleYear, String driving_daily_routine , String vehicleModel , String vehicleManufacturer ,
      String vehicleColor , String isOwner, String ownerVehicleName, String ownerIdNumber ,  String expirationDateSOAT , String expirationDateDriverLicence ,
      String expirationDateTechnicalMechanical  ) async {

    var url = Uri.parse(API.driverUpdate);

    String token = await Preferences.getToken;
    final response = await http.post(url,headers: {
      HttpHeaders.authorizationHeader: "token $token"
    }, body: {
      "id": driverId,
      "first_name": nameFirst,
      "second_name": nameSecond,
      "first_lastname": lastNameFirst,
      "second_lastname": lastNameSecond,
      "document_type": documentType,
      "document_number": documentNumber,
      "email": email,
      "address": address,
      "birth_date": birthDate,
      "license_plate_number": licencePlateNumber,
      "vehicle_type" : vehicleType,
      "vehicle_year": vehicleYear,
      "driving_daily_routine": driving_daily_routine,
      "staff_approval_date":"yes",
      "vehicle_model" : vehicleModel,
      "vehicle_manufacturer" : vehicleManufacturer ,
      "vehicle_color" : vehicleColor,
      "is_owner" : isOwner ,
      "owner_vehicle_name" : ownerVehicleName,
      "owner_id_number" : ownerIdNumber,
      "expiration_date_of_the_technical_mechanical_review" : expirationDateTechnicalMechanical,
      "soat_expiration_date" : expirationDateSOAT,
      "expiration_date_drivers_license" : expirationDateDriverLicence
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

    String token = Preferences.getToken;
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

}
