import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class ProfileDriver extends StatefulWidget {

  const ProfileDriver({Key? key}) : super(key: key);

  @override
  _ProfileDriverState createState() => _ProfileDriverState();
}

class _ProfileDriverState extends State<ProfileDriver> {

  final prefs = new Preferences();
  bool _isLoading = false;
  UpdateDriverBloc _updateDriverBloc = new UpdateDriverBloc();


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

  DocumentType? _documentType;
  VehicleType? _vehicleType;

  String? _inputStrDate;
  bool _stateReviewVehicle = true;
  bool _stateReviewDocumentType = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _updateDriverBloc = new UpdateDriverBloc();
    getDataDriver();
  }

  getDataDriver(){
    String data = "prefs.getDriver()";
    if(data == null){
      print('no data in preferences');
    }else {
      // _map = jsonDecode(data);
      //
      // _inputNameFirstController.text = _map['first_name'];
      // _inputNameSecondController.text = _map['second_name'];
      // _inputLastNameFirstController.text = _map['first_lastname'];
      // _inputLastNameSecondController.text = _map['second_lastname'];
      // _inputDocumentoController.text = _map['document_number'];
      // _inputAddressController.text = _map['address'];
      // _inputNummberLicenceController.text = _map['license_plate_number'];
      // _inputYearLicenceController.text = _map['vehicle_year'];
      // _inputDateController.text = _map['birth_date'];
      // _inputDateController.text = _map['birth_date'];
      //
      // _updateDriverBloc.document_type = _map['document_type']['id'];
      // _updateDriverBloc.vehicule_type = _map['vehicle_type']['id'];
      //
      // questionRegisterList.asMap().forEach((index, value) => {
      //   if(_map['driving_daily_routine'] == value.textQuestion){
      //     selectionQuestion = questionRegisterList[index]
      //   }
      // });
    }
  }



  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 25.h, horizontal: 15.w),
            physics: BouncingScrollPhysics(),
            child: Container(),
          ) ;
        }
     );
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }



  _UpdateDriver() async {
    setState(() {
      _isLoading = true;
    });

    _updateDriverBloc.driver_id = Preferences.getDriverId;
    _updateDriverBloc.name_first = _inputNameFirstController.text.trim();
    _updateDriverBloc.name_second = _inputNameSecondController.text.trim();
    _updateDriverBloc.lastName_first =
        _inputLastNameFirstController.text.trim();
    _updateDriverBloc.lastName_second =
        _inputLastNameSecondController.text.trim();
    _updateDriverBloc.document_number = _inputDocumentoController.text.trim();
    _updateDriverBloc.email = "_map['email']";
    _updateDriverBloc.phone = "_map['phone']";
    _updateDriverBloc.address = _inputAddressController.text.trim();
    _updateDriverBloc.date_birth = _inputDateController.text.trim();
    _updateDriverBloc.licence_number =
        _inputNummberLicenceController.text.trim();
    _updateDriverBloc.vehicule_year = _inputYearLicenceController.text.trim();



    _updateDriverBloc.UpdateDriver();

    _updateDriverBloc.data.listen((data) {
      print(data);
      setState(() {
        _isLoading = false;
      });

      if(data.error == 1){

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
