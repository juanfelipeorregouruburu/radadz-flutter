class API {
  static const String _URL = "https://loud-tv.herokuapp.com/api/";

  /* API LIST */

  static final String login = _URL + "driver_log";

  static const String resetPassword = _URL + "reset_password";
  static const String resetVerifyCode = _URL + "verify_user_token";
  static const String resetChangePassword = _URL + "change_password";

  static final String documentsList = _URL + "list_documenttype";
  static final String vehicleManufacturerList = _URL + "list_vehicle_manufacturer";
  static final String vehiclesList = _URL + "list_vehicletype";
  static final String routineDriverList = _URL + "list_driver_routine";
  static final String vehiclesColorList = _URL + "list_vehicle_color";
  static final String vehiclesModelList = _URL + "list_vehicle_model";
  static final String bankList = _URL + "list_bank";
  static final String getAccountBankType = _URL + "list_bank_account_type";

  static final String getDriver = _URL + "list_driverid";
  static final String driverCreate = _URL + "save_driver";
  static final String driverUpdate = _URL + "update_driver";
  static final String driverDataBank = _URL + "update_driver_bank";
  static final String driverListPaymentHistory = _URL + "list_trip_payment_history";
  static final String driverListTripPaymentHistory = _URL + "list_of_trips_per_trip_payment";
  static final String getListTripHistoryDriver = _URL + "list_driver_trips";
  static final String getTripDetailHistoryDriver = _URL + "get_driver_trip";

  static final String blurtListAll = _URL + "list_screen_msgs_phone";
  static final String blurtListDriverId = _URL + "list_screen_msgs_driver";
  static final String blurtCreate = _URL + "create_blurt";
  static final String blurtEnable = _URL + "enable_blurt";

  static final String setTripStart = _URL + "trip_start";
  static final String setTripEnd = _URL + "trip_end";


}
