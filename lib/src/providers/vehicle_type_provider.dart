import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:radadz_app/src/utils/export.dart';

class VehicleTypeProvider {

  Future<VehicleTypeModel> VehiclesType() async {
    var url = Uri.parse(API.GET_TYPE_VEHICLE );

    final response = await http.get(url);

    if(response.statusCode == 200) {
      return VehicleTypeModel.fromJson(json.decode(response.body));
    }else{
      throw Exception("Fallo al petición");
    }
  }

}