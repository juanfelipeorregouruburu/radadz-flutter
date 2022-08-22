import 'dart:convert';
import 'package:radadz_app/src/utils/export.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {

  static Preferences _instance = new Preferences._internal();

  factory Preferences() {
    return _instance;
  }

  Preferences._internal();

  SharedPreferences _preferences;

  initPreferences() async{
    this._preferences = await SharedPreferences.getInstance();
  }

  // GETTER && SETTER
  get getAuth {
    return _preferences.getBool('Auth') ?? false;
  }

  set setAuth( bool value ) {
    _preferences.setBool('Auth', value);
  }

  get getIntro {
    return _preferences.getBool('intro') ?? false;
  }

  set setIntro( bool value ) {
    _preferences.setBool('intro', value);
  }

  get getStartTrip {
    return _preferences.getBool('start_trip') ?? false;
  }

  set setStartTrip( bool value ) {
    _preferences.setBool('start_trip', value);
  }

  get getTripId {
    return _preferences.getInt('trip_id') ?? 0;
  }

  set setTripId( int trip_id ) {
    _preferences.setInt('trip_id', trip_id);
  }

  get getHourTripStart {
    return _preferences.getString('start_trip_hour') ?? '';
  }

  set setHourTripStart( String hour ) {
    _preferences.setString('start_trip_hour', hour);
  }

  get getCodeVerification {
    return _preferences.getString('code_verification') ?? '';
  }

  set setCodeVerification( String code ) {
    _preferences.setString('code_verification', code);
  }

  get getTripPaymentId {
    return _preferences.getInt('trip_payment_id') ?? 0;
  }

  set setTripPaymentId( int trip_payment_id ) {
    _preferences.setInt('trip_payment_id', trip_payment_id);
  }

  get getDriverId {
    return _preferences.getString('driver_id') ?? '';
  }

  set setDriverId( String driver_id ) {
    _preferences.setString('driver_id', driver_id);
  }

  set setToken(String token){
    _preferences.setString('token', token);
  }

  get getToken {
    return _preferences.getString('token') ?? '';
  }

  set setDriver(Driver driver){
    _preferences.setString("driver", json.encode(driver));
  }

  getDriver() {
    return _preferences.getString("driver");
  }

  void clearPreferences(){
    setAuth = false;
    setTripId = 0;
    setTripPaymentId = 0;
    setStartTrip = false;
    setHourTripStart = '';
    setDriverId = '';
  }


}