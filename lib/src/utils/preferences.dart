import 'package:shared_preferences/shared_preferences.dart';

class Preferences{

  static late SharedPreferences _preferences;

  static bool _auth = false;
  static bool _intro = false;
  static bool _startTrip = false;
  static int _tripId = 0;
  static int _tripPaymentId = 0;
  static String _HourTripStart = '';
  static String _CodeVerification = '';
  static String _driverId = '';
  static String _token = '';


  static Future init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  /* Auth  */
  static bool get getAuth {
    return _preferences.getBool('auth') ?? _auth;
  }

  static set setAuth( bool auth ) {
    _auth = auth;
    _preferences.setBool('auth', _auth);
  }

  /* Intro  */
  static bool get getIntro  {
    return _preferences.getBool('intro') ?? _intro;
  }

  static set setIntro( bool intro ) {
    _intro = intro;
    _preferences.setBool('intro', _intro);
  }


  /* StartTrip  */
  static bool get getStartTrip   {
    return _preferences.getBool('intro') ?? _startTrip;
  }

  static set setStartTrip( bool value ) {
    _startTrip = value;
    _preferences.setBool('start_trip', _startTrip);
  }

  /* TripId */
  static int get getTripId  {
    return _preferences.getInt('trip_id') ?? _tripId;
  }

  static set setTripId( int tripId ) {
    _tripId = tripId;
    _preferences.setInt('trip_id', _tripId);
  }

  /* HourTrip */
  static String get getHourTripStart {
    return _preferences.getString('start_trip_hour') ?? _HourTripStart;
  }

  static set setHourTripStart( String hour ) {
    _HourTripStart = hour;
    _preferences.setString('start_trip_hour', _HourTripStart);
  }

  /* Code Verification */
  static String get getCodeVerification  {
    return _preferences.getString('code_verification') ?? _CodeVerification;
  }

  static set setCodeVerification( String code ) {
    _CodeVerification = code;
    _preferences.setString('code_verification', _CodeVerification);
  }

  /* TripPaymentId */
  static int get getTripPaymentId   {
    return _preferences.getInt('trip_payment_id') ?? _tripPaymentId;
  }

  static set setTripPaymentId( int tripId ) {
    _tripPaymentId = tripId;
    _preferences.setInt('trip_payment_id', _tripPaymentId);
  }

  /* DriverId */
  static String get getDriverId  {
    return _preferences.getString('driver_id') ?? _driverId;
  }

  static set setDriverId( String driverId ) {
    _driverId = driverId;
    _preferences.setString('driver_id', _driverId);
  }


  /* Token */
  static String get getToken  {
    return _preferences.getString('token') ?? _token;
  }

  static set setToken( String token ) {
    _token = token;
    _preferences.setString('token', _token);
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