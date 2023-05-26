import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formState = new GlobalKey<FormState>();

  SaveDriverBloc _saveDriverBloc = new SaveDriverBloc();
  DocumentType _documentType = new DocumentType();
  VehicleManufacturer _vehicleManufacturer = new VehicleManufacturer();
  Vehicle _vehicle = new Vehicle();
  VehicleType _vehicleType = new VehicleType();
  VehicleColor _vehicleColor = new VehicleColor();

  bool _isLoading = false;

  bool _passwordVisible = false;

  //Date
  String _inputStrDate = '';
  String _inputStrDateExpirationTechnical = '';
  String _inputStrDateExpirationSOAT = '';
  String _inputStrDateExpirationLicence = '';
  String _routineDailyId = '';


  bool _stateReviewDocumentType = true;
  bool _stateReviewVehicleType = true;
  bool _stateReviewVehicleColor = true;
  bool _stateContainerVehicleColor = false;
  bool _stateReviewVehicleManufacturer = true;
  bool _stateReviewVehicle = true;
  bool _stateContainerVehicle = false;
  bool stateVehicleOwner = false;
  int _currentTimeValue = 1;


  TextEditingController _inputNameFirstController = new TextEditingController();
  TextEditingController _inputNameSecondController = new TextEditingController();
  TextEditingController _inputLastNameFirstController = new TextEditingController();
  TextEditingController _inputLastNameSecondController = new TextEditingController();
  TextEditingController _inputDocumentController = new TextEditingController();
  TextEditingController _inputEmailController = new TextEditingController();
  TextEditingController _inputPhoneController = new TextEditingController();
  TextEditingController _inputAddressController = new TextEditingController();
  TextEditingController _inputNumberLicenceController = new TextEditingController();
  TextEditingController _inputYearLicenceController = new TextEditingController();
  TextEditingController _inputEngineSerialNumberController = new TextEditingController();
  TextEditingController _inputPasswordController = new TextEditingController();

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
  final FocusNode _yearLicenceFocus = FocusNode();
  final FocusNode _engineSerialNumberFocus = FocusNode();
  final FocusNode _dateFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _nameOwnerFocus = FocusNode();
  final FocusNode _documentOwnerFocus = FocusNode();
  final FocusNode _nameColorFocus = FocusNode();
  final FocusNode _nameVehicleFocus = FocusNode();


  DateTime date = DateTime.now();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _saveDriverBloc.documentType = "1";
    _saveDriverBloc.vehicleType = "1";

    blocVehicles.manufacturerId = "1";

    formatDate(date ,0);
    formatDate(date ,1);
    formatDate(date ,2);
    formatDate(date ,3);
  }

  @override
  void dispose() {
    super.dispose();
    _inputNameFirstController.dispose();
    _inputNameSecondController.dispose();
    _inputLastNameFirstController.dispose();
    _inputLastNameSecondController.dispose();
    _inputDocumentController.dispose();
    _inputEmailController.dispose();
    _inputPhoneController.dispose();
    _inputAddressController.dispose();
    _inputNumberLicenceController.dispose();
    _inputYearLicenceController.dispose();
    _inputNameOwnerController.dispose();
    _inputDocumentOwnerController.dispose();
    _inputNameColorController.dispose();
    _inputNameVehicleController.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: BackButton(color: Colors.white),
          backgroundColor: Colors.black,
          title: Text('register_title'.tr() , style: StyleGeneral.styleTextTitleToolbar)
        ),
        body: Stack(
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.all(15.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(
                        height: 15.h,
                      ),


                      Form(
                        key: formState,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 15.h),
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
                            CustomInputTextFieldPassword(
                              focusNode: _passwordFocus,
                              controller: _inputPasswordController,
                              keyboardType: TextInputType.text ,
                              textInputAction: TextInputAction.done,
                              obscureText: !_passwordVisible,
                              hintText:  'enter_password'.tr(),
                              labelText:'enter_password'.tr(),
                              validator:  (String? value) {
                                if (value!.isEmpty) {
                                  return 'required_field'.tr();
                                }else if (!validatePassword(value)) {
                                  return 'required_password_validate'.tr();
                                }
                                return null;
                              },
                              onPressed: (){
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              }
                            ),

                            SizedBox(height: 15.h),

                            Flexible(
                              flex: 2,
                              child: InputTextField(
                                focusNode: _phoneFocus,
                                controller: _inputPhoneController,
                                keyboardType: TextInputType.phone,
                                onFieldSubmitted: (term) {
                                  fieldFocusChange(context, _phoneFocus, _addressFocus);
                                },
                                labelText:'form_phone'.tr(),
                                hintText: 'form_phone'.tr(),
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
                                }
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
                            _dataSpinnerVehicles(),
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
                                },
                              ),
                            SizedBox(height: 15.h),

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

                            SizedBox(
                              height: 15.h,
                            ),

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

                            SizedBox(height: 15.h),

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
                                        decoration: BoxDecoration(color: stateVehicleOwner ? StyleGeneral.GREEN : StyleGeneral.WHITE, shape: BoxShape.circle, border: Border.all(color: StyleGeneral.GREEN, width: 1.5)),
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

                            if(stateVehicleOwner)

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
                                      },
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
                              ),//
                            //
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
                              text: 'register_button'.tr(),
                              fullscreen: true,
                              onTap: (){
                               _SaveDriver();
                              }
                            )
                          ]
                        )
                      )
                    ]
                  )
                )
              )
            )
          ]
        )
      )
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
                minimumDate:  date ,
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
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: StyleGeneral.FILL_COLOR, border: Border.all(color: StyleGeneral.GREEN)),
        child: Text(getInputDate(typeDate), style: TextStyle(color: Colors.black87, fontSize: ScreenUtil().setSp(15), fontFamily: "Poppins-Regular",))
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
              children:routinesDriver.map((timeValue) => RadioListTile<int>(
                groupValue: _currentTimeValue,
                activeColor: StyleGeneral.GREEN,
                title: Text(timeValue.name!, textAlign: TextAlign.left, style: TextStyle(color: StyleGeneral.BLACK , fontSize: ScreenUtil().setSp(13) , fontFamily: 'Poppins-Regular') ),
                value: timeValue.id!,
                onChanged: (val) {
                  setState(() {
                    _routineDailyId = val!.toString();
                    _currentTimeValue = val;
                  });
                }
              )).toList(),
            );

          } else if (snapshot.hasError) {
            return Icon(Icons.error_outline);
          } else {
            return CircularProgressIndicator();
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
                _documentType =documentTypeList[0];
              });
            }

            return Center(
              child:  DropdownButtonFormField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: StyleGeneral.GREEN, width: 2), borderRadius: BorderRadius.circular(20)),
                  border: OutlineInputBorder(borderSide: BorderSide(color: StyleGeneral.GREEN, width: 2), borderRadius: BorderRadius.circular(20)),
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
                    _saveDriverBloc.documentType = value.id.toString();
                    _stateReviewDocumentType = false;
                  });
                },
                items: documentTypeList.map((DocumentType documentType) {
                  return DropdownMenuItem<DocumentType>(
                    value: documentType,
                    child: Text(documentType.name! , style: StyleGeneral.styleTextTextSpinner),
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
              _vehicleType  = VehicleTypeList[0];
            });
          }

          return Center(
            child:  DropdownButtonFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: StyleGeneral.GREEN, width: 2), borderRadius: BorderRadius.circular(20)),
                border: OutlineInputBorder(borderSide: BorderSide(color: StyleGeneral.GREEN, width: 2), borderRadius: BorderRadius.circular(20)),
                filled: true,
                fillColor: StyleGeneral.GREEN,
              ),
              icon: Icon(Icons.keyboard_arrow_down_rounded, size: 32, color: Colors.white),
              validator: (value) => value == null ? 'selection_vehicle_type'.tr() : null,
              dropdownColor:  StyleGeneral.GREEN,
              value: VehicleTypeList.where( (i) => i.name == _vehicleType.name).first ,
              onChanged: (VehicleType? value) {
                setState(() {
                  _vehicleType = value!;
                  _stateReviewVehicleType = false;
                  _saveDriverBloc.vehicleType = value.id.toString();
                });
              },
              items: VehicleTypeList.map((VehicleType vehicleType) {
                return DropdownMenuItem<VehicleType>(
                  value: vehicleType,
                  child: Text(vehicleType.name! , style: StyleGeneral.styleTextTextSpinner),
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
              _vehicleColor  = VehicleColorList[0];
            });
          }

          return Center(
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: StyleGeneral.GREEN, width: 2), borderRadius: BorderRadius.circular(20)),
                border: OutlineInputBorder(borderSide: BorderSide(color: StyleGeneral.GREEN, width: 2), borderRadius: BorderRadius.circular(20)),
                filled: true,
                fillColor: StyleGeneral.GREEN,
              ),
              icon: Icon(Icons.keyboard_arrow_down_rounded, size: 32, color: Colors.white),
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
                return DropdownMenuItem<VehicleColor>(
                  value: vehicleColor,
                  child: Text(vehicleColor.name! , style: StyleGeneral.styleTextTextSpinner),
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
              _vehicleManufacturer =VehicleManufacturerList[0];
            });
          }

          return Center(
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: StyleGeneral.GREEN, width: 2), borderRadius: BorderRadius.circular(20)),
                border: OutlineInputBorder(borderSide: BorderSide(color: StyleGeneral.GREEN, width: 2), borderRadius: BorderRadius.circular(20)),
                filled: true,
                fillColor: StyleGeneral.GREEN,
              ),
              icon: Icon(Icons.keyboard_arrow_down_rounded, size: 32, color: Colors.white),
              validator: (value) => value == null ? 'selection_vehicle_manufacturer'.tr() : null,
              dropdownColor:  StyleGeneral.GREEN,
              value: VehicleManufacturerList.where( (i) => i.name == _vehicleManufacturer.name).first ,
              onChanged: (VehicleManufacturer? value) {
                setState(() {
                  blocVehicles.manufacturerId = value!.id.toString();
                  _vehicleManufacturer = value;
                  _stateReviewVehicleManufacturer = false;
                });
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

          vehicles.add(Vehicle(id: 0, name: 'selection_name_text_color'.tr() ));
          if(_stateReviewVehicle){
            vehicles.asMap().forEach((index, value) {
              _vehicle = vehicles[0];
            });
          }

          return Center(
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: StyleGeneral.GREEN, width: 2), borderRadius: BorderRadius.circular(20)),
                border: OutlineInputBorder(borderSide: BorderSide(color: StyleGeneral.GREEN, width: 2), borderRadius: BorderRadius.circular(20)),
                filled: true,
                fillColor: StyleGeneral.GREEN,
              ),
              icon: Icon(Icons.keyboard_arrow_down_rounded, size: 32, color: Colors.white),
              validator: (value) => value == null ? 'selection_vehicle_manufacturer'.tr() : null,
              dropdownColor:  StyleGeneral.GREEN,
              value: vehicles.where( (i) => i.name == _vehicle.name).first ,
              onChanged: (Vehicle? value) {
                setState(() {
                  _vehicle = value!;
                  _stateReviewVehicle = false;
                  _stateContainerVehicle = value.id == 0 ? true : false;
                });
              },
              items: vehicles.map((Vehicle vehicle) {
                return DropdownMenuItem<Vehicle>(
                  value: vehicle,
                  child: Text(vehicle.name! , style: StyleGeneral.styleTextTextSpinner),
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
          margin: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          color: CupertinoColors.systemBackground.resolveFrom(context),
          child: SafeArea(
            top: false,
            child: child,
          ),
        ));
  }


  _SaveDriver() async {


    if (formState.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      _saveDriverBloc.nameFirst = _inputNameFirstController.text.trim();
      _saveDriverBloc.nameSecond = _inputNameSecondController.text.trim();
      _saveDriverBloc.lastNameFirst = _inputLastNameFirstController.text.trim();
      _saveDriverBloc.lastNameSecond = _inputLastNameSecondController.text.trim();
      _saveDriverBloc.birthDate = _inputStrDate;
      _saveDriverBloc.documentNumber = _inputDocumentController.text.trim();
      _saveDriverBloc.email = _inputEmailController.text.trim().toLowerCase();
      _saveDriverBloc.phone = _inputPhoneController.text.trim();
      _saveDriverBloc.address = _inputAddressController.text.trim();
      _saveDriverBloc.password = _inputPasswordController.text.trim();
      _saveDriverBloc.licencePlateNumber = _inputNumberLicenceController.text.trim();
      _saveDriverBloc.engineSerialNumber = _inputEngineSerialNumberController.text.trim();
      _saveDriverBloc.vehicleYear = _inputYearLicenceController.text.trim();
      _saveDriverBloc.drivingDailyRoutine = _routineDailyId;
      _saveDriverBloc.vehicleModel =  _vehicle.id == 0 ? _inputNameVehicleController.text.trim() :  _vehicle.id.toString();
      _saveDriverBloc.vehicleManufacturer = _vehicleManufacturer.id.toString();
      _saveDriverBloc.vehicleColor = _vehicle.id == 0 ? _inputNameColorController.text.trim() : _vehicleColor.id.toString();
      _saveDriverBloc.isOwner = stateVehicleOwner ? "0" : "1" ;
      _saveDriverBloc.ownerIdNumber = _inputDocumentOwnerController.text.trim();
      _saveDriverBloc.ownerVehicleName = _inputNameOwnerController.text.trim();
      _saveDriverBloc.expirationDateTechnicalMechanical = _inputStrDateExpirationTechnical;
      _saveDriverBloc.expirationDateSOAT = _inputStrDateExpirationSOAT;
      _saveDriverBloc.expirationDateDriverLicence = _inputStrDateExpirationLicence;


      _saveDriverBloc.SaveDriver();

      _saveDriverBloc.data.listen((data) {
        setState(() {
          _isLoading = false;
        });
        if (data.error == 1) {
          Navigator.pushReplacementNamed(context, "login");
          Preferences.setDriverId = data.driver_id;
          var dialog = AlertMessageError(
            icon: "success",
            message: "Your registration is successful!  Please log in."
          );

          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              Future.delayed(Duration(seconds: 3), () {
                Navigator.of(context).pop(true);
              });
              return dialog;
            }
          );

        } else {
          var dialog = AlertMessageError(
            icon: "error",
            message: data.response
          );

          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              Future.delayed(Duration(seconds: 3), () {
                Navigator.of(context).pop(true);
              });
              return dialog;
            }
          );
        }
       }
      );
    }
  }
}
