import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:radadz_app/src/utils/export.dart';

class DataBankDriver extends StatefulWidget {
  final Driver driver;
  const DataBankDriver({Key key, @required this.driver}) : super(key: key);

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

  final GlobalKey<FormState> formState = new GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _updateDataBankDriverBloc = new UpdateDataBankDriverBloc();

    _inputNumberCountController.text = widget.driver.accoutNumber;
    _updateDataBankDriverBloc.account_type_id = widget.driver.account_type_bank_driver.id;
    _updateDataBankDriverBloc.bank_id = widget.driver.bank_name_driver.id;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _inputNumberCountController.dispose();
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
                          'data_bank_title'.tr(),
                          style: StyleGeneral.styleTextTitle,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),

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

              bankTypeList.asMap().forEach((index, value) => {
                if(widget.driver.bank_name_driver.id == value.id){
                  _bank = bankTypeList[index]
                }
              });

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

              bankAccountTypeList.asMap().forEach((index, value) => {
                if(widget.driver.account_type_bank_driver.id == value.id){
                  _bankAcountType = bankAccountTypeList[index]
                }
              });

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
      if (data.error == 1) {
        showSuccess(data.response);
      } else {
        showError(data.response);
      }

    });

  }
}
