import 'package:radadz_app/src/utils/export.dart';

class Repository {

  final loginProvider = LoginProvider();
  final saveDriverProvider = SaveDriverProvider();
  final documentsTypeProvider = DocumentTypeProvider();
  final banksTypeProvider = BankTypeProvider();
  final vehiclesTypeProvider = VehicleTypeProvider();
  final listDriverProvider = ListDriverProvider();
  final listPaymentReceivedDriverProvider = ListPaymentRecivedDriverProvider();
  final updateDataBankProvider = UpdateDataBankProvider();
  final updateDriverProvider = UpdateDriverProvider();



  /* DocumentType*/
  Future<DocumentTypeModel> documents_type( ) => documentsTypeProvider.DocumentsTypes();

  /* VehicleType*/
  Future<VehicleTypeModel> vehicles_type( ) => vehiclesTypeProvider.VehiclesType();

  /* BanktType*/
  Future<BankTypeModel> banks_type( ) => banksTypeProvider.BanksTypes();

  /* SignIn */
  Future<SingninModel> sign_in(String phone, String password ) => loginProvider.SignIn(phone , password);

  /* SaveDriver */
  Future<SaveDriverModel> save_driver(String name_first , String name_second, String lastNameFirst , String lastNameSecond,
                                    String document_type , String document_number, String email , String phone,
                                    String password, String address, String date_birth , String licence_number ,
                                    String vehicule_type, String vehicule_year, String driving_daily_routine ) =>
      saveDriverProvider.SaveDriver(name_first, name_second, lastNameFirst , lastNameSecond , document_type, document_number,
                                    email, phone , password, address , date_birth,  licence_number , vehicule_type, vehicule_year , driving_daily_routine);

  /* ListDriver */
  Future<ListDriverModel> list_driver_id(String driver_id) => listDriverProvider.ListDriverId(driver_id);

  /* ListPaymentReceivedDriver */
  Future<PaymentRecivedModel> list_payment_received_driver( String driver_id, String start_time, String end_date) =>
                      listPaymentReceivedDriverProvider.ListPaymentReceivedDriver(driver_id,start_time,end_date);

  /* UpdateDataBank */
  Future<ResponseModel> update_data_bank_driver(String driver_id, String data_bank, String account_number ,  String account_type) =>
      updateDataBankProvider.UpdateDataBankDriver(driver_id,data_bank,account_number,account_type);

  /* UpdateDriver*/
  Future<UpdateDriverModel> update_driver(String driver_id, String name_first , String name_second, String lastNameFirst , String lastNameSecond,
                                    String document_type , String document_number, String email , String phone, String address, String date_birth , String licence_number ,
                                    String vehicule_type, String vehicule_year, String driving_daily_routine ) =>
      updateDriverProvider.UpdateDriver(driver_id, name_first, name_second, lastNameFirst , lastNameSecond , document_type, document_number,
                                    email, phone , address , date_birth,  licence_number , vehicule_type, vehicule_year , driving_daily_routine);

}