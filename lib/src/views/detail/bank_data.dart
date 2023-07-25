import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:radadz_app/src/utils/export.dart';

class DataBankDriver extends StatefulWidget {
  const DataBankDriver({Key? key}) : super(key: key);

  @override
  _DataBankDriverState createState() => _DataBankDriverState();
}

class _DataBankDriverState extends State<DataBankDriver> {

  final prefs = new Preferences();
  bool _isLoading = false;
  UpdateDataBankDriverBloc _updateDataBankDriverBloc = new UpdateDataBankDriverBloc();

  TextEditingController _inputNumberCountController = new TextEditingController();
  final FocusNode _numberCountFocus = FocusNode();

  Bank? _bank;
  BankAccountType? _bankAccountType;
  bool _stateReviewBank = false;
  bool _stateReviewAccountType = false;
  bool _selectedTypeAccount = false;
  bool _selectedBank = false;

  final GlobalKey<FormState> formState = new GlobalKey<FormState>();
  late Map<String, dynamic> _map;
  String? defaultLocale ;

  @override
  void initState() {
    super.initState();
    getDataDriver();
    defaultLocale = Platform.localeName ;
  }

  getDataDriver(){
    String data = Preferences.getDriver;
    if(data.isEmpty){

    }else{
      _map = jsonDecode(data);

      if(_map['account_type'] != null && _map['bank_name'] != null){
        _inputNumberCountController.text = _map['account_number'];
        _updateDataBankDriverBloc.account_type_id = _map['account_type']['id'].toString();
        _updateDataBankDriverBloc.bank_id = _map['bank_name']['id'].toString();
        _stateReviewBank = true;
        _stateReviewAccountType = true;
      }
    }
  }


  @override
  void dispose() {
    super.dispose();
    _inputNumberCountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 15.w),
          child: ConstrainedBox(constraints: BoxConstraints(minHeight: viewportConstraints.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.w),
                      child: Form(
                        key: formState,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Text(
                             'data_bank_subtitle_type'.tr(),
                             style: TextStyle(color: StyleGeneral.BLACK, letterSpacing: .5 , fontSize: ScreenUtil().setSp(13), fontFamily: 'Poppins-Ligth'),
                             textAlign: TextAlign.center,
                           ),
                            SizedBox(height: 5.h),
                            _dataSpinnerAccountType(),

                            SizedBox(height: 15.h),

                            Text(
                             'data_bank_subtitle_bank'.tr(),
                             style: TextStyle(color: StyleGeneral.BLACK, letterSpacing: .5 , fontSize: ScreenUtil().setSp(13), fontFamily: 'Poppins-Ligth'),
                             textAlign: TextAlign.center,
                           ),
                            SizedBox(height: 5.h),
                            _dataSpinnerBank(),

                            SizedBox(height: 25.h),

                            InputTextField(
                              focusNode: _numberCountFocus,
                              controller: _inputNumberCountController,
                              keyboardType: TextInputType.numberWithOptions(decimal: false),
                              textInputAction: TextInputAction.done,
                              labelText: 'data_bank_account'.tr(),
                              hintText: 'xxx-xxx-xx',
                              maxLength: 20,
                              validator: (String? value) {
                                if (value!.isEmpty) {
                                  return 'required_field'.tr();
                                } else if(!validateAccountBankNumber(value)){
                                  return 'data_bank_account_validate'.tr();
                                }
                                return null;
                              }
                            ),

                            SizedBox(
                              height: 35.h,
                            ),

                            _isLoading ? ActivityIndicator() : CustomButton(
                              text: 'data_bank_button'.tr(),
                              fullscreen: true,
                              onTap: (){
                                if (formState.currentState!.validate()) {
                                  _UpdateDataBank();
                                }else{
                                  final snackBar = customSnackBar('Info' , 'register_form_incomplete'.tr() , ContentType.help);
                                  ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(snackBar);
                                }
                              }
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
        ) ;
      }
    );
  }


  Widget _dataSpinnerAccountType(){
    var size = MediaQuery.of(context).size.height;
    blocBankAccountType.BankAccountTypeList();

    return StreamBuilder(
      stream: blocBankAccountType.data,
      builder: (context , AsyncSnapshot<BankAcountTypeModel> snapshot) {

        if (snapshot.hasData) {
          List<BankAccountType> bankAccountTypeList = snapshot.data!.bankAcountType!;

          if(_stateReviewAccountType){
            bankAccountTypeList.asMap().forEach((index, value) {
              if(_map['document_type']['id'] == value.id){
                _bankAccountType = bankAccountTypeList[index];
              }
            });
          }else{
            if(!_selectedTypeAccount){
              bankAccountTypeList.asMap().forEach((index, value) {
                _bankAccountType =bankAccountTypeList[0];
              });
            }
          }

          return Center(
            child: DropdownButtonFormField(
              isDense: size < 1000 ? true : false,
              itemHeight: 45.h,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: StyleGeneral.GREEN, width: 2), borderRadius: BorderRadius.circular(20)),
                border: OutlineInputBorder(borderSide: BorderSide(color: StyleGeneral.GREEN, width: 2), borderRadius: BorderRadius.circular(20)),
                filled: true,
                fillColor: StyleGeneral.GREEN,
              ),
              icon: Icon(Icons.keyboard_arrow_down_rounded, size: 32.sp, color: Colors.white),
              validator: (value) => value == null ? 'selection_document_type'.tr() : null,
              dropdownColor:  StyleGeneral.GREEN,
              value: bankAccountTypeList.where( (i) => i.name == _bankAccountType!.name).first ,
              onChanged: (BankAccountType? value) {
                setState(() {
                  _bankAccountType = value!;
                  _stateReviewAccountType = false;
                  _selectedTypeAccount = true;
                });
              },
              items: bankAccountTypeList.map((BankAccountType bankAccountType) {
                String name = bankAccountType.name!;
                String nameType = '';

                final splinted = name.split('/');
                nameType = defaultLocale!.contains("en_US") ? splinted[0].capitalize() : splinted[1].substring(1).capitalize();

                return DropdownMenuItem<BankAccountType>(
                  value: bankAccountType,
                  child: Text(nameType , style: StyleGeneral.styleTextTextSpinner),
                );
               }
              ).toList()
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

  Widget _dataSpinnerBank(){
    var size = MediaQuery.of(context).size.height;
    blocBankList.BankList();

    return StreamBuilder(
      stream: blocBankList.data,
      builder: (context , AsyncSnapshot<BankListModel> snapshot) {
        if (snapshot.hasData) {
          List<Bank> bankTypeList  = snapshot.data!.bankType!;

          if(_stateReviewBank){
            bankTypeList .asMap().forEach((index, value) {
              if(_map['bank_name']['id'] == value.id){
                _bank = bankTypeList [index];
              }
            });
          }else{
            if(!_selectedBank){
              bankTypeList .asMap().forEach((index, value) {
                _bank =bankTypeList [0];
              });
            }
          }

          return Center(
            child: DropdownButtonFormField(
              isDense: size < 1000 ? true : false,
              itemHeight: 45.h,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: StyleGeneral.GREEN, width: 2), borderRadius: BorderRadius.circular(20)),
                border: OutlineInputBorder(borderSide: BorderSide(color: StyleGeneral.GREEN, width: 2), borderRadius: BorderRadius.circular(20)),
                filled: true,
                fillColor: StyleGeneral.GREEN,
              ),
              icon: Icon(Icons.keyboard_arrow_down_rounded, size: 32.sp, color: Colors.white),
              validator: (value) => value == null ? 'selection_document_type'.tr() : null,
              dropdownColor:  StyleGeneral.GREEN,
              value: bankTypeList .where( (i) => i.name == _bank!.name).first ,
              onChanged: (Bank? value) {
                setState(() {
                  _bank = value!;
                  _stateReviewBank = false;
                  _selectedBank = true;
                });
              },
              items: bankTypeList .map((Bank bankAccountType) {
                return DropdownMenuItem<Bank>(
                  value: bankAccountType,
                  child: Text(bankAccountType.name! , style: StyleGeneral.styleTextTextSpinner),
                );
              }
             ).toList()
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

  _UpdateDataBank() async {

    setState(() {
      _isLoading = true;
    });

    _updateDataBankDriverBloc.driverId = Preferences.getDriverId;
    _updateDataBankDriverBloc.account_type_id = _bankAccountType!.id.toString();
    _updateDataBankDriverBloc.bank_id = _bank!.id.toString();
    _updateDataBankDriverBloc.account_number = _inputNumberCountController.text.trim();

    _updateDataBankDriverBloc.UpdateDataBank();

    _updateDataBankDriverBloc.data.listen((data) {
      SystemChannels.textInput.invokeMethod('TextInput.hide');
      setState(() {_isLoading = false;});

      if(data.error == 1){
        Preferences.setDriver = data.driver;
        final snackBar = customSnackBar('Success' , 'data_bank_success'.tr() , ContentType.success);
        ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(snackBar);
      }else{
        final snackBar = customSnackBar('Error' , data.response , ContentType.failure);
        ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(snackBar);
      }
    });

  }
}
