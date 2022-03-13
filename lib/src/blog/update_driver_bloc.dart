import 'package:rxdart/rxdart.dart';
import 'package:radadz_app/src/utils/export.dart';

class UpdateDriverBloc {

  final repository = Repository();
  final updateDriver = PublishSubject<UpdateDriverModel>();
  get data => updateDriver.stream;


  String driver_id ;
  String name_first ;
  String name_second ;
  String lastName_first ;
  String lastName_second ;
  String document_type ;
  String document_number ;
  String email ;
  String phone ;
  String address ;
  String date_birth ;
  String licence_number ;
  String vehicule_type ;
  String vehicule_year ;
  String driving_daily_routine ;


  UpdateDriverBloc({this.driver_id, this.name_first, this.name_second, this.lastName_first, this.lastName_second,
    this.document_type, this.document_number, this.email , this.phone, this.address, this.date_birth, this.licence_number, this.vehicule_type,
    this.vehicule_year, this.driving_daily_routine });

  UpdateDriver() async {
    UpdateDriverModel _updateDriver = await repository.update_driver(driver_id,name_first, name_second, lastName_first , lastName_second , document_type, document_number,
        email, phone , address , date_birth,  licence_number , vehicule_type, vehicule_year , driving_daily_routine);
    updateDriver.sink.add(_updateDriver);
  }

  disponse() {
    updateDriver.close();
  }
}