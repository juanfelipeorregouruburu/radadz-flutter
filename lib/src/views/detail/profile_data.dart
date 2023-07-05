import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:radadz_app/src/utils/export.dart';
import 'dart:convert';

class ProfileDriver extends StatefulWidget {

  const ProfileDriver({Key? key}) : super(key: key);

  @override
  _ProfileDriverState createState() => _ProfileDriverState();
}

class _ProfileDriverState extends State<ProfileDriver> {

  final GlobalKey<FormState> formState = new GlobalKey<FormState>();
  final prefs = new Preferences();
  bool _isLoading = false;
  UpdateDriverBloc _updateDriverBloc = new UpdateDriverBloc();
  late Map<String, dynamic> _map;

  //Date
  String _inputStrDate = '';
  String _inputStrDateExpirationTechnical = '';
  String _inputStrDateExpirationSOAT = '';
  String _inputStrDateExpirationLicence = '';
  String _routineDailyId = '';

  DocumentType _documentType = new DocumentType();
  VehicleManufacturer _vehicleManufacturer = new VehicleManufacturer();
  Vehicle _vehicle = new Vehicle();
  VehicleType _vehicleType = new VehicleType();
  VehicleColor _vehicleColor = new VehicleColor();

  bool _stateReviewDocumentType = true;
  bool _stateReviewVehicleType = true;
  bool _stateReviewVehicleColor = true;
  bool _stateContainerVehicleColor = false;
  bool _stateReviewVehicleManufacturer = true;
  bool _stateReviewVehicle = true;
  bool _SelectedVehicle = false;
  bool _loadingVehicle = false;
  bool _stateContainerVehicle = false;
  bool stateVehicleOwner = false;
  int _currentDailyValue = 1;
  DateTime date = DateTime.now();


  TextEditingController _inputNameFirstController = new TextEditingController();
  TextEditingController _inputNameSecondController = new TextEditingController();
  TextEditingController _inputLastNameFirstController = new TextEditingController();
  TextEditingController _inputLastNameSecondController = new TextEditingController();
  TextEditingController _inputDocumentController = new TextEditingController();
  TextEditingController _inputEmailController = new TextEditingController();
  TextEditingController _inputAddressController = new TextEditingController();
  TextEditingController _inputNumberLicenceController = new TextEditingController();
  TextEditingController _inputEngineSerialNumberController = new TextEditingController();
  TextEditingController _inputYearLicenceController = new TextEditingController();


  //
  TextEditingController _inputNameOwnerController = new TextEditingController();
  TextEditingController _inputDocumentOwnerController = new TextEditingController();

  TextEditingController _inputNameColorController = new TextEditingController();
  TextEditingController _inputNameVehicleController = new TextEditingController();

  final FocusNode _nameFirstFocus = FocusNode();
  final FocusNode _nameSecondFocus = FocusNode();
  final FocusNode _lastNameFirstFocus = FocusNode();
  final FocusNode _lastNameSecondFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _documentFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _addressFocus = FocusNode();
  final FocusNode _numberLicenceFocus = FocusNode();
  final FocusNode _engineSerialNumberFocus = FocusNode();
  final FocusNode _yearLicenceFocus = FocusNode();
  final FocusNode _dateFocus = FocusNode();
  final FocusNode _nameOwnerFocus = FocusNode();
  final FocusNode _documentOwnerFocus = FocusNode();
  final FocusNode _nameColorFocus = FocusNode();
  final FocusNode _nameVehicleFocus = FocusNode();

