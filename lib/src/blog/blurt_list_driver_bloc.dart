import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';

class ListBlurtDriverBloc with ChangeNotifier {

  final repository = Repository();
  final debouncer = Debouncer();

  BlurtListModel _listBlurtsModel;
  bool _isLoading = true;
  bool _isStateButton = false;

  bool get isLoading => _isLoading;
  bool get getStateButton => _isStateButton;

  void setStateButton(bool value){
    _isStateButton = value;
    notifyListeners();
  }

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  BlurtListModel get blurtListAll => _listBlurtsModel;

  set blurtAll(BlurtListModel data) {
    _listBlurtsModel = data;
    notifyListeners();
  }

  Future getBlurtsDriver({@required String driver_id}) async {
    isLoading = true;

    debouncer.run(() async {
      BlurtListModel _paymentReceived = await repository.blurt_list_driver(driver_id);
      isLoading = false;
      blurtAll = _paymentReceived;
    });

  }

}