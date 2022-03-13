import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


import 'package:radadz_app/src/blog/update_driver_bloc.dart';
import 'package:radadz_app/src/utils/export.dart';


class ProfileDriver extends StatefulWidget {
  final Driver driver;
  const ProfileDriver({Key key, @required this.driver,}) : super(key: key);

  @override
  _ProfileDriverState createState() => _ProfileDriverState();
}

class _ProfileDriverState extends State<ProfileDriver> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _updateDriverBloc = new UpdateDriverBloc();
    questionRegisterList = QuestionRegister.getQuestions();
    //
    _inputNameFirstController.text = widget.driver.first_name;
    _inputNameSecondController.text = widget.driver.second_name;
    _inputLastNameFirstController.text = widget.driver.first_lastname;
    _inputLastNameSecondController.text = widget.driver.second_lastname;
    _inputDocumentoController.text = widget.driver.document_number;
    _inputAddressController.text = widget.driver.address;
    _inputNummberLicenceController.text = widget.driver.license_plate_number;
    _inputYearLicenceController.text = widget.driver.vehicle_year;
    _inputDateController.text = widget.driver.birth_date;

    _updateDriverBloc.document_type = widget.driver.vehicle_type.id;
    _updateDriverBloc.vehicule_type = widget.driver.document_type.id;

    questionRegisterList.asMap().forEach((index, value) => {
      if(widget.driver.driving_daily_routine == value.textQuestion){
        selectionQuestion = questionRegisterList[index]
      }
    });

  }

  UpdateDriverBloc _updateDriverBloc;

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

  bool _isLoading = false;
  DocumentType _documentType;
  VehicleType _vehicleType;

  String _inputStrDate;

  final prefs = new Preferences();

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
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Container(
                      height: 120.h,
                      alignment: Alignment.center,
                      child: Center(
                        child: Text(
                          'profile_title'.tr(),
                          style: StyleGeneral.styleTextTitle,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),

                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
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
                                      hintText: widget.driver.first_name,
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
                                      hintText: widget.driver.second_name,
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
                                    hintText: widget.driver.first_lastname,
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
                                    hintText: widget.driver.second_lastname,
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
                                  hintText: widget.driver.document_number,
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
                                  hintText: widget.driver.address,
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
                                  hintText: widget.driver.license_plate_number,
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
                                  hintText: widget.driver.vehicle_year,
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
                                  labelText:'form_vehicle_year'.tr(),
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
              documentTypeList.asMap().forEach((index, value) => {
                if(widget.driver.document_type.id == value.id){
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
                              //_saveDriverBloc.document_type = documentType.id;
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
              vehicleTypeList.asMap().forEach((index, value) => {
                if(widget.driver.vehicle_type.id == value.id){
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

    _updateDriverBloc.driver_id = "1";
    _updateDriverBloc.name_first = _inputNameFirstController.text.trim();
    _updateDriverBloc.name_second = _inputNameSecondController.text.trim();
    _updateDriverBloc.lastName_first = _inputLastNameSecondController.text.trim();
    _updateDriverBloc.lastName_second = _inputLastNameSecondController.text.trim();
    _updateDriverBloc.document_number = _inputDocumentoController.text.trim();
    _updateDriverBloc.email = widget.driver.email;
    _updateDriverBloc.phone = widget.driver.phone;
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
        showSuccess(data.response);
      }else{
        showError(data.response);
      }
    });
  }
}