  String? defaultLocale ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    defaultLocale = Platform.localeName ;
    getDriverData();
  }

  getDriverData(){
    String data = Preferences.getDriver;

    if(data.isEmpty){
      print('no data in preferences');
    }else{
      _map = jsonDecode(data);
      blocVehicles.manufacturerId = _map['vehicle_manufacturer']['id'].toString();

      _inputNameFirstController.text = _map['first_name'];
      _inputNameSecondController.text = _map['second_name'];
      _inputLastNameFirstController.text = _map['first_lastname'];
      _inputLastNameSecondController.text = _map['second_lastname'];
      _inputDocumentController.text = _map['document_number'];
      _inputEmailController.text = _map['email'];
      _inputAddressController.text = _map['address'];
      _inputNumberLicenceController.text = _map['license_plate_number'];
      _inputEngineSerialNumberController.text = _map['engine_serial_number'];
      _inputYearLicenceController.text = _map['vehicle_year'];
      _inputNameOwnerController.text = _map['owner_vehicle_name'];
      _inputDocumentOwnerController.text = _map['owner_id_number'];

      _routineDailyId = _map['driving_daily_routine']['id'].toString();
      _currentDailyValue = _map['driving_daily_routine']['id'];
      stateVehicleOwner = _map['is_owner'] ;

      formatDate(DateTime.parse(_map['birth_date']) , 0);
      formatDate(DateTime.parse(_map['expiration_date_of_the_technical_mechanical_review']) , 1);
      formatDate(DateTime.parse(_map['soat_expiration_date']) , 2);
      formatDate(DateTime.parse(_map['expiration_date_drivers_license']) , 3);
    }

  }


  _UpdateDriver() async {

    if (formState.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      _updateDriverBloc.driverId = Preferences.getDriverId;
      _updateDriverBloc.nameFirst = _inputNameFirstController.text.trim();
      _updateDriverBloc.nameSecond = _inputNameSecondController.text.trim();
      _updateDriverBloc.lastNameFirst = _inputLastNameFirstController.text.trim();
      _updateDriverBloc.lastNameSecond = _inputLastNameSecondController.text.trim();
      _updateDriverBloc.documentType = _documentType.id.toString();
      _updateDriverBloc.birthDate = _inputStrDate;
      _updateDriverBloc.documentNumber = _inputDocumentController.text.trim();
      _updateDriverBloc.email = _inputEmailController.text.trim().toLowerCase();
      _updateDriverBloc.address = _inputAddressController.text.trim();
      _updateDriverBloc.licencePlateNumber = _inputNumberLicenceController.text.trim();
      _updateDriverBloc.engineSerialNumber = _inputEngineSerialNumberController.text.trim();
      _updateDriverBloc.vehicleYear = _inputYearLicenceController.text.trim();
      _updateDriverBloc.drivingDailyRoutine = _routineDailyId;
      _updateDriverBloc.vehicleType = _vehicleType.id.toString();
      _updateDriverBloc.vehicleModel = _vehicle.id == 0 ? _inputNameVehicleController.text.trim() : _vehicle.id.toString();
      _updateDriverBloc.vehicleManufacturer = _vehicleManufacturer.id.toString();
      _updateDriverBloc.vehicleColor = _vehicleColor.id == 0 ? _inputNameColorController.text.trim() : _vehicleColor.id.toString();
      _updateDriverBloc.isOwner = stateVehicleOwner ? "1" : "0" ;
      _updateDriverBloc.ownerIdNumber = _inputDocumentOwnerController.text.trim();
      _updateDriverBloc.ownerVehicleName = _inputNameOwnerController.text.trim();
      _updateDriverBloc.expirationDateTechnicalMechanical = _inputStrDateExpirationTechnical;
      _updateDriverBloc.expirationDateSOAT = _inputStrDateExpirationSOAT;
      _updateDriverBloc.expirationDateDriverLicence = _inputStrDateExpirationLicence;


      _updateDriverBloc.UpdateDriver();

      _updateDriverBloc.data.listen((data) {
        SystemChannels.textInput.invokeMethod('TextInput.hide');
        setState(() {_isLoading = false;});

        if (data.error == 1) {
          Preferences.setDriver = data.driver;
          final snackBar = customSnackBar('Success' , 'profile_data_success'.tr() , ContentType.success);
          ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(snackBar);
        }else{
          final snackBar = customSnackBar('Error' , 'profile_data_error'.tr() , ContentType.failure);
          ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(snackBar);
        }

      });

    }else{
      final snackBar = customSnackBar('Info' , 'register_form_incomplete'.tr() , ContentType.help);
      ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(snackBar);
    }

  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 15.w),
            physics: BouncingScrollPhysics(),
            child: Form(
              key: formState,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'register_drive_data_title'.tr(),
                    style: StyleGeneral.styleTextDescription,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(height: 15.h),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 2,
                        child: InputTextField(
                          focusNode: _nameFirstFocus,
                          controller: _inputNameFirstController,
                          onFieldSubmitted: (term) {

                          },
                          labelText: 'form_first_name'.tr(),
                          hintText: 'form_first_name'.tr(),
                          validator: (String? value) {
                            if (value!.isEmpty) return 'required_field'.tr();
                            return null;
                          }
                        )
                      ),

                      SizedBox(width: 15.h),

                      Flexible(
                        flex: 2,
                        child: InputTextField(
                          focusNode: _nameSecondFocus,
                          controller: _inputNameSecondController,
                          onFieldSubmitted: (term) {

                          },
                          labelText: 'form_second_name'.tr(),
                          hintText: 'form_second_name'.tr(),
                          validator: (String? value) {
                            return null;
                          }
                        )
                      )
                    ]
                  ),

                  SizedBox(height: 15.h),

                  Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        flex: 2,
                        child: InputTextField(
                          focusNode: _lastNameFirstFocus,
                          controller: _inputLastNameFirstController,
                          onFieldSubmitted: (term) {
                            fieldFocusChange(context, _lastNameFirstFocus, _lastNameSecondFocus);
                          },
                          labelText:'form_first_lastname'.tr(),
                          hintText: 'form_first_lastname'.tr(),
                          validator: (String? value) {
                            if (value!.isEmpty) return 'required_field'.tr();
                            return null;
                          }
                        )
                      ),

                      SizedBox(width: 15.w,
                      ),

                      Flexible(
                        flex: 2,
                        child: InputTextField(
                          focusNode: _lastNameSecondFocus,
                          controller: _inputLastNameSecondController,
                          onFieldSubmitted: (term) {
                            fieldFocusChange(context, _lastNameSecondFocus, _emailFocus);
                          },
                          labelText: 'form_second_lastname'.tr(),
                          hintText: 'form_second_lastname'.tr(),
                          validator: (String? value) {

                            return null;
                          }
                        )
                      )
                    ]
                  ),

                  SizedBox(height: 15.h),
                  Text('selection_document_type'.tr(), style: TextStyle(color: StyleGeneral.BLACK , fontSize: ScreenUtil().setSp(12), fontFamily: 'Poppins-Regular')),
                  SizedBox(height: 5.h),
                  _dataSpinnerDocumentType(),

                  SizedBox(height: 15.h),

                  Flexible(
                    flex: 2,
                    child: InputTextField(
                      focusNode: _documentFocus,
                      controller: _inputDocumentController,
                      keyboardType: TextInputType.number,
                      onFieldSubmitted: (term) {
                        fieldFocusChange(context, _documentFocus, _emailFocus);
                      },
                      labelText:'form_document_number'.tr(),
                      hintText: 'form_document_number'.tr(),
                      validator: (String? value) {
                        if (value!.isEmpty) return 'required_field'.tr();
                        return null;
                      }
                    )
                  ),

                  SizedBox(height: 15.h),

                  Flexible(
                    flex: 2,
                    child: InputTextField(
                      focusNode: _emailFocus,
                      controller: _inputEmailController,
                      keyboardType: TextInputType.emailAddress,
                      onFieldSubmitted: (term) {
                        fieldFocusChange(context, _emailFocus, _phoneFocus);
                      },
                      labelText:'form_email'.tr(),
                      hintText: 'email@gmail.com',
                      validator: (String? value) {
                        if(value!.isEmpty){
                          return 'required_field'.tr();
                        }else if(!validateEmail(value)){
                          return 'required_email'.tr();
                        }
                        return null;
                      }
                    )
                  ),

                  SizedBox(height: 15.h),


                  Flexible(
                    flex: 2,
                    child: InputTextField(
                      focusNode: _addressFocus,
                      controller: _inputAddressController,
                      keyboardType: TextInputType.text,
                      onFieldSubmitted: (term) {
                        fieldFocusChange(context, _addressFocus, _numberLicenceFocus);
                      },
                      labelText:'form_address'.tr(),
                      hintText: 'form_address'.tr(),
                      validator: (String? value) {
                        if (value!.isEmpty) return 'required_field'.tr();
                        return null;
                      },
                    )
                  ),


                  SizedBox(height: 15.h),

                  Text('form_birth_date'.tr(), style: TextStyle(color: StyleGeneral.BLACK , fontSize: ScreenUtil().setSp(12), fontFamily: 'Poppins-Regular'),),
                  SizedBox(height: 5.h),
                  formatDateContainer(0),

                  SizedBox(height: 15.h),

                  Text(
                    'register_Vehicle_data_title'.tr(),
                    style: StyleGeneral.styleTextDescription,
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),

                  Text('selection_vehicle_type'.tr(), style: TextStyle(color: StyleGeneral.BLACK , fontSize: ScreenUtil().setSp(12), fontFamily: 'Poppins-Regular')),
                  SizedBox(height: 5.h),
                  _dataSpinnerType(),
                  SizedBox(height: 15.h),

                  Text('selection_vehicle_color'.tr(), style: TextStyle(color: StyleGeneral.BLACK , fontSize: ScreenUtil().setSp(12), fontFamily: 'Poppins-Regular')),
                  SizedBox(height: 5.h),
                  _dataSpinnerColor(),
                  SizedBox(height: 5.h),

                  if (_stateContainerVehicleColor)
                    InputTextField(
                      focusNode: _nameColorFocus,
                      controller: _inputNameColorController,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (term) {

                      },
                      labelText: 'selection_name_other_color'.tr(),
                      hintText: 'selection_name_other_color'.tr(),
                      validator: (String? value) {
                        return null;
                      }
                    ),

                  SizedBox(height: 15.h),
                  Text('selection_vehicle_manufacturer'.tr(), style: TextStyle(color: StyleGeneral.BLACK , fontSize: ScreenUtil().setSp(12), fontFamily: 'Poppins-Regular')),
                  SizedBox(height: 5.h),
                  _dataSpinnerVehicleManufacturer() ,
                  SizedBox(height: 15.h),
                  Text('selection_vehicle'.tr(), style: TextStyle(color: StyleGeneral.BLACK , fontSize: ScreenUtil().setSp(12), fontFamily: 'Poppins-Regular')),
                  SizedBox(height: 5.h),
                  _loadingVehicle ? ActivityIndicator() : _dataSpinnerVehicles(),
                  SizedBox(height: 15.h),
                  if (_stateContainerVehicle)
                    InputTextField(
                      focusNode: _nameVehicleFocus,
                      controller: _inputNameVehicleController,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (term) {

                      },
                      labelText: 'selection_name_other_vehicle'.tr(),
                      hintText: 'selection_name_other_vehicle'.tr(),
                      validator: (String? value) {
                        return null;
                      }
                    ),
                  SizedBox(height: 25.h),

                  Flexible(
                    flex: 2,
                    child: InputTextField(
                      focusNode: _yearLicenceFocus,
                      controller: _inputYearLicenceController,
                      keyboardType: TextInputType.number,
                      onFieldSubmitted: (term) {
                        fieldFocusChange(context, _yearLicenceFocus, _engineSerialNumberFocus);
                      },
                      maxLength: 4,
                      labelText:'form_vehicle_year'.tr(),
                      hintText: 'form_vehicle_year'.tr(),
                      validator: (String? value) {
                        if (value!.isEmpty) return 'required_field'.tr();
                        return null;
                      }
                    )
                  ),

                  SizedBox(height: 15.h),

                  Flexible(
                    flex: 2,
                    child: InputTextField(
                      focusNode: _engineSerialNumberFocus,
                      controller: _inputEngineSerialNumberController,
                      keyboardType: TextInputType.text,
                      onFieldSubmitted: (term) {
                        fieldFocusChange(context, _engineSerialNumberFocus, _dateFocus);
                      },
                      maxLength: 32,
                      labelText:'form_engine_serial_number'.tr(),
                      hintText: 'form_engine_serial_number'.tr(),
                      validator: (String? value) {
                        if (value!.isEmpty) return 'required_field'.tr();
                        return null;
                      }
                    )
                  ),

                  SizedBox(height: 15.h),


                  Flexible(
                    flex: 2,
                    child: InputTextField(
                        focusNode: _numberLicenceFocus,
                        controller: _inputNumberLicenceController,
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (term) {
                          fieldFocusChange(context, _numberLicenceFocus, _yearLicenceFocus);
                        },
                        labelText:'form_license_plate_number'.tr(),
                        hintText: 'form_license_plate_number'.tr(),
                        validator: (String? value) {
                          if (value!.isEmpty) return 'required_field'.tr();
                          return null;
                        }
                    )
                  ),

                  SizedBox(
                    height: 15.h,
                  ),

                  SizedBox(height: 10.h),
                  Text('form_expiration_technical_date'.tr(), style: TextStyle(color: StyleGeneral.BLACK , fontSize: ScreenUtil().setSp(12), fontFamily: 'Poppins-Regular'),),
                  SizedBox(height: 5.h),
                  formatDateContainer(1),
                  SizedBox(height: 10.h),
                  Text('form_expiration_SOAT_date'.tr(), style: TextStyle(color: StyleGeneral.BLACK , fontSize: ScreenUtil().setSp(12), fontFamily: 'Poppins-Regular'),),
                  SizedBox(height: 5.h),
                  formatDateContainer(2),
                  SizedBox(height: 10.h),
                  Text('form_expiration_licence_date'.tr(), style: TextStyle(color: StyleGeneral.BLACK , fontSize: ScreenUtil().setSp(12), fontFamily: 'Poppins-Regular'),),
                  SizedBox(height: 5.h),
                  formatDateContainer(3),
                  SizedBox(height: 15.h),

                  Text(
                    'register_Vehicle_owner_title'.tr(),
                    style: TextStyle(color: StyleGeneral.BLACK, letterSpacing: .5, fontSize: ScreenUtil().setSp(14), fontFamily: 'Poppins-Semi'),
                    textAlign: TextAlign.justify
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Flexible( flex: 1,  fit: FlexFit.loose,
                          child: InkWell(
                            onTap: ()  {
                              setState(() {
                                stateVehicleOwner = !stateVehicleOwner;
                              });
                            },
                            child: Container(
                              width: 20.h,
                              height: 20.h,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(color: !stateVehicleOwner ? StyleGeneral.GREEN : StyleGeneral.WHITE, shape: BoxShape.circle, border: Border.all(color: StyleGeneral.GREEN, width: 1.5)),
                              child: Center(child: Icon(Icons.done, color: Colors.white, size: ScreenUtil().setSp(15)))
                            )
                          )
                        ),
                        SizedBox(width: 10.w),
                        Flexible( flex: 7,
                          fit: FlexFit.tight,
                          child: Container(
                            width: double.infinity,
                            color: Colors.transparent,
                            child: RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                style: TextStyle( color: StyleGeneral.BLACK ,  fontSize: ScreenUtil().setSp(12) , fontFamily: 'Poppins-Regular'),
                                text: 'form_driver_owner'.tr()
                              )
                            )
                          )
                        )
                      ]
                    )
                  ),

                  SizedBox(height: 15.h),

                  if(!stateVehicleOwner)

                    Flexible(
                      child: Column(
                        children: [

                          InputTextField(
                            focusNode: _nameOwnerFocus,
                            controller: _inputNameOwnerController,
                            onFieldSubmitted: (term) {
                              fieldFocusChange(context, _nameOwnerFocus, _documentOwnerFocus);
                            },
                            labelText: 'form_name_owner'.tr(),
                            hintText: 'form_name_owner'.tr(),
                            validator: (String? value) {
                              return null;
                            }
                          ),

                          SizedBox(height: 10.h),

                          InputTextField(
                            focusNode: _documentOwnerFocus,
                            controller: _inputDocumentOwnerController,
                            keyboardType: TextInputType.number,
                            onFieldSubmitted: (term) {

                            },
                            labelText: 'form_document_owner'.tr(),
                            hintText: 'form_document_owner'.tr(),
                            validator: (String? value) {
                              return null;
                            }
                          )
                        ]
                      )
                    ),

                  SizedBox(height: 15.h),
                  Text(
                    'register_routine_daily_title'.tr(),
                    style: StyleGeneral.styleTextDescription,
                    textAlign: TextAlign.left,
                  ),

                  SizedBox(
                    height: 15.h,
                  ),

                  _routineDriverList(),

                  SizedBox(
                    height: 15.h,
                  ),

                  _isLoading ? ActivityIndicator() :CustomButton(
                    text: 'profile_update_button'.tr(),
                    fullscreen: true,
                    onTap: (){
                      _UpdateDriver();
                    }
                  )
                ]
              )
            )
          );
        }
     );
  }

  Widget formatDateContainer(int typeDate){
    DateTime date = DateTime.now();

    return GestureDetector(
      onTap: () => _showDialog(
        Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(-2);
              },
              child: Text('form_button_confirm'.tr() , style: TextStyle(color: StyleGeneral.WHITE, fontSize: ScreenUtil().setSp(15), fontFamily: "Poppins-Regular"))
            ),
            Expanded(
              child: CupertinoDatePicker(
                initialDateTime: date,
                minimumDate: typeDate == 0 ? null : date,
                mode: CupertinoDatePickerMode.date,
                use24hFormat: true,
                onDateTimeChanged: (DateTime newDate) {
                  formatDate(newDate , typeDate);
                }
              )
            )
          ]
        )
      ),
      child: Container(
        padding: EdgeInsets.all(15.r),
        alignment: Alignment.topLeft,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          color: StyleGeneral.FILL_COLOR,
          border: Border.all(color: StyleGeneral.GREEN)
        ),
        child: Text(
          getInputDate(typeDate),
          style: TextStyle(
            color: Colors.black87,
            fontSize: ScreenUtil().setSp(15),
            fontFamily: "Poppins-Regular"
          )
        )
      )
    );

  }

  String getInputDate(int type){
    switch (type) {
      case 0:
        return _inputStrDate;

      case 1:
        return _inputStrDateExpirationTechnical;

      case 2:
        return _inputStrDateExpirationSOAT;

      case 3:
        return _inputStrDateExpirationLicence;

      default:  return '' ;
    }

  }

  formatDate(DateTime newDate , int typeDate) {
    date = newDate;

    switch (typeDate){

      case 0:
        _inputStrDate = DateFormat("yyyy-MM-dd").format(newDate);
        setState(() {});
        break;

      case 1:
        _inputStrDateExpirationTechnical = DateFormat("yyyy-MM-dd").format(newDate);
        setState(() {});
        break;

      case 2:
        _inputStrDateExpirationSOAT = DateFormat("yyyy-MM-dd").format(newDate);
        setState(() {});
        break;

      case 3:
        _inputStrDateExpirationLicence = DateFormat("yyyy-MM-dd").format(newDate);
        setState(() {});
        break;

    }

    setState(() {});
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 320.h,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child
        )
      )
    );
  }

  Widget _routineDriverList(){
    blocRoutineDriver.RoutineDrivers();

    return  StreamBuilder(
      stream: blocRoutineDriver.data!,
      builder: (context , AsyncSnapshot<RoutineDriverModel> snapshot) {

        if (snapshot.hasData) {
          List<RoutineDriver> routinesDriver = snapshot.data!.routinesDriver!;

          return ListView(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 0.w),
            children:routinesDriver.map((value) => RadioListTile<int>(
                groupValue: _currentDailyValue,
                activeColor: StyleGeneral.GREEN,
                title: Text(value.name!, textAlign: TextAlign.left, style: TextStyle(color: StyleGeneral.BLACK , fontSize: ScreenUtil().setSp(13) , fontFamily: 'Poppins-Regular') ),
                value: value.id!,
                onChanged: (val) {
                  print('value $val');
                  setState(() {
                    _routineDailyId = val!.toString();
                    _currentDailyValue = val;
                  });
                }
            )).toList(),
          );

        } else if (snapshot.hasError) {
          return Icon(Icons.error_outline);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      }
    );
  }

  Widget _dataSpinnerDocumentType(){

    blocDocumentType.DocumentTypes();

    return StreamBuilder(
      stream: blocDocumentType.data,
      builder: (context , AsyncSnapshot<DocumentTypeModel> snapshot) {

        if (snapshot.hasData) {
          List<DocumentType> documentTypeList = snapshot.data!.documentsType!;

          if(_stateReviewDocumentType){
            documentTypeList.asMap().forEach((index, value) {

              if(_map['document_type']['id'] == value.id){
                _documentType = documentTypeList[index];
              }
            });
          }

          return Center(
            child:  DropdownButtonFormField(
              isExpanded: true,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: StyleGeneral.GREEN, width: 2), borderRadius: BorderRadius.circular(20.r)),
                border: OutlineInputBorder(borderSide: BorderSide(color: StyleGeneral.GREEN, width: 2), borderRadius: BorderRadius.circular(20.r)),
                filled: true,
                fillColor: StyleGeneral.GREEN,
              ),
              icon: Icon(Icons.keyboard_arrow_down_rounded, size: 32, color: Colors.white),
              validator: (value) => value == null ? 'selection_document_type'.tr() : null,
              dropdownColor:  StyleGeneral.GREEN,
              value: documentTypeList.where( (i) => i.name == _documentType.name).first ,
              onChanged: (DocumentType? value) {
                setState(() {
                  _documentType = value!;
                  _stateReviewDocumentType = false;
                });
              },
              items: documentTypeList.map((DocumentType documentType) {
                String name = documentType.name!;
                String nameType = '';
                final splinted = name.split('/');
                nameType = defaultLocale!.contains("en_US") ? nameType = splinted[0] : nameType = splinted[1];

                return DropdownMenuItem<DocumentType>(
                  value: documentType,
                  child: Text(nameType, style: StyleGeneral.styleTextTextSpinner),
                );
              }).toList()

            )
          );
        } else if (snapshot.hasError) {
          return Icon(Icons.error_outline);
        } else {
          return ActivityIndicator();
        }
      }
    );

  }

  Widget _dataSpinnerType(){
    blocVehicleType.VehicleTypes();

    return StreamBuilder(
      stream: blocVehicleType.data!,
      builder: (context , AsyncSnapshot<VehicleTypeModel> snapshot) {

        if (snapshot.hasData) {
          List<VehicleType> VehicleTypeList = snapshot.data!.vehiclesType!;

          if(_stateReviewVehicleType){
            VehicleTypeList.asMap().forEach((index, value) {
              if(value.id == _map['vehicle_type']['id']){
                _vehicleType = VehicleTypeList[index];
              }
            });
          }

          return Center(
            child:  DropdownButtonFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: StyleGeneral.GREEN, width: 2), borderRadius: BorderRadius.circular(20.r),),
                border: OutlineInputBorder(borderSide: BorderSide(color: StyleGeneral.GREEN, width: 2), borderRadius: BorderRadius.circular(20.r)),
                filled: true,
                fillColor: StyleGeneral.GREEN,
              ),
              icon: Icon(Icons.keyboard_arrow_down_rounded, size: 32.sp, color: Colors.white),
              validator: (value) => value == null ? 'selection_vehicle_type'.tr() : null,
              dropdownColor:  StyleGeneral.GREEN,
              value: VehicleTypeList.where( (i) => i.name == _vehicleType.name).first ,
              onChanged: (VehicleType? value) {
                setState(() {
                  _vehicleType = value!;
                  _stateReviewVehicleType = false;
                });
              },
              items: VehicleTypeList.map((VehicleType vehicleType) {
                String name = vehicleType.name!;
                String nameTypeVehicle = '';

                if(name.contains("/")){
                  final splinted = name.split('/');
                  nameTypeVehicle = defaultLocale!.contains("en_US") ? splinted[0].capitalize() : splinted[1].substring(1).capitalize();
                }else{
                  nameTypeVehicle = name;
                }

                return DropdownMenuItem<VehicleType>(
                  value: vehicleType,
                  child: Text(nameTypeVehicle , style: StyleGeneral.styleTextTextSpinner),
                );
              }).toList()
            )
          );

        } else if (snapshot.hasError) {
          return Icon(Icons.error_outline);
        } else {
          return ActivityIndicator();
        }
      }
    );

  }

  Widget _dataSpinnerColor(){

    blocVehicleColor.VehiclesColor();

    return StreamBuilder(
      stream: blocVehicleColor.data!,
      builder: (context , AsyncSnapshot<VehicleColorModel> snapshot) {

        if (snapshot.hasData) {
          List<VehicleColor> VehicleColorList = snapshot.data!.vehiclesColor!;

          VehicleColorList.add(VehicleColor(id: 0, name: 'selection_name_text_color'.tr() ));
          if(_stateReviewVehicleColor){
            VehicleColorList.asMap().forEach((index, value) {
              if(value.id == _map['vehicle_color']['id']){
                _vehicleColor = VehicleColorList[index];
              }
            });
          }

          return Center(
            child:  DropdownButtonFormField(
              decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: StyleGeneral.GREEN, width: 2), borderRadius: BorderRadius.circular(20.r)),
              border: OutlineInputBorder(borderSide: BorderSide(color: StyleGeneral.GREEN, width: 2), borderRadius: BorderRadius.circular(20.r)),
                filled: true,
                fillColor: StyleGeneral.GREEN,
              ),
              icon: Icon(Icons.keyboard_arrow_down_rounded, size: 32.sp, color: Colors.white),
              validator: (value) => value == null ? 'selection_vehicle_color'.tr() : null,
              dropdownColor:  StyleGeneral.GREEN,
              value: VehicleColorList.where( (i) => i.name == _vehicleColor.name).first ,
              onChanged: (VehicleColor? value) {
                setState(() {
                  _vehicleColor = value!;
                  _stateReviewVehicleColor = false;
                  _stateContainerVehicleColor = value.id == 0 ? true : false ;
                });
              },
              items: VehicleColorList.map((VehicleColor vehicleColor) {
                String name = vehicleColor.name!;
                String nameColor = '';

                if(name.contains("/")){
                  final splinted = name.split('/');
                  nameColor = defaultLocale!.contains("en_US") ? splinted[0].capitalize() : splinted[1].substring(1).capitalize();
                }else{
                  nameColor = name;
                }

                return DropdownMenuItem<VehicleColor>(
                  value: vehicleColor,
                  child: Text(nameColor , style: StyleGeneral.styleTextTextSpinner),
                );
              }).toList()
            )
          );

        } else if (snapshot.hasError) {
          return Icon(Icons.error_outline);
        } else {
          return ActivityIndicator();
        }
      }
    );

  }

  Widget _dataSpinnerVehicleManufacturer(){
    blocVehicleManufacturer.VehiclesManufacturer();

    return StreamBuilder(
      stream: blocVehicleManufacturer.data!,
      builder: (context , AsyncSnapshot<VehicleManufacturerModel> snapshot) {

        if (snapshot.hasData) {
          List<VehicleManufacturer> VehicleManufacturerList = snapshot.data!.vehiclesManufacturer!;

          if(_stateReviewVehicleManufacturer){
            VehicleManufacturerList.asMap().forEach((index, value) {
              if(value.id == _map['vehicle_manufacturer']['id']){
                _vehicleManufacturer = VehicleManufacturerList[index];
              }
            });
          }

          return Center(
            child:  DropdownButtonFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: StyleGeneral.GREEN, width: 2), borderRadius: BorderRadius.circular(20.r)),
                border: OutlineInputBorder(borderSide: BorderSide(color: StyleGeneral.GREEN, width: 2), borderRadius: BorderRadius.circular(20.r)),
                filled: true,
                fillColor: StyleGeneral.GREEN,
              ),
              icon: Icon(Icons.keyboard_arrow_down_rounded, size: 32.sp, color: Colors.white),
              validator: (value) => value == null ? 'selection_vehicle_manufacturer'.tr() : null,
              dropdownColor:  StyleGeneral.GREEN,
              value: VehicleManufacturerList.where( (i) => i.name == _vehicleManufacturer.name).first ,
              onChanged: (VehicleManufacturer? value) async {
                setState(() {
                  blocVehicles.manufacturerId = value!.id.toString();
                  _vehicleManufacturer = value;
                  _SelectedVehicle = false;
                  _loadingVehicle = true;
                  _stateReviewVehicleManufacturer = false;
                });

                await Future.delayed(const Duration(milliseconds: 500)).then((value) => setState(() { _loadingVehicle = false;}));

              },
              items: VehicleManufacturerList.map((VehicleManufacturer vehicleManufacturer) {
                return DropdownMenuItem<VehicleManufacturer>(
                  value: vehicleManufacturer,
                  child: Text(vehicleManufacturer.name! , style: StyleGeneral.styleTextTextSpinner),
                );
              }).toList()
            )
          );

        } else if (snapshot.hasError) {
          return Icon(Icons.error_outline);
        } else {
          return ActivityIndicator();
        }
      }
    );

  }

  Widget _dataSpinnerVehicles(){
    blocVehicles.VehiclesModel();

    return StreamBuilder(
      stream: blocVehicles.data!,
      builder: (context , AsyncSnapshot<VehicleModel> snapshot) {

        if (snapshot.hasData) {
          List<Vehicle> vehicles = snapshot.data!.vehicles!;

          if(!_SelectedVehicle){
            _vehicle = vehicles[0];
          }


          if(_stateReviewVehicle){
            vehicles.asMap().forEach((index, value) {
              if(value.id == _map['vehicle_model']['id']){
                _vehicle = vehicles[index];
              }
            });
          }

          return Center(
            child:  DropdownButtonFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: StyleGeneral.GREEN, width: 2), borderRadius: BorderRadius.circular(20.r)),
                border: OutlineInputBorder(borderSide: BorderSide(color: StyleGeneral.GREEN, width: 2), borderRadius: BorderRadius.circular(20.r)),
                filled: true,
                fillColor: StyleGeneral.GREEN,
              ),
              icon: Icon(Icons.keyboard_arrow_down_rounded, size: 32.sp, color: Colors.white),
              validator: (value) => value == null ? 'selection_vehicle_manufacturer'.tr() : null,
              dropdownColor:  StyleGeneral.GREEN,
              value: vehicles.where( (i) => i.name == _vehicle.name).first ,
              onChanged: (Vehicle? value) {
                setState(() {
                  _vehicle = value!;
                  _stateReviewVehicle = false;
                  _SelectedVehicle = true;
                  _stateContainerVehicle = value.id == 0 ? true : false;
                });
              },
              items: vehicles.map((Vehicle vehicle) {
                String name = vehicle.name!;
                String nameVehicle = '';

                if(name.contains("/")){
                  final splinted = name.split('/');
                  nameVehicle = defaultLocale!.contains("en_US") ? splinted[0].capitalize() : splinted[1].substring(1).capitalize();
                }else{
                  nameVehicle = name;
                }

                return DropdownMenuItem<Vehicle>(
                  value: vehicle,
                  child: Text(nameVehicle , style: StyleGeneral.styleTextTextSpinner),
                );
              }).toList()
            )
          );

        } else if (snapshot.hasError) {
          return Icon(Icons.error_outline);
        } else {
          return ActivityIndicator();
        }
      }
    );

  }
}
