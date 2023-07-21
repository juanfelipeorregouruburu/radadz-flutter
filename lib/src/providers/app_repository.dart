import 'package:radadz_app/src/utils/export.dart';

class Repository {

  final loginProvider = LoginProvider();
  final resetPasswordProvider = ResetPasswordProvider();
  final driverProvider = DriverProvider();
  final blurtProvider = BlurtProvider();
  final masterProvider = MasterProvider();
  final tripProvider = TripProvider();


  /* SignIn */
  Future<SingInModel> signIn(String? phone, String? password ) => loginProvider.SignIn(phone! , password!);

  /* DeleteAccount */
  Future<ResponseModel> DeleteAccountRepository(String? userId) => loginProvider.DeleteAccount(userId!);

  //////////////////////////////// RESET PASSWORD ////////////////////////////////////////////////

  /* ResetPassword */
  Future<ResponseModel> resetPasswordRepository(String? phone ) => resetPasswordProvider.resetPassword(phone!);

  /* ResetVerifyCodePassword */
  Future<ResponseModel> resetVerifyCodeRepository(String? code ) => resetPasswordProvider.resetVerifyCode(code!);

  /* ResetChangePassword */
  Future<ResponseModel> resetChangePasswordRepository(String? code ,String? password ) => resetPasswordProvider.resetChangePasswordCode(code! , password!);

  //////////////////////////////// MASTER ////////////////////////////////////////////////

  /* DocumentType*/
  Future<DocumentTypeModel> documentListRepository( ) => masterProvider.DocumentsTypes();

  /* DocumentType*/
  Future<RoutineDriverModel> routineDriversRepository( ) => masterProvider.RoutineDrivers();

  /* VehicleType*/
  Future<VehicleTypeModel> vehiclesTypeListRepository( ) => masterProvider.VehiclesType();

  /* VehiclesColor*/
  Future<VehicleColorModel> vehiclesColorListRepository( ) => masterProvider.VehiclesColor();

  /* vehicleManufacturerList*/
  Future<VehicleManufacturerModel> vehiclesManufacturerListRepository( ) => masterProvider.VehiclesManufacturer();

  /* vehiclesModelList*/
  Future<VehicleModel> vehiclesListRepository(String? manufacturerId ) => masterProvider.vehiclesModel(manufacturerId!);

  /* BankList*/
  Future<BankListModel> bankListRepository( ) => masterProvider.BanksTypes();

  /* BankType*/
  Future<BankAcountTypeModel> accountTypeBankRepository( ) => masterProvider.BankAccountTypes();


  //////////////////////////////// DRIVER ////////////////////////////////////////////////

  /* vehiclesModelList*/
  Future<DriverModel> getDriverRepository(String? driverId ) => driverProvider.getDriver(driverId!);

  /* SaveDriver */
  Future<SaveDriverModel> saveDriverRepository(String? nameFirst , String? nameSecond, String? lastNameFirst , String? lastNameSecond,
                                    String? documentType , String? documentNumber, String? email , String? phone, String? password, String? address, String? birthDate ,
                                    String? licencePlateNumber ,String? engineSerialNumber , String? vehicleType, String? vehicleYear, String? drivingDailyRoutine ,
                                    String? vehicleModel,String? vehicleManufacturer,String? vehicleColor,String? isOwner,String? ownerVehicleName,String? ownerIdNumber,
                                    String? expirationDateTechnicalMechanical , String? expirationDateSOAT , String? expirationDateDriverLicence  ) =>

      driverProvider.SaveDriver(nameFirst!, nameSecond!, lastNameFirst!, lastNameSecond!, documentType!, documentNumber!, email!,  phone!, password!, address!, birthDate!,
          licencePlateNumber!, engineSerialNumber!, vehicleType!, vehicleYear!, drivingDailyRoutine!, vehicleModel!, vehicleManufacturer!, vehicleColor!, isOwner!, ownerVehicleName!, ownerIdNumber!,
          expirationDateTechnicalMechanical!, expirationDateSOAT!, expirationDateDriverLicence!);

  /* UpdateDriver*/
  Future<UpdateDriverModel> updateDriverRepository(String? driverId, String? nameFirst , String? nameSecond, String? lastNameFirst , String? lastNameSecond,
      String? documentType , String? documentNumber, String? email , String? address, String? birthDate ,
      String? licencePlateNumber , String? engineSerialNumber ,String? vehicleType, String? vehicleYear, String? drivingDailyRoutine ,
      String? vehicleModel,String? vehicleManufacturer,String? vehicleColor,String? isOwner,String? ownerVehicleName,String? ownerIdNumber,
      String? expirationDateTechnicalMechanical , String? expirationDateSOAT , String? expirationDateDriverLicence ) =>

      driverProvider.UpdateDriver(driverId!, nameFirst!, nameSecond!, lastNameFirst!, lastNameSecond!, documentType!, documentNumber!, email!, address!, birthDate!,
          licencePlateNumber!,  engineSerialNumber! , vehicleType!, vehicleYear!, drivingDailyRoutine!, vehicleModel!, vehicleManufacturer!, vehicleColor!, isOwner!, ownerVehicleName!, ownerIdNumber!,
          expirationDateTechnicalMechanical!, expirationDateSOAT!, expirationDateDriverLicence!);

  /* UpdateDataBank */
  Future<UpdateDataBankModel> updateDriverDataBank(String? driverId, String? bankId, String? accountNumber , String? accountTypeId) =>
      driverProvider.UpdateDataBankDriver(driverId!, bankId!,accountNumber!,accountTypeId!);


  //////////////////////////////// BLURT ////////////////////////////////////////////////
  /* BlurtCreate */
  Future<BlurtResponseModel> blurtCreateRepository(String? driverId, String? message ) => blurtProvider.CreateBlurtDriver(driverId! , message!);

  /* BlurtUpdate */
  Future<BlurtResponseModel> blurtEnableRepository(String? driverId, String? blurtId ) => blurtProvider.UpdateBlurtDriver(driverId! , blurtId!);

  /* BlurtsList*/
  Future<BlurtListModel> blurtListAllRepository( ) => blurtProvider.BlurtListAll();

  /* BlurtsListDriver */
  Future<BlurtListModel> blurtListDriverRepository(String? driverId) => blurtProvider.BlurtListDriver(driverId!);


  //////////////////////////////// TRIP ////////////////////////////////////////////////
  /* TripStart */
  Future<TripStartModel> tripStartRepository(String? driverId,String? tripPaymentId) => tripProvider.TripStart(driverId!, tripPaymentId!);

  /* TripEnd */
  Future<TripEndModel> tripEndRepository(String? driverId, String? tripId) => tripProvider.TripEnd(driverId!, tripId!);

  /* listTripHistoryDriver */
  Future<TripHistoryModel>  listTripHistoryDriverRepository( String? driverId, String? startTime, String? endDate) => tripProvider.listTripHistoryDriver(driverId!,startTime!,endDate!);

  /* DetailTripHistory */
  Future<TripDetailHistoryModel>  tripDetailHistoryDriverRepository( String? tripId) => tripProvider.tripDetailHistoryDriver(tripId!);

  /* ListPaymentHistoryDriver */
  Future<PaymentHistoryModel> listPaymentHistoryDriverRepository( String? driverId, String? startTime, String? endDate) => tripProvider.ListPaymentHistoryDriver(driverId!,startTime!,endDate!);

  /* ListTripPaymentHistoryDriver */
  Future<TripPaymentHistoryModel> listTripPaymentDriverRepository( String? tripPaymentId) => tripProvider.ListTripPaymentDriver(tripPaymentId!);
}