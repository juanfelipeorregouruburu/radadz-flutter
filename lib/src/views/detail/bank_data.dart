import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:radadz_app/src/utils/export.dart';

class DataBankDriver extends StatefulWidget {
  const DataBankDriver({Key key}) : super(key: key);

  @override
  _DataBankDriverState createState() => _DataBankDriverState();
}

class _DataBankDriverState extends State<DataBankDriver> {

  final prefs = new Preferences();
  bool _isLoading = false;
  UpdateDataBankDriverBloc _updateDataBankDriverBloc;

  TextEditingController _inputNumberCountController = new TextEditingController();
  final FocusNode _numberCountFocus = FocusNode();

  Bank _bank;
  BankAcountType _bankAcountType;
  bool _stateReviewBank = false;
  bool _stateReviewAcountType = false;

  Map<String, dynamic> _map;

  final GlobalKey<FormState> formState = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _updateDataBankDriverBloc = new UpdateDataBankDriverBloc();
    getDataDriver();
  }

  getDataDriver(){
    String data = prefs.getDriver();
    if(data == null){
      print('no data in preferences');
    }else {
      _map = jsonDecode(data);

      if(_map['account_type'] != null && _map['bank_name'] != null){
        _inputNumberCountController.text = _map['account_number'];
        _updateDataBankDriverBloc.account_type_id = _map['account_type']['id'];
        _updateDataBankDriverBloc.bank_id = _map['bank_name']['id'];
        _stateReviewBank = true;
        _stateReviewAcountType = true;
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
          child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [

                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Form(
                          key: formState,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  width: double.infinity,
                                  child: _dataSpinnerBankList()
                              ),

                              SizedBox(
                                height: 25.h,
                              ),

                              Container(
                                  width: double.infinity,
                                  child: _dataSpinnerBankAccountType()
                              ),

                              SizedBox(
                                height: 35.h,
                              ),

                              InputTextfield(
                                focusNode: _numberCountFocus,
                                controller: _inputNumberCountController,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                                labelText: 'data_bank_acount'.tr(),
                                hintText: 'xxx-xxxxx-xx',
                                validator: (value) {
                                  if (value.isEmpty) return 'required_field'.tr();
                                  return null;
                                },
                              ),

                              SizedBox(
                                height: 35.h,
                              ),

                              _isLoading ? ActivityIndicator() : CustomButton(
                                text: 'data_bank_button'.tr(),
                                fullscreen: true,
                                onTap: (){
                                  if (formState.currentState.validate()) {
                                    _UpdateDataBank();
                                  }
                                },
                              ),

                            ],
                          ),
                        )
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

  Widget _dataSpinnerBankList(){
    double width = MediaQuery.of(context).size.width;

    blocBankList.BankList();
    return StreamBuilder(
        stream: blocBankList.data,
        builder: (context , AsyncSnapshot<BankListModel> snapshot){
          if(snapshot.hasData){
            List<Bank> bankTypeList = snapshot.data.bankType;

            if(bankTypeList != null){
              if(_stateReviewBank){
                bankTypeList.asMap().forEach((index, value) {
                  if(_map['bank_name']['id'] == value.id){
                    _bank = bankTypeList[index];
                  }
                });
              }

              return Center(
                  child: Container(
                    width: width,
                    height: 60.h,
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
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
                        child: DropdownButton<Bank>(
                          hint: Text('selection_bank_type'.tr(), style: StyleGeneral.styleTextTitleSpinner),
                          iconSize: 32.h,
                          value: _bank == null ? _bank : bankTypeList.where( (i) => i.name == _bank.name).first ,
                          items: bankTypeList.map((Bank bank) {
                            return DropdownMenuItem<Bank>(
                                value: bank ,
                                child: new Text(bank.name, style: StyleGeneral.styleTextTextSpinner)
                            );
                          }).toList(),
                          onChanged: (Bank bank){
                            setState(() {
                              _bank = bank;
                              _updateDataBankDriverBloc.bank_id= _bank.id;
                              _stateReviewBank = false;
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


  Widget _dataSpinnerBankAccountType(){
    double width = MediaQuery.of(context).size.width;

    blocBankAccountType.BankAccountTypeList();
    return StreamBuilder(
        stream: blocBankAccountType.data,
        builder: (context , AsyncSnapshot<BankAcountTypeModel> snapshot){
          if(snapshot.hasData){
            List<BankAcountType> bankAccountTypeList = snapshot.data.bankAcountType;

            if(bankAccountTypeList != null){

              if(_stateReviewAcountType){
                bankAccountTypeList.asMap().forEach((index, value) => {
                  if(_map['account_type']['id'] == value.id){
                    _bankAcountType = bankAccountTypeList[index]
                  }
                });
              }

              return Center(
                  child: Container(
                    width: width,
                    height: 55.h,
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
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
                        child: DropdownButton<BankAcountType>(
                          hint: Text('selection_bank_account_type'.tr(), style: StyleGeneral.styleTextTitleSpinner),
                          iconSize: 32.h,
                          value: _bankAcountType == null ? _bankAcountType : bankAccountTypeList.where( (i) => i.name == _bankAcountType.name).first ,
                          items: bankAccountTypeList.map((BankAcountType bankAcountType) {
                            return DropdownMenuItem<BankAcountType>(
                                value: bankAcountType ,
                                child: new Text(bankAcountType.name, style: StyleGeneral.styleTextTextSpinner)
                            );
                          }).toList(),
                          onChanged: (BankAcountType _bankAccountType){
                            setState(() {
                              _bankAcountType = _bankAccountType;
                              _updateDataBankDriverBloc.account_type_id= _bankAccountType.id;
                              _stateReviewAcountType = false;
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

  _UpdateDataBank() async {

    setState(() {
      _isLoading = true;
    });

    _updateDataBankDriverBloc.driver_id = prefs.getDriverId;
    _updateDataBankDriverBloc.account_number = _inputNumberCountController.text.trim();

    _updateDataBankDriverBloc.UpdateDataBank();

    _updateDataBankDriverBloc.data.listen((data) {

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
      SystemChannels.textInput.invokeMethod('TextInput.hide');
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
