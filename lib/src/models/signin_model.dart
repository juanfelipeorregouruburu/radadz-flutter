
class SingninModel {
  int _error;
  String _response;

  SingninModel.fromJson(Map<String , dynamic> json) {
    _error = json['msg'];
    _response = json['response'];
  }

  int get error => _error;
  String get response => _response;

}