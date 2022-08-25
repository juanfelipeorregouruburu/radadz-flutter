class TripHistoryModel {
  int _error;
  String _message;
  List<TripHistory> _tripHistory = [];

  TripHistoryModel.fromJson(Map<String, dynamic> json) {
    _error = json['msg'];
    _message = json['response'];

    if (_error == 1) {
      List<TripHistory> temp = [];
      for (int i = 0; i < json['data'].length; i++) {
        TripHistory data = TripHistory(json['data'][i]);
        temp.add(data);
      }
      _tripHistory = temp;
    }
  }

  int get error => _error;
  String get message => _message;
  List<TripHistory> get trips => _tripHistory;
}

class TripHistory {
  int _tripId;
  String _startTime;
  String _endTime;
  String _totalFinishedVideoTime;
  String _totalEarnedFinishedVideo;
  String _totalEarnedImageTime;
   String _totalTokensEarned;
   String _totalMoneyEarned;

  TripHistory(parsedJson){
    _tripId = parsedJson['id'];
    _startTime = parsedJson['start_time'];
    _endTime = parsedJson['end_date'];
    _totalFinishedVideoTime = parsedJson['total_finished_video_time'];
    _totalEarnedFinishedVideo = parsedJson['tokens_earned_for_finished_videos'];
    _totalEarnedImageTime = parsedJson['tokens_earned_for_image_time'];
    _totalTokensEarned = parsedJson['total_tokens_earned'];
    _totalMoneyEarned = parsedJson['total_money_earned'];
  }

  int get id => _tripId;
  String get startTime => _startTime;
  String get endTime => _endTime;
  String get totalFinishedVideoTime => _totalFinishedVideoTime;
  String get totalEarnedFinishedVideo => _totalEarnedFinishedVideo;
  String get totalEarnedImageTime => _totalEarnedImageTime;
  String get totalTokensEarned => _totalTokensEarned;
  String get totalMoneyEarned => _totalMoneyEarned;
}