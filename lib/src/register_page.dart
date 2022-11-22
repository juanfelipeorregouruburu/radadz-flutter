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

  final prefs = new Preferences();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formState = new GlobalKey<FormState>();

  SaveDriverBloc _saveDriverBloc = new SaveDriverBloc();
  DocumentType _documentType = new DocumentType();
  VehicleType _vehicleType = new VehicleType();

  bool _isLoading = false;
  bool _stateReviewVehicle = true;
  bool _stateReviewDocumentType = true;
  bool _passwordVisible = false;
  String _inputStrDate = '';

  /* editext*/
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
  TextEditingController _inputDateController = new TextEditingController();

  TextEditingController _inputPasswordController = new TextEditingController();
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
  final FocusNode _dateFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _saveDriverBloc.document_type = "1";
    _saveDriverBloc.vehicule_type = "1";
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
    _inputDateController.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop: () async{
        return false;
      },
      child: SafeArea(
        child: Scaffold(
          key: _scaffoldKey,
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.white,
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
                        Center(
                          child: Text(
                            'register_title'.tr(),
                            style: StyleGeneral.styleTextTitle,
                            textAlign: TextAlign.left,
                          ),
                        ),

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
                                          _fieldFocusChange(context, _nameFirstFocus, _nameSecondFocus);
                                        },
                                        labelText: 'form_first_name'.tr(),
                                        hintText: 'form_first_name'.tr(),
                                        validator: (String? value) {
                                          if (value!.isEmpty) return 'required_field'.tr();
                                          return null;
                                        },
                                      )
                                  ),

                                  SizedBox(
                                    width: 15.h,
                                  ),

                                  Flexible(
                                      flex: 2,
                                      child: InputTextField(
                                        focusNode: _nameSecondFocus,
                                        controller: _inputNameSecondController,
                                        onFieldSubmitted: (term) {
                                          _fieldFocusChange(context, _nameSecondFocus, _lastNameFirstFocus);
                                        },
                                        labelText: 'form_second_name'.tr(),
                                        hintText: 'form_second_name'.tr(),
                                        validator: (String? value) {
                                          return null;
                                        },
                                      )
                                  ),

                                ],
                              ),

                              SizedBox(
                                height: 15.h,
                              ),

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
                                          _fieldFocusChange(context, _lastNameFirstFocus, _lastNameSecondFocus);
                                        },
                                        labelText:'form_first_lastname'.tr(),
                                        hintText: 'form_first_lastname'.tr(),
                                        validator: (String? value) {
                                          if (value!.isEmpty) return 'required_field'.tr();
                                          return null;
                                        },
                                      )
                                  ),

                                  SizedBox(
                                    width: 15.w,
                                  ),

                                  Flexible(
                                      flex: 2,
                                      child: InputTextField(
                                        focusNode: _lastNameSecondFocus,
                                        controller: _inputLastNameSecondController,
                                        onFieldSubmitted: (term) {
                                          _fieldFocusChange(context, _lastNameSecondFocus, _emailFocus);
                                        },
                                        labelText: 'form_second_lastname'.tr(),
                                        hintText: 'form_second_lastname'.tr(),
                                        validator: (String? value) {

                                          return null;
                                        },
                                      )
                                  ),

                                ],
                              ),


                              SizedBox(
                                height: 15.h,
                              ),


                              SizedBox(
                                height: 15.h,
                              ),

                              Flexible(
                                  flex: 2,
                                  child: InputTextField(
                                    focusNode: _documentFocus,
                                    controller: _inputDocumentController,
                                    keyboardType: TextInputType.number,
                                    onFieldSubmitted: (term) {
                                      _fieldFocusChange(context, _documentFocus, _emailFocus);
                                    },
                                    labelText:'form_document_number'.tr(),
                                    hintText: 'form_document_number'.tr(),
                                    validator: (String? value) {
                                      if (value!.isEmpty) return 'required_field'.tr();
                                      return null;
                                    },
                                  )
                              ),

                              SizedBox(
                                height: 15.h,
                              ),

                              Flexible(
                                  flex: 2,
                                  child: InputTextField(
                                    focusNode: _emailFocus,
                                    controller: _inputEmailController,
                                    keyboardType: TextInputType.emailAddress,
                                    onFieldSubmitted: (term) {
                                      _fieldFocusChange(context, _emailFocus, _phoneFocus);
                                    },
                                    labelText:'form_email'.tr(),
                                    hintText: 'email@gmail.com',
                                    validator: (String? value) {
                                      if(value!.isEmpty){
                                        return 'required_field'.tr();
                                      }else if(validateEmail(value))
                                      return null;
                                    },
                                  )
                              ),

                              SizedBox(
                                height: 15.h,
                              ),

                              Flexible(
                                  flex: 2,
                                  child: InputTextField(
                                    focusNode: _phoneFocus,
                                    controller: _inputPhoneController,
                                    keyboardType: TextInputType.phone,
                                    onFieldSubmitted: (term) {
                                      _fieldFocusChange(context, _phoneFocus, _addressFocus);
                                    },
                                    labelText:'form_phone'.tr(),
                                    hintText: 'form_phone'.tr(),
                                    validator: (String? value) {
                                      if (value!.isEmpty) return 'required_field'.tr();
                                      return null;
                                    },
                                  )
                              ),


                              SizedBox(
                                height: 15.h,
                              ),


                              Flexible(
                                  flex: 2,
                                  child: InputTextField(
                                    focusNode: _addressFocus,
                                    controller: _inputAddressController,
                                    keyboardType: TextInputType.text,
                                    onFieldSubmitted: (term) {
                                      _fieldFocusChange(context, _addressFocus, _numberLicenceFocus);
                                    },
                                    labelText:'form_address'.tr(),
                                    hintText: 'form_address'.tr(),
                                    validator: (String? value) {
                                      if (value!.isEmpty) return 'required_field'.tr();
                                      return null;
                                    },
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
                                      _fieldFocusChange(context, _numberLicenceFocus, _yearLicenceFocus);
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


                              SizedBox(
                                height: 15.h,
                              ),

                              Flexible(
                                  flex: 2,
                                  child: InputTextField(
                                    focusNode: _yearLicenceFocus,
                                    controller: _inputYearLicenceController,
                                    keyboardType: TextInputType.number,
                                    onFieldSubmitted: (term) {
                                      _fieldFocusChange(context, _yearLicenceFocus, _dateFocus);
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

                              SizedBox(
                                height: 15.h,
                              ),

                              Flexible(
                                  flex: 2,
                                  child: InputTextField(
                                    focusNode: _dateFocus,
                                    controller: _inputDateController,
                                    onTap: (){

                                    },
                                    keyboardType: TextInputType.text,
                                    onFieldSubmitted: (term) {
                                      _fieldFocusChange(context, _dateFocus, _passwordFocus);
                                    },
                                    hintText: 'yyyy-mm-dd',
                                    labelText:'form_birth_date'.tr(),
                                    validator: (String? value) {
                                      if (value!.isEmpty) return 'required_field'.tr();
                                      return null;
                                    },
                                  )
                              ),

                              SizedBox(
                                height: 15.h,
                              ),

                              CustomInputTextFieldPassword(
                                focusNode: _passwordFocus,
                                controller: _inputPasswordController,
                                keyboardType: TextInputType.text ,
                                textInputAction: TextInputAction.done,
                                obscureText: !_passwordVisible,
                                hintText:  'enter_password'.tr(),
                                labelText:'enter_password'.tr(),
                                validator:  (String? value) {
                                  if (value!.isEmpty) return 'required_field'.tr();
                                  return null;
                                },
                                onPressed: (){
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),


                              SizedBox(
                                height: 15.h,
                              ),

                              Text(
                                'register_routine_daily_title'.tr(),
                                style: StyleGeneral.styleTextDescription,
                                textAlign: TextAlign.left,
                              ),

                              SizedBox(
                                height: 15.h,
                              ),

                              /////
                              _isLoading ? ActivityIndicator() :CustomButton(
                                text: 'register_button'.tr(),
                                fullscreen: true,
                                onTap: (){
                                 _SaveDriver();
                                },
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
      )
    );

  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  _SaveDriver() async {

    if (formState.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      _saveDriverBloc.name_first = _inputNameFirstController.text.trim();
      _saveDriverBloc.name_second = _inputNameSecondController.text.trim();
      _saveDriverBloc.lastName_first = _inputLastNameFirstController.text.trim();
      _saveDriverBloc.lastName_second = _inputLastNameSecondController.text.trim();
      _saveDriverBloc.document_number = _inputDocumentController.text.trim();
      _saveDriverBloc.email = _inputEmailController.text.trim().toLowerCase();
      _saveDriverBloc.phone = _inputPhoneController.text.trim();
      _saveDriverBloc.address = _inputAddressController.text.trim();
      _saveDriverBloc.password = _inputPasswordController.text.trim();
      _saveDriverBloc.date_birth = _inputDateController.text.trim();
      _saveDriverBloc.licence_number = _inputNumberLicenceController.text.trim();
      _saveDriverBloc.vehicule_year = _inputYearLicenceController.text.trim();


      _saveDriverBloc.SaveDriver();

      _saveDriverBloc.data.listen((data) {
        setState(() {
          _isLoading = false;
        });
        if (data.error == 1) {
          Navigator.pushReplacementNamed(context, "login");
          Preferences.setDriverId = data.driver_id;
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
      });
    }

  }
}
