import 'package:radadz_app/src/utils/export.dart';

class Repository {

  final loginProvider = LoginProvider();
  final saveDriverProvider = SaveDriverProvider();
  final documentsTypeProvider = DocumentTypeProvider();
  final bankListProvider = BankListProvider();
  final bankAccountTypeProvider = BankAcountTypeProvider();
  final vehiclesTypeProvider = VehicleTypeProvider();
  final listPaymentReceivedDriverProvider = ListPaymentRecivedDriverProvider();
  final updateDataBankProvider = UpdateDataBankProvider();
  final updateDriverProvider = UpdateDriverProvider();
  final blurtListAllProvider = BlurtListAllProvider();
  final blurtListDriverProvider = BlurtListDriverProvider();
  final blurtCreateDriverProvider = BlurtCreateDriverProvider();
  final blurtUpdateDriverProvider = BlurtUpdateDriverProvider();

  final tripStartProvider = TripStartProvider();
  final tripEndProvider = TripEndProvider();


  /* DocumentType*/
  Future<DocumentTypeModel> documents_type( ) => documentsTypeProvider.DocumentsTypes();

  /* VehicleType*/
  Future<VehicleTypeModel> vehicles_type( ) => vehiclesTypeProvider.VehiclesType();

  /* BanktList*/
  Future<BankListModel> banks_list( ) => bankListProvider.BanksTypes();

  /* BanktType*/
  Future<BankAcountTypeModel> banks_account_types( ) => bankAccountTypeProvider.BankAccountTypes();

  /* SignIn */
  Future<SingninModel> sign_in(String phone, String password ) => loginProvider.SignIn(phone , password);

  /* SaveDriver */
  Future<SaveDriverModel> save_driver(String name_first , String name_second, String lastNameFirst , String lastNameSecond,
                                    String document_type , String document_number, String email , String phone,
                                    String password, String address, String date_birth , String licence_number ,
                                    String vehicule_type, String vehicule_year, String driving_daily_routine ) =>
      saveDriverProvider.SaveDriver(name_first, name_second, lastNameFirst , lastNameSecond , document_type, document_number,
                                    email, phone , password, address , date_birth,  licence_number , vehicule_type, vehicule_year , driving_daily_routine);

  /* ListPaymentReceivedDriver */
  Future<PaymentRecivedModel> list_payment_received_driver( String driver_id, String start_time, String end_date) =>
                      listPaymentReceivedDriverProvider.ListPaymentReceivedDriver(driver_id,start_time,end_date);

  /* UpdateDataBank */
  Future<updateDataBankModel> update_data_bank_driver(String driver_id, String bank_id, String account_number , String account_type_id) =>
      updateDataBankProvider.UpdateDataBankDriver(driver_id, bank_id,account_number,account_type_id);

  /* UpdateDriver*/
  Future<UpdateDriverModel> update_driver(String driver_id, String name_first , String name_second, String lastNameFirst , String lastNameSecond,
                                    String document_type , String document_number, String email , String phone, String address, String date_birth , String licence_number ,
                                    String vehicule_type, String vehicule_year, String driving_daily_routine ) =>
      updateDriverProvider.UpdateDriver(driver_id, name_first, name_second, lastNameFirst , lastNameSecond , document_type, document_number,
                                    email, phone , address , date_birth,  licence_number , vehicule_type, vehicule_year , driving_daily_routine);

  /* BlurtCreate */
  Future<BlurtResponseModel> blurt_create(String driver_id, String message ) => blurtCreateDriverProvider.CreateBlurtDriver(driver_id , message);

  /* BlurtUpdate */
  Future<BlurtResponseModel> blurt_update(String driver_id, String blurt_id ) => blurtUpdateDriverProvider.UpdateBlurtDriver(driver_id , blurt_id);

  /* BlurtsList*/
  Future<BlurtListModel> blurt_list_all( ) => blurtListAllProvider.BlurtListAll();

  /* BlurtsListDriver */
  Future<BlurtListModel> blurt_list_driver(String driver_id) => blurtListDriverProvider.BlurtListDriver(driver_id);


  /* TripStart */
  Future<TripStartModel> trip_start(String driver_id) => tripStartProvider.TripStart(driver_id);

  /* TripEnd */
  Future<TripEndModel> trip_end(String driver_id, String trip_id) => tripEndProvider.TripEnd(driver_id, trip_id);

}