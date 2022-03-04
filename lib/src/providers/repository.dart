import 'dart:math';

import 'package:radadz_app/src/providers/save_driver_provider.dart';
import 'package:radadz_app/src/utils/export.dart';

class Repository {

  final loginProvider = LoginProvider();
  final saveDriverProvider = SaveDriverProvider();

  /* SignIn */
  Future<SingninModel> sign_in(String phone, String password ) => loginProvider.SignIn(phone , password);

  /* SaveDriver */
  Future<ResponseModel> save_driver(String name_first , String name_second, String lastNameFirst , String lastNameSecond,
                                    String document_type , String document_number, String email , String phone,
                                    String password, String address, String date_birth , String licence_number ,
                                    String vehicule_type, String vehicule_year, String driving_daily_routine ) =>
      saveDriverProvider.SaveDriver(name_first, name_second, lastNameFirst , lastNameSecond , document_type, document_number,
                                    email, phone , password, address , date_birth,  licence_number , vehicule_type,
                                    vehicule_year , driving_daily_routine);


}