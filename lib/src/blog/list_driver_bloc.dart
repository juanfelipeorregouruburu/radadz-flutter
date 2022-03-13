import 'package:flutter/cupertino.dart';
import 'package:rxdart/rxdart.dart';
import 'package:radadz_app/src/utils/export.dart';

class ListDriverBloc with ChangeNotifier {
  final repository = Repository();
  final debouncer = Debouncer();

  ListDriverModel _listDriverModel;
  Driver _selectDriver;
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Driver get selectDriver => _selectDriver;

  set selectDriver(Driver selectDriver) {
    _selectDriver = selectDriver;
    notifyListeners();
  }

  ListDriverModel get driverList => _listDriverModel;

  set driverList(ListDriverModel data) {
    _listDriverModel = data;
    notifyListeners();
  }

  Future getDriver({@required String driver_id}) async {
    isLoading = true;

      ListDriverModel _listDriverModel = await repository.list_driver_id(driver_id);
      isLoading = false;
      selectDriver = _listDriverModel.drivers.first;
      driverList =  _listDriverModel;

  }


}