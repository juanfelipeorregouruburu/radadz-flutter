import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:radadz_app/src/utils/export.dart';

class TripProvider {

  final pref = Preferences();
  /* TripStart */
  Future<TripStartModel> TripStart(String driver_id, String trip_payment_id) async {
    var url = Uri.parse(API.setTripStart);

    String token = await pref.getToken;
    final response = await http.post(url,
        headers: {
          HttpHeaders.authorizationHeader: "token $token"
        },
        body: {
          "driver": driver_id,
          "trip_payment": trip_payment_id == "0" ? "" : trip_payment_id
        }
    );


    if(response.statusCode == 200) {
      return TripStartModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    }else{
      throw Exception("Fallo al petición");
    }
  }

  /* TripEnd */
  Future<TripEndModel> TripEnd(String driver_id , String trip_id ) async {
    var url = Uri.parse(API.setTripEnd);

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

    if(response.statusCode == 200) {
      return TripEndModel.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
    }else{
      throw Exception("Fallo al petición");
    }
  }

  /* listTripHistoryDriver */
  Future<TripHistoryModel> listTripHistoryDriver(String driver_id, String start_time, String end_date) async {
    var url = Uri.parse(API.getListTripHistoryDriver );

    String token = await pref.getToken;
    final response = await http.post(url,headers: {
      HttpHeaders.authorizationHeader: "token $token"
    }, body: {
      "driver_id": driver_id,
      "start_time": start_time,
      "end_date": end_date
    });

    if(response.statusCode == 200) {
      return TripHistoryModel.fromJson(json.decode(response.body));
    }else{
      throw Exception("Fall al petition");
    }
  }

}
