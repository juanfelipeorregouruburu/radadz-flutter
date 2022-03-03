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




}