import 'package:rxdart/rxdart.dart';
import 'package:flutter/material.dart';
import 'package:radadz_app/src/utils/export.dart';

class BlurtCreateBloc {
  final repository = Repository();
  final blurtCreate = PublishSubject<BlurtResponseModel>();

  get data => blurtCreate.stream;
  String? driver_id, message;

  BlurtCreateBloc({this.driver_id, this.message});

  BlurtCreate() async {
    BlurtResponseModel _blurt = await repository.blurtCreateRepository(driver_id!, message!);
    blurtCreate.sink.add(_blurt);
  }

  disponse() {
    blurtCreate.close();
  }

}

class BlurtUpdateBloc {
  final repository = Repository();
  final blurtUpdate = PublishSubject<BlurtResponseModel>();

  get data => blurtUpdate.stream;
  String? driver_id, blurt_id;

  BlurtUpdateBloc({this.driver_id, this.blurt_id});

  BlurtUpdate() async {
    BlurtResponseModel _blurt = await repository.blurtEnableRepository(driver_id!, blurt_id!);
    blurtUpdate.sink.add(_blurt);
  }

  disponse() {
    blurtUpdate.close();
  }

}

class ListBlurtAllBloc with ChangeNotifier {

  final repository = Repository();
  final debouncer = Debouncer();

  BlurtListModel? _listBlurtsModel;
  Blurt? _selectBlurt;
  bool _isLoading = true;

  bool get isLoading => _isLoading;

  set isLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  Blurt get selectBlurt => _selectBlurt!;

  set selectBlurt(Blurt selectBlurt) {
    _selectBlurt = selectBlurt;
    notifyListeners();
  }

  BlurtListModel? get blurtListAll => _listBlurtsModel;

  set blurtAll(BlurtListModel data) {
    _listBlurtsModel = data;
    notifyListeners();
  }

  Future getBlurtsAll() async {
    isLoading = true;

    debouncer.run(() async {
      BlurtListModel _paymentReceived = await repository.blurtListAllRepository();
      isLoading = false;
      blurtAll = _paymentReceived;
    });

  }

}

class ListBlurtDriverBloc with ChangeNotifier {

  final repository = Repository();
  final debouncer = Debouncer();

  BlurtListModel? _listBlurtsModel;
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

  BlurtListModel? get blurtListAll => _listBlurtsModel;

  set blurtAll(BlurtListModel data) {
    _listBlurtsModel = data;
    notifyListeners();
  }

  Future getBlurtsDriver({required String driver_id}) async {
    isLoading = true;

    debouncer.run(() async {
      BlurtListModel _paymentReceived = await repository.blurtListDriverRepository(driver_id);
      isLoading = false;
      blurtAll = _paymentReceived;
    });

  }

}