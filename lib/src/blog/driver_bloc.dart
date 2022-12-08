import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:radadz_app/src/utils/export.dart';


final blocGetDriver = getDriverBloc();

class getDriverBloc {
  final repository = Repository();
  final driver = PublishSubject<DriverModel>();

  get data => driver.stream;

  String? driverId;
  getDriverBloc({this.driverId});

  getDriver() async {
    DriverModel _driver = await repository.getDriverRepository(driverId);
    driver.sink.add(_driver);
  }

  disponse() {
    driver.close();
  }

}

class SaveDriverBloc {

  final repository = Repository();
  final saveDriver = PublishSubject<SaveDriverModel>();
  get data => saveDriver.stream;

  String? nameFirst ;
  String? nameSecond ;
  String? lastNameFirst ;
  String? lastNameSecond ;
  String? documentType ;
  String? documentNumber ;
  String? email ;
  String? phone ;
  String? address ;
  String? password ;
  String? birthDate ;
  String? licencePlateNumber ;
  String? vehicleType ;
  String? vehicleYear ;
  String? drivingDailyRoutine ;
  String? vehicleModel ;
  String? vehicleManufacturer ;
  String? vehicleColor ;
  String? isOwner ;
  String? ownerVehicleName ;
  String? ownerIdNumber ;
  String? expirationDateTechnicalMechanical ;
  String? expirationDateSOAT ;
  String? expirationDateDriverLicence ;



  SaveDriverBloc({this.nameFirst, this.nameSecond, this.lastNameFirst, this.lastNameSecond, this.documentType, this.documentNumber, this.email , this.phone, this.address, this.password, this.birthDate,
    this.licencePlateNumber, this.vehicleType, this.vehicleYear, this.drivingDailyRoutine , this.vehicleModel , this.vehicleManufacturer , this.vehicleColor,
    this.isOwner, this.ownerVehicleName , this.ownerIdNumber , this.expirationDateTechnicalMechanical , this.expirationDateSOAT , this.expirationDateDriverLicence});

  SaveDriver() async {
    SaveDriverModel _saveDriver = await repository.saveDriverRepository(nameFirst, nameSecond, lastNameFirst, lastNameSecond, documentType, documentNumber, email,  phone, password, address, birthDate,
        licencePlateNumber, vehicleType, vehicleYear, drivingDailyRoutine, vehicleModel, vehicleManufacturer, vehicleColor, isOwner, ownerVehicleName, ownerIdNumber,
        expirationDateTechnicalMechanical, expirationDateSOAT, expirationDateDriverLicence);
    saveDriver.sink.add(_saveDriver);
  }

  disponse() {
    saveDriver.close();
  }
}

class UpdateDriverBloc {

  final repository = Repository();
  final updateDriver = PublishSubject<UpdateDriverModel>();
  get data => updateDriver.stream;


  String? driverId ;
  String? nameFirst ;
  String? nameSecond ;
  String? lastNameFirst ;
  String? lastNameSecond ;
  String? documentType ;
  String? documentNumber ;
  String? email ;
  String? address ;
  String? birthDate ;
  String? licencePlateNumber ;
  String? vehicleType ;
  String? vehicleYear ;
  String? drivingDailyRoutine ;
  String? vehicleModel ;
  String? vehicleManufacturer ;
  String? vehicleColor ;
  String? isOwner ;
  String? ownerVehicleName ;
  String? ownerIdNumber ;
  String? expirationDateTechnicalMechanical ;
  String? expirationDateSOAT ;
  String? expirationDateDriverLicence ;


  UpdateDriverBloc({this.driverId, this.nameFirst, this.nameSecond, this.lastNameFirst, this.lastNameSecond, this.documentType, this.documentNumber, this.email , this.address, this.birthDate,
    this.licencePlateNumber, this.vehicleType, this.vehicleYear, this.drivingDailyRoutine , this.vehicleModel , this.vehicleManufacturer , this.vehicleColor,
    this.isOwner, this.ownerVehicleName , this.ownerIdNumber , this.expirationDateTechnicalMechanical , this.expirationDateSOAT , this.expirationDateDriverLicence});

  UpdateDriver() async {
    UpdateDriverModel _updateDriver = await repository.updateDriverRepository(driverId , nameFirst, nameSecond, lastNameFirst, lastNameSecond, documentType, documentNumber, email,address, birthDate,
        licencePlateNumber, vehicleType, vehicleYear, drivingDailyRoutine, vehicleModel, vehicleManufacturer, vehicleColor, isOwner, ownerVehicleName, ownerIdNumber,
        expirationDateTechnicalMechanical, expirationDateSOAT, expirationDateDriverLicence);
    updateDriver.sink.add(_updateDriver);
  }

  disponse() {
    updateDriver.close();
  }
}

class UpdateDataBankDriverBloc {
  final repository = Repository();
  final updateDataBankDriver = PublishSubject<UpdateDataBankModel>();

  get data => updateDataBankDriver.stream;
  String? driverId, bank_id, account_number, account_type_id;

  UpdateDataBankDriverBloc({this.driverId, this.bank_id,this.account_number,this.account_type_id});

  UpdateDataBank() async {
    UpdateDataBankModel _UpdateDataBankDriver = await repository.updateDriverDataBank(driverId, bank_id,account_number,account_type_id);
    updateDataBankDriver.sink.add(_UpdateDataBankDriver);
  }

  disponse() {
    updateDataBankDriver.close();
  }

}