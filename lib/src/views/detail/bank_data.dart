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
  BankAcountType? _bankAcountType;
  bool _stateReviewBank = false;
  bool _stateReviewAcountType = false;

  final GlobalKey<FormState> formState = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _updateDataBankDriverBloc = new UpdateDataBankDriverBloc();
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


                              SizedBox(
                                height: 35.h,
                              ),

                              InputTextField(
                                focusNode: _numberCountFocus,
                                controller: _inputNumberCountController,
                                keyboardType: TextInputType.number,
                                textInputAction: TextInputAction.done,
                                labelText: 'data_bank_acount'.tr(),
                                hintText: 'xxx-xxxxx-xx',
                                validator: (String? value) {
                                  if (value!.isEmpty) return 'required_field'.tr();
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
                                  if (formState.currentState!.validate()) {
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






  _UpdateDataBank() async {

    setState(() {
      _isLoading = true;
    });

    _updateDataBankDriverBloc.driver_id = Preferences.getDriverId;
    _updateDataBankDriverBloc.account_number = _inputNumberCountController.text.trim();

    _updateDataBankDriverBloc.UpdateDataBank();

    _updateDataBankDriverBloc.data.listen((data) {

      setState(() {
        _isLoading = false;
      });

      if(data.error == 1){

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
