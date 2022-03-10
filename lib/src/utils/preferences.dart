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

  get getDriverId {
    return _preferences.getString('driver_id') ?? false;
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




}