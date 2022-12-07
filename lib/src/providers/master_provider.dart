import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:radadz_app/src/utils/export.dart';

class MasterProvider {

  /* ListPaymentReceivedDriver */
  Future<BankAcountTypeModel> BankAccountTypes() async {
    var url = Uri.parse(API.getAccountBankType );

    final response = await http.get(url);

    if(response.statusCode == 200) {
      return BankAcountTypeModel.fromJson(json.decode(response.body));
    }else{
      throw Exception("Fallo al petición");
    }
  }

  /* ListPaymentReceivedDriver */
  Future<BankListModel> BanksTypes() async {
    var url = Uri.parse(API.bankList );

    final response = await http.get(url);

    if(response.statusCode == 200) {
      return BankListModel.fromJson(json.decode(response.body));
    }else{
      throw Exception("Fallo al petición");
    }
  }

  /* DocumentsTypes */
  Future<DocumentTypeModel> DocumentsTypes() async {
    var url = Uri.parse(API.documentsList );

    final response = await http.get(url);

    if(response.statusCode == 200) {
      return DocumentTypeModel.fromJson(json.decode(response.body));
    }else{
      throw Exception("Fallo al petición");
    }
  }

  /* RoutineDriver */
  Future<RoutineDriverModel> RoutineDrivers() async {
    var url = Uri.parse(API.routineDriverList );

    final response = await http.get(url);

    if(response.statusCode == 200) {
      return RoutineDriverModel.fromJson(json.decode(response.body));
    }else{
      throw Exception("Fallo al petición");
    }
  }

  /* VehiclesType */
  Future<VehicleTypeModel> VehiclesType() async {
    var url = Uri.parse(API.vehiclesList );

    final response = await http.get(url);

    if(response.statusCode == 200) {
      return VehicleTypeModel.fromJson(json.decode(response.body));
    }else{
      throw Exception("Fallo al petición");
    }
  }

  /* VehiclesColor */
  Future<VehicleColorModel> VehiclesColor() async {
    var url = Uri.parse(API.vehiclesColorList );

    final response = await http.get(url);

    if(response.statusCode == 200) {
      return VehicleColorModel.fromJson(json.decode(response.body));
    }else{
      throw Exception("Fallo al petición");
    }
  }


  /* vehicleManufacturerList */
  Future<VehicleManufacturerModel> VehiclesManufacturer() async {
    var url = Uri.parse(API.vehicleManufacturerList );

    final response = await http.get(url);

    if(response.statusCode == 200) {
      return VehicleManufacturerModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    }else{
      throw Exception("Fallo al petición");
    }
  }


  /* vehiclesModelList */
  Future<VehicleModel> vehiclesModel(String manufacturerId) async {
    var url = Uri.parse(API.vehiclesModelList );

    final response = await http.post(url , body: {
      "manufacturer_id": manufacturerId
    });

    if(response.statusCode == 200) {
      return VehicleModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    }else{
      throw Exception("Fallo al petición");
    }
  }

}