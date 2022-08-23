import 'package:radadz_app/src/providers/blurt_provider.dart';
import 'package:radadz_app/src/providers/driver_provider.dart';
import 'package:radadz_app/src/providers/master_provider.dart';
import 'package:radadz_app/src/utils/export.dart';

class Repository {

  final loginProvider = LoginProvider();
  final resetPasswordProvider = ResetPasswordProvider();
  final driverProvider = DriverProvider();
  final blurtProvider = BlurtProvider();
  final masterProvider = MasterProvider();
  final tripProvider = TripProvider();


  /* SignIn */
  Future<SingninModel> sign_in(String phone, String password ) => loginProvider.SignIn(phone , password);

  //////////////////////////////// RESET PASSWORD ////////////////////////////////////////////////

  /* ResetPassword */
  Future<ResponseModel> resetPasswordRepository(String phone ) => resetPasswordProvider.resetPassword(phone);

  /* ResetVerifyCodePassword */
  Future<ResponseModel> resetVerifyCodeRepository(String code ) => resetPasswordProvider.resetVerifyCode(code);

  /* ResetChangePassword */
  Future<ResponseModel> resetChangePasswordRepository(String code ,String password ) => resetPasswordProvider.resetChangePasswordCode(code , password);

  //////////////////////////////// MASTER ////////////////////////////////////////////////

  /* DocumentType*/
  Future<DocumentTypeModel> documentListRepository( ) => masterProvider.DocumentsTypes();

  /* VehicleType*/
  Future<VehicleTypeModel> vehiclesListRepository( ) => masterProvider.VehiclesType();

  /* BanktList*/
  Future<BankListModel> bankListRepository( ) => masterProvider.BanksTypes();

  /* BanktType*/
  Future<BankAcountTypeModel> accountTypeBankRepository( ) => masterProvider.BankAccountTypes();


  //////////////////////////////// DRIVER ////////////////////////////////////////////////
  /* SaveDriver */
  Future<SaveDriverModel> saveDriverRepository(String name_first , String name_second, String lastNameFirst , String lastNameSecond,
                                    String document_type , String document_number, String email , String phone,
                                    String password, String address, String date_birth , String licence_number ,
                                    String vehicule_type, String vehicule_year, String driving_daily_routine ) =>
      driverProvider.SaveDriver(name_first, name_second, lastNameFirst , lastNameSecond , document_type, document_number,
                                    email, phone , password, address , date_birth,  licence_number , vehicule_type, vehicule_year , driving_daily_routine);

  /* UpdateDriver*/
  Future<UpdateDriverModel> updateDriverRepository(String driver_id, String name_first , String name_second, String lastNameFirst , String lastNameSecond,
      String document_type , String document_number, String email , String phone, String address, String date_birth , String licence_number ,
      String vehicule_type, String vehicule_year, String driving_daily_routine ) =>
      driverProvider.UpdateDriver(driver_id, name_first, name_second, lastNameFirst , lastNameSecond , document_type, document_number,
          email, phone , address , date_birth,  licence_number , vehicule_type, vehicule_year , driving_daily_routine);

  /* ListPaymentReceivedDriver */
  Future<PaymentRecivedModel> listPaymentReceivedDriverRepository( String driver_id, String start_time, String end_date) =>
      driverProvider.ListPaymentReceivedDriver(driver_id,start_time,end_date);

  /* UpdateDataBank */
  Future<UpdateDataBankModel> updateDriverDataBank(String driver_id, String bank_id, String account_number , String account_type_id) =>
      driverProvider.UpdateDataBankDriver(driver_id, bank_id,account_number,account_type_id);


  //////////////////////////////// BLURT ////////////////////////////////////////////////
  /* BlurtCreate */
  Future<BlurtResponseModel> blurtCreateRepository(String driver_id, String message ) => blurtProvider.CreateBlurtDriver(driver_id , message);

  /* BlurtUpdate */
  Future<BlurtResponseModel> blurtEnableRepository(String driver_id, String blurt_id ) => blurtProvider.UpdateBlurtDriver(driver_id , blurt_id);

  /* BlurtsList*/
  Future<BlurtListModel> blurtListAllRepository( ) => blurtProvider.BlurtListAll();

  /* BlurtsListDriver */
  Future<BlurtListModel> blurtListDriverRepository(String driver_id) => blurtProvider.BlurtListDriver(driver_id);


  //////////////////////////////// TRIP ////////////////////////////////////////////////
  /* TripStart */
  Future<TripStartModel> tripStartRepository(String driver_id,String trip_payment_id) => tripProvider.TripStart(driver_id, trip_payment_id);

  /* TripEnd */
  Future<TripEndModel> tripEndRepository(String driver_id, String trip_id) => tripProvider.TripEnd(driver_id, trip_id);

  /* listTripHistoryDriver */
  Future<TripHistoryModel>  listTripHistoryDriverRepository( String driver_id, String start_time, String end_date) => tripProvider.listTripHistoryDriver(driver_id,start_time,end_date);

}