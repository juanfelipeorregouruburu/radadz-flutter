import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final prefs = new Preferences();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> formState = new GlobalKey<FormState>();

  SaveDriverBloc _saveDriverBloc;
  DocumentType _documentType;
  VehicleType _vehicleType;

  bool _isLoading = false;
  bool _stateReviewVehicle = true;
  bool _stateReviewDocumentType = true;
  bool _passwordVisible = false;
  String _inputStrDate;

  /* editext*/
  TextEditingController _inputNameFirstController = new TextEditingController();
  TextEditingController _inputNameSecondController = new TextEditingController();
  TextEditingController _inputLastNameFirstController = new TextEditingController();
  TextEditingController _inputLastNameSecondController = new TextEditingController();
  TextEditingController _inputDocumentoController = new TextEditingController();
  TextEditingController _inputEmailController = new TextEditingController();
  TextEditingController _inputPhoneController = new TextEditingController();
  TextEditingController _inputAddressController = new TextEditingController();
  TextEditingController _inputNummberLicenceController = new TextEditingController();
  TextEditingController _inputYearLicenceController = new TextEditingController();
  TextEditingController _inputDateController = new TextEditingController();

  TextEditingController _inputPasswordController = new TextEditingController();
  final FocusNode _nameFirstFocus = FocusNode();
  final FocusNode _nameSecondFocus = FocusNode();
  final FocusNode _lastNameFirstFocus = FocusNode();
  final FocusNode _lastNameSecondFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _documentoFocus = FocusNode();
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
    _saveDriverBloc = new SaveDriverBloc();
    _passwordVisible = false;
    questionRegisterList = QuestionRegister.getQuestions();

    questionRegisterList.asMap().forEach((index, value) {
       selectionQuestion = questionRegisterList[0];
      _saveDriverBloc.driving_daily_routine = questionRegisterList[0].textQuestion;
    });

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
    _inputDocumentoController.dispose();
    _inputEmailController.dispose();
    _inputPhoneController.dispose();
    _inputAddressController.dispose();
    _inputNummberLicenceController.dispose();
    _inputYearLicenceController.dispose();
    _inputDateController.dispose();
  }


  List<QuestionRegister> questionRegisterList;
  QuestionRegister selectionQuestion;

  setSelectedQuestion(QuestionRegister questionRegister) {
    setState(() {
      selectionQuestion = questionRegister;
    });
  }

  createRadioListQuestion() {
    List<Widget> widgets = [];
    for (QuestionRegister question in questionRegisterList) {
      widgets.add(
        RadioListTile(
          value: question,
          groupValue: selectionQuestion,
          title: Text(question.textQuestion , overflow: TextOverflow.ellipsis,
            softWrap: true,
            maxLines: 2,
            style: TextStyle(
              color: StyleGeneral.GREY_LIGTH,
              fontSize: ScreenUtil().setSp(15),
              fontFamily: 'Poppins-Regular',
            ),
          ),
          onChanged: (currentQuestion) {
            setSelectedQuestion(currentQuestion);
          },
          selected: setSelectedQuestion == question,
          activeColor: StyleGeneral.GREEN,
        ),
      );
    }
    return widgets;
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
                                      child: InputTextfield(
                                        focusNode: _nameFirstFocus,
                                        controller: _inputNameFirstController,
                                        onFieldSubmitted: (term) {
                                          _fieldFocusChange(context, _nameFirstFocus, _nameSecondFocus);
                                        },
                                        labelText: 'form_first_name'.tr(),
                                        hintText: 'form_first_name'.tr(),
                                        validator: (value) {
                                          if (value.isEmpty) return 'required_field'.tr();
                                          return null;
                                        },
                                      )
                                  ),

                                  SizedBox(
                                    width: 15.h,
                                  ),

                                  Flexible(
                                      flex: 2,
                                      child: InputTextfield(
                                        focusNode: _nameSecondFocus,
                                        controller: _inputNameSecondController,
                                        onFieldSubmitted: (term) {
                                          _fieldFocusChange(context, _nameSecondFocus, _lastNameFirstFocus);
                                        },
                                        labelText: 'form_second_name'.tr(),
                                        hintText: 'form_second_name'.tr(),
                                        validator: (value) {
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
                                      child: InputTextfield(
                                        focusNode: _lastNameFirstFocus,
                                        controller: _inputLastNameFirstController,
                                        onFieldSubmitted: (term) {
                                          _fieldFocusChange(context, _lastNameFirstFocus, _lastNameSecondFocus);
                                        },
                                        labelText:'form_first_lastname'.tr(),
                                        hintText: 'form_first_lastname'.tr(),
                                        validator: (value) {
                                          if (value.isEmpty) return 'required_field'.tr();
                                          return null;
                                        },
                                      )
                                  ),

                                  SizedBox(
                                    width: 15.w,
                                  ),

                                  Flexible(
                                      flex: 2,
                                      child: InputTextfield(
                                        focusNode: _lastNameSecondFocus,
                                        controller: _inputLastNameSecondController,
                                        onFieldSubmitted: (term) {
                                          _fieldFocusChange(context, _lastNameSecondFocus, _emailFocus);
                                        },
                                        labelText: 'form_second_lastname'.tr(),
                                        hintText: 'form_second_lastname'.tr(),
                                        validator: (value) {

                                          return null;
                                        },
                                      )
                                  ),

                                ],
                              ),


                              SizedBox(
                                height: 15.h,
                              ),

                              Container(
                                  width: double.infinity,
                                  child: _dataSpinnerDocumentType()
                              ),

                              SizedBox(
                                height: 15.h,
                              ),

                              Flexible(
                                  flex: 2,
                                  child: InputTextfield(
                                    focusNode: _documentoFocus,
                                    controller: _inputDocumentoController,
                                    keyboardType: TextInputType.number,
                                    onFieldSubmitted: (term) {
                                      _fieldFocusChange(context, _documentoFocus, _emailFocus);
                                    },
                                    labelText:'form_document_number'.tr(),
                                    hintText: 'form_document_number'.tr(),
                                    validator: (value) {
                                      if (value.isEmpty) return 'required_field'.tr();
                                      return null;
                                    },
                                  )
                              ),

                              SizedBox(
                                height: 15.h,
                              ),

                              Flexible(
                                  flex: 2,
                                  child: InputTextfield(
                                    focusNode: _emailFocus,
                                    controller: _inputEmailController,
                                    keyboardType: TextInputType.emailAddress,
                                    onFieldSubmitted: (term) {
                                      _fieldFocusChange(context, _emailFocus, _phoneFocus);
                                    },
                                    labelText:'form_email'.tr(),
                                    hintText: 'email@gmail.com',
                                    validator: (value) {
                                      if(value.isEmpty){
                                        return 'required_field'.tr();
                                      }else {
                                        Pattern pattern =
                                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                        RegExp regex = new RegExp(pattern);
                                        bool email_value = (!regex.hasMatch(value)) ? false : true;

                                        if(!email_value)
                                          return 'required_email'.tr();

                                      }
                                      return null;
                                    },
                                  )
                              ),

                              SizedBox(
                                height: 15.h,
                              ),

                              Flexible(
                                  flex: 2,
                                  child: InputTextfield(
                                    focusNode: _phoneFocus,
                                    controller: _inputPhoneController,
                                    keyboardType: TextInputType.phone,
                                    onFieldSubmitted: (term) {
                                      _fieldFocusChange(context, _phoneFocus, _addressFocus);
                                    },
                                    labelText:'form_phone'.tr(),
                                    hintText: 'form_phone'.tr(),
                                    validator: (value) {
                                      if (value.isEmpty) return 'required_field'.tr();
                                      return null;
                                    },
                                  )
                              ),


                              SizedBox(
                                height: 15.h,
                              ),


                              Flexible(
                                  flex: 2,
                                  child: InputTextfield(
                                    focusNode: _addressFocus,
                                    controller: _inputAddressController,
                                    keyboardType: TextInputType.text,
                                    onFieldSubmitted: (term) {
                                      _fieldFocusChange(context, _addressFocus, _numberLicenceFocus);
                                    },
                                    labelText:'form_address'.tr(),
                                    hintText: 'form_address'.tr(),
                                    validator: (value) {
                                      if (value.isEmpty) return 'required_field'.tr();
                                      return null;
                                    },
                                  )
                              ),

                              SizedBox(
                                height: 15.h,
                              ),

                              Flexible(
                                  flex: 2,
                                  child: InputTextfield(
                                    focusNode: _numberLicenceFocus,
                                    controller: _inputNummberLicenceController,
                                    keyboardType: TextInputType.text,
                                    onFieldSubmitted: (term) {
                                      _fieldFocusChange(context, _numberLicenceFocus, _yearLicenceFocus);
                                    },
                                    labelText:'form_license_plate_number'.tr(),
                                    hintText: 'form_license_plate_number'.tr(),
                                    validator: (value) {
                                      if (value.isEmpty) return 'required_field'.tr();
                                      return null;
                                    }
                                  )
                              ),

                              SizedBox(
                                height: 15.h,
                              ),

                              Container(
                                  width: double.infinity,
                                  child: _dataSpinnerVehicleType()
                              ),

                              SizedBox(
                                height: 15.h,
                              ),

                              Flexible(
                                  flex: 2,
                                  child: InputTextfield(
                                    focusNode: _yearLicenceFocus,
                                    controller: _inputYearLicenceController,
                                    keyboardType: TextInputType.number,
                                    onFieldSubmitted: (term) {
                                      _fieldFocusChange(context, _yearLicenceFocus, _dateFocus);
                                    },
                                    maxLength: 4,
                                    labelText:'form_vehicle_year'.tr(),
                                    hintText: 'form_vehicle_year'.tr(),
                                    validator: (value) {
                                      if (value.isEmpty) return 'required_field'.tr();
                                      return null;
                                    }
                                  )
                              ),

                              SizedBox(
                                height: 15.h,
                              ),

                              Flexible(
                                  flex: 2,
                                  child: InputTextfield(
                                    focusNode: _dateFocus,
                                    controller: _inputDateController,
                                    onTap: (){
                                      _selectDate(context);
                                    },
                                    keyboardType: TextInputType.text,
                                    onFieldSubmitted: (term) {
                                      _fieldFocusChange(context, _dateFocus, _passwordFocus);
                                    },
                                    hintText: 'yyyy-mm-dd',
                                    labelText:'form_birth_date'.tr(),
                                    validator: (value) {
                                      if (value.isEmpty) return 'required_field'.tr();
                                      return null;
                                    },
                                  )
                              ),

                              SizedBox(
                                height: 15.h,
                              ),

                              CustomInputTextfieldPassword(
                                focusNode: _passwordFocus,
                                controller: _inputPasswordController,
                                keyboardType: TextInputType.text ,
                                textInputAction: TextInputAction.done,
                                obscureText: !_passwordVisible,
                                hintText:  'enter_password'.tr(),
                                labelText:'enter_password'.tr(),
                                validator:  (value) {
                                  if (value.isEmpty) return 'required_field'.tr();
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

                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                    children: createRadioListQuestion(),
                                  ),

                                ],
                              ),


                              SizedBox(
                                height: 25.h,
                              ),

                              /////
                              _isLoading ? ActivityIndicator() :CustomButton(
                                text: 'register_button'.tr(),
                                fullscreen: true,
                                onTap: (){
                                 _SaveDriver();
                                },
                              ),

                            ],

                          ),

                        )

                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );

  }

  Widget _dataSpinnerDocumentType(){
    double width = MediaQuery.of(context).size.width;

    blocDocumentType.DocumentTypes();
    return StreamBuilder(
      stream: blocDocumentType.data,
      builder: (context , AsyncSnapshot<DocumentTypeModel> snapshot){
        if(snapshot.hasData){
          List<DocumentType> documentTypeList = snapshot.data.documentsType;

          if(documentTypeList != null){

            if(_stateReviewDocumentType){
              documentTypeList.asMap().forEach((index, value) {
                _documentType =documentTypeList[0];
              });
            }

            return Center(
              child: Container(
               width: width,
               height: 60.h,
               padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
               margin: EdgeInsets.all(0.h),
               decoration: BoxDecoration(
                 color: StyleGeneral.BLACK_LIGTH,
                 borderRadius: BorderRadius.circular(10.r),
                 border: Border.all(
                     color: Colors.white,
                     style: BorderStyle.solid,
                     width: 1
                 )
               ),
               child: DropdownButtonHideUnderline(
                 child: Theme(
                   data: Theme.of(context).copyWith(
                     canvasColor: StyleGeneral.GREEN,
                   ),
                   child: DropdownButton<DocumentType>(
                     hint: Text('selection_document_type'.tr(), style: StyleGeneral.styleTextTitleSpinner),
                     iconSize: 32.h,
                     value: _documentType == null ? _documentType : documentTypeList.where( (i) => i.name == _documentType.name).first ,
                     items: documentTypeList.map((DocumentType documentType) {
                       return DropdownMenuItem<DocumentType>(
                           value: documentType ,
                           child: new Text(documentType.name, style: StyleGeneral.styleTextTextSpinner)
                       );
                     }).toList(),
                     onChanged: (DocumentType documentType){
                       setState(() {
                         _documentType = documentType;
                         _saveDriverBloc.document_type = _documentType.id;
                         _stateReviewDocumentType = false;
                       });
                     },
                     isExpanded: true,
                     iconEnabledColor: Colors.white,
                   ),
                 ),
               ),
              )
            );
          }

        }else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }else {
            return ActivityIndicator();
        }
      }
    );

  }

  Widget _dataSpinnerVehicleType(){
    double width = MediaQuery.of(context).size.width;

    blocVehicleType.VehicleTypes();
    return StreamBuilder(
        stream: blocVehicleType.data,
        builder: (context , AsyncSnapshot<VehicleTypeModel> snapshot){
          if(snapshot.hasData){
           List<VehicleType> vehicleTypeList = snapshot.data.vehiclesType;

           if(vehicleTypeList != null){

              if(_stateReviewVehicle){
                vehicleTypeList.asMap().forEach((index, value) {
                  _vehicleType =vehicleTypeList[0];
                });
              }

              return Center(
                  child: Container(
                    width: width,
                    height: 60.h,
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    margin: EdgeInsets.all(0.h),
                    decoration: BoxDecoration(
                        color: StyleGeneral.BLACK_LIGTH,
                        borderRadius: BorderRadius.circular(15.r),
                        border: Border.all(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 1
                        )
                    ),
                    child: DropdownButtonHideUnderline(
                      child: Theme(
                        data: Theme.of(context).copyWith(
                          canvasColor: StyleGeneral.GREEN,
                        ),
                        child: DropdownButton<VehicleType>(
                          hint: Text('selection_vehicle_type'.tr(), style: StyleGeneral.styleTextTitleSpinner),
                          iconSize: 32.h,
                          value: _vehicleType == null ? _vehicleType : vehicleTypeList.where( (i) => i.name == _vehicleType.name).first ,
                          items: vehicleTypeList.map((VehicleType vehicleType) {
                            return DropdownMenuItem<VehicleType>(
                                value: vehicleType ,
                                child: new Text(vehicleType.name, style: StyleGeneral.styleTextTextSpinner)
                            );
                          }).toList(),
                          onChanged: (VehicleType vehicleType){
                            setState(() {
                              _vehicleType = vehicleType;
                              _saveDriverBloc.vehicule_type = _vehicleType.id;
                              _stateReviewVehicle = false;
                            });
                          },
                          isExpanded: true,
                          iconEnabledColor: Colors.white,
                        ),
                      ),
                    ),
                  )
              );
            }
          }else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }else {
            return ActivityIndicator();
          }
        }
    );

  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  _selectDate(BuildContext context) async{
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: new DateTime.now(),
      firstDate: DateTime(1960),
      lastDate: DateTime.now(),
    );

    if(picked != null){
      setState(() {
        _inputStrDate = DateFormat("yyyy-MM-dd").format(DateTime.parse(picked.toString()));
        _inputDateController.text = _inputStrDate;
      });
    }

  }

  _SaveDriver() async {

    if (formState.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });

      _saveDriverBloc.name_first = _inputNameFirstController.text.trim();
      _saveDriverBloc.name_second = _inputNameSecondController.text.trim();
      _saveDriverBloc.lastName_first = _inputLastNameFirstController.text.trim();
      _saveDriverBloc.lastName_second = _inputLastNameSecondController.text.trim();
      _saveDriverBloc.document_number = _inputDocumentoController.text.trim();
      _saveDriverBloc.email = _inputEmailController.text.trim().toLowerCase();
      _saveDriverBloc.phone = _inputPhoneController.text.trim();
      _saveDriverBloc.address = _inputAddressController.text.trim();
      _saveDriverBloc.password = _inputPasswordController.text.trim();
      _saveDriverBloc.date_birth = _inputDateController.text.trim();
      _saveDriverBloc.licence_number = _inputNummberLicenceController.text.trim();
      _saveDriverBloc.vehicule_year = _inputYearLicenceController.text.trim();
      _saveDriverBloc.driving_daily_routine = selectionQuestion.textQuestion;


      _saveDriverBloc.SaveDriver();

      _saveDriverBloc.data.listen((data) {
        setState(() {
          _isLoading = false;
        });
        if (data.error == 1) {
          Navigator.pushReplacementNamed(context, "login");
          prefs.setDriverId = data.driver_id;
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
