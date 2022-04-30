import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';

class ListBlurtAllBloc with ChangeNotifier {

  final repository = Repository();
  final debouncer = Debouncer();

  BlurtListModel _listBlurtsModel;
  Blurt _selectBlurt;
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Blurt get selectBlurt => _selectBlurt;

  set selectBlurt(Blurt selectBlurt) {
    _selectBlurt = selectBlurt;
    notifyListeners();
  }

  BlurtListModel get blurtListAll => _listBlurtsModel;

  set blurtAll(BlurtListModel data) {
    _listBlurtsModel = data;
    notifyListeners();
  }

  Future getBlurtsAll() async {
    isLoading = true;

    debouncer.run(() async {
      BlurtListModel _paymentReceived = await repository.blurt_list_all();
      isLoading = false;
      blurtAll = _paymentReceived;
    });

  }

}