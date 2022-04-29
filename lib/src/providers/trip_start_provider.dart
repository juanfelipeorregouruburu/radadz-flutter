import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:radadz_app/src/utils/export.dart';

class TripStartProvider {

  final pref = Preferences();
  Future<TripStartModel> TripStart(String driver_id) async {
    var url = Uri.parse(API.SET_TRIP_START);
    print(url);
    String token = await pref.getToken;
    final response = await http.post(url,
        headers: {
          HttpHeaders.authorizationHeader: "token $token"
        },
        body: {
          "driver": driver_id,
        }
      );
      print(response.body);

      if(response.statusCode == 200) {
        return TripStartModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      }else{
        throw Exception("Fallo al petición");
      }
  }

}