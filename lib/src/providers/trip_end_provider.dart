import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:radadz_app/src/utils/export.dart';

class TripEndProvider {

  final pref = Preferences();
  Future<TripEndModel> TripEnd(String driver_id , String trip_id ) async {
    var url = Uri.parse(API.SET_TRIP_END);
    print(url);
    String token = await pref.getToken;
    final response = await http.post(url,
        headers: {
          HttpHeaders.authorizationHeader: "token $token"
        },
        body: {
          "driver_id": driver_id,
          "trip_id": trip_id
        }
      );
      print(response.body);

      if(response.statusCode == 200) {
        return TripEndModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      }else{
        throw Exception("Fallo al petición");
      }
  }

}