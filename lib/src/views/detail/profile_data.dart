import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:radadz_app/src/blog/update_driver_bloc.dart';
import 'package:radadz_app/src/utils/export.dart';


class ProfileDriver extends StatefulWidget {

  const ProfileDriver({Key key}) : super(key: key);

  @override
  _ProfileDriverState createState() => _ProfileDriverState();
}

class _ProfileDriverState extends State<ProfileDriver> {

  final prefs = new Preferences();
  bool _isLoading = false;
  UpdateDriverBloc _updateDriverBloc;
  Map<String, dynamic> _map;

  /* editext*/
  TextEditingController _inputNameFirstController = new TextEditingController();
  TextEditingController _inputNameSecondController = new TextEditingController();
  TextEditingController _inputLastNameFirstController = new TextEditingController();
  TextEditingController _inputLastNameSecondController = new TextEditingController();
  TextEditingController _inputDocumentoController = new TextEditingController();
  TextEditingController _inputAddressController = new TextEditingController();
  TextEditingController _inputNummberLicenceController = new TextEditingController();
  TextEditingController _inputYearLicenceController = new TextEditingController();
  TextEditingController _inputDateController = new TextEditingController();


  final FocusNode _nameFirstFocus = FocusNode();
  final FocusNode _nameSecondFocus = FocusNode();
  final FocusNode _lastNameFirstFocus = FocusNode();
  final FocusNode _lastNameSecondFocus = FocusNode();
  final FocusNode _documentoFocus = FocusNode();
  final FocusNode _addressFocus = FocusNode();
  final FocusNode _numberLicenceFocus = FocusNode();
  final FocusNode _yearLicenceFocus = FocusNode();
  final FocusNode _dateFocus = FocusNode();

  DocumentType _documentType;
  VehicleType _vehicleType;

  String _inputStrDate;

  List<QuestionRegister> questionRegisterList;
  QuestionRegister selectionQuestion;
  bool _stateReviewVehicle = true;
  bool _stateReviewDocumentType = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _updateDriverBloc = new UpdateDriverBloc();
    questionRegisterList = QuestionRegister.getQuestions();
    getDataDriver();
  }

  getDataDriver(){
    String data = prefs.getDriver();
    if(data == null){
      print('no data in preferences');
    }else {
      _map = jsonDecode(data);

      _inputNameFirstController.text = _map['first_name'];
      _inputNameSecondController.text = _map['second_name'];
      _inputLastNameFirstController.text = _map['first_lastname'];
      _inputLastNameSecondController.text = _map['second_lastname'];
      _inputDocumentoController.text = _map['document_number'];
      _inputAddressController.text = _map['address'];
      _inputNummberLicenceController.text = _map['license_plate_number'];
      _inputYearLicenceController.text = _map['vehicle_year'];
      _inputDateController.text = _map['birth_date'];
      _inputDateController.text = _map['birth_date'];

       _updateDriverBloc.document_type = _map['document_type']['id'];
       _updateDriverBloc.vehicule_type = _map['vehicle_type']['id'];


      questionRegisterList.asMap().forEach((index, value) => {
        if(_map['driving_daily_routine'] == value.textQuestion){
          selectionQuestion = questionRegisterList[index]
        }
      });
    }
  }

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
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 15.w),
            physics: BouncingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
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
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    labelText: 'form_first_name'.tr(),
                                    hintText: _map['first_name'],
                                    validator: (value) {
                                      if (value.isEmpty) return 'required_field'.tr();
                                      return null;
                                    },
                                  ),
                              ),

                              SizedBox(
                                width: 20.h,
                              ),

                              Flexible(
                                  flex: 2,
                                  child: InputTextfield(
                                    focusNode: _nameSecondFocus,
                                    controller: _inputNameSecondController,
                                    onFieldSubmitted: (term) {
                                      _fieldFocusChange(context, _nameSecondFocus, _lastNameFirstFocus);
                                    },
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.next,
                                    labelText: 'form_second_name'.tr(),
                                    hintText: _map['second_name'],
                                    validator: (value) {

                                    },
                                  ),
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
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  labelText: 'form_first_lastname'.tr(),
                                  hintText: _map['first_lastname'],
                                  validator: (value) {
                                    if (value.isEmpty) return 'required_field'.tr();
                                    return null;
                                  },
                                ),
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
                                    _fieldFocusChange(context, _lastNameFirstFocus, _documentoFocus);
                                  },
                                  keyboardType: TextInputType.text,
                                  textInputAction: TextInputAction.next,
                                  labelText: 'form_second_lastname'.tr(),
                                  hintText: _map['second_lastname'],
                                  validator: (value) {

                                  },
                                ),
                              ),

                            ],
                          ),


                          SizedBox(
                            height: 20.h,
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
                                  _fieldFocusChange(context, _documentoFocus, _addressFocus);
                                },
                                labelText:'form_document_number'.tr(),
                                hintText: _map['document_number'],
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
                                hintText: _map['address'],
                                validator: (value) {
                                  if (value.isEmpty) return 'required_field'.tr();
                                  return null;
                                },
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
                                focusNode: _numberLicenceFocus,
                                controller: _inputNummberLicenceController,
                                keyboardType: TextInputType.text,
                                onFieldSubmitted: (term) {
                                  _fieldFocusChange(context, _numberLicenceFocus, _yearLicenceFocus);
                                },
                                labelText:'form_license_plate_number'.tr(),
                                hintText: _map['license_plate_number'],
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
                                focusNode: _yearLicenceFocus,
                                controller: _inputYearLicenceController,
                                keyboardType: TextInputType.text,
                                onFieldSubmitted: (term) {
                                  _fieldFocusChange(context, _yearLicenceFocus, _dateFocus);
                                },
                                labelText:'form_vehicle_year'.tr(),
                                hintText: _map['vehicle_year'],
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
                                focusNode: _dateFocus,
                                controller: _inputDateController,
                                onTap: (){
                                  _selectDate(context);
                                },
                                keyboardType: TextInputType.text,
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

                          _isLoading ? ActivityIndicator() : CustomButton(
                            text: 'profile_update_button'.tr(),
                            fullscreen: true,
                            onTap: (){
                              _UpdateDriver();
                            },
                          ),

                          SizedBox(
                            height: 15.h,
                          ),

                        ],
                      ),
                    )

                  ],
                ),
              )
            ),
          ) ;
        }
     );
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
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

              if(_stateReviewDocumentType)
                documentTypeList.asMap().forEach((index, value) => {
                  if(_map['document_type']['id'] == value.id){
                    _documentType = documentTypeList[index]
                  }
                });

              return Center(
                  child: Container(
                    width: width,
                    height: 60.h,
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    margin: EdgeInsets.all(5.h),
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
                              _updateDriverBloc.document_type = documentType.id;
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

              if(_stateReviewVehicle)
                vehicleTypeList.asMap().forEach((index, value) => {
                  if(_map['vehicle_type']['id']== value.id){
                    _vehicleType = vehicleTypeList[index]
                  }
                });

              return Center(
                  child: Container(
                    width: width,
                    height: 60.h,
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    margin: EdgeInsets.all(5.h),
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
                          iconSize: 32,
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
                              _updateDriverBloc.vehicule_type = vehicleType.id;
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

  _UpdateDriver() async {

    setState(() {
      _isLoading = true;
    });

    _updateDriverBloc.driver_id = prefs.getDriverId;
    _updateDriverBloc.name_first = _inputNameFirstController.text.trim();
    _updateDriverBloc.name_second = _inputNameSecondController.text.trim();
    _updateDriverBloc.lastName_first = _inputLastNameFirstController.text.trim();
    _updateDriverBloc.lastName_second = _inputLastNameSecondController.text.trim();
    _updateDriverBloc.document_number = _inputDocumentoController.text.trim();
    _updateDriverBloc.email = _map['email'];
    _updateDriverBloc.phone = _map['phone'];
    _updateDriverBloc.address = _inputAddressController.text.trim();
    _updateDriverBloc.date_birth = _inputDateController.text.trim();
    _updateDriverBloc.licence_number = _inputNummberLicenceController.text.trim();
    _updateDriverBloc.vehicule_year = _inputYearLicenceController.text.trim();
    _updateDriverBloc.driving_daily_routine = selectionQuestion.textQuestion;


    _updateDriverBloc.UpdateDriver();

    _updateDriverBloc.data.listen((data) {
      print(data);
      setState(() {
        _isLoading = false;
      });

      if(data.error == 1){
        prefs.setDriver = data.driver;
      }

      var dialog = AlertMessageError(
          icon: data.error == 1 ? "success" : "error",
          message: data.response
      );

      showDialog(
          context: context,
          builder: (BuildContext context) {
            Future.delayed(Duration(seconds: 3), () {
              Navigator.of(context).pop(true);
            });
            return dialog;
          }
      );
    });
  }
}
