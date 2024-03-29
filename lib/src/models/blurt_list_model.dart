class BlurtListModel {
  int? _error;
  String? _response;
  List<Blurt>? _blurts = [];

  BlurtListModel.fromJson(Map<String , dynamic> json) {
    _error = json['msg'];
    _response = json['response'];

    if(_error == 1){
      List<Blurt> temp = [];
      for (int i = 0; i < json['data'].length; i++) {
        Blurt data = Blurt(json['data'][i]);
        temp.add(data);
      }
      _blurts = temp;
    }
  }

  int get error => _error!;
  String get response => _response!;
  List<Blurt> get blurts => _blurts!;
}

class Blurt {
  String? _Id;
  String? _creation_date;
  String? _message;
  int? _statusBlurt;

  Blurt(parsedJson) {
    _Id = parsedJson['id'].toString();
    _creation_date = parsedJson['creation_date'];
    _message = parsedJson['message'];
    _statusBlurt = parsedJson['status'];
  }

  String get id => _Id! ;
  String get create_date => _creation_date! ;
  String get message => _message! ;
  int get statusBlurt => _statusBlurt!;
}