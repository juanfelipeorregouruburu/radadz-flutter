int getSecondDiference(date_time) {
  DateTime now = new DateTime.now();
  DateTime dateTimeFinal = DateTime.parse(date_time);
  DateTime dateFinalNow = DateTime.parse(now.toString());
  Duration diff = dateTimeFinal.difference(dateFinalNow);
  return diff.inSeconds;
}

int getSecondDiferenceAfter(date_time) {
  DateTime now = new DateTime.now();
  DateTime dateTimeFinal = DateTime.parse(date_time);
  DateTime dateFinalNow = DateTime.parse(now.toString());
  Duration diff = dateFinalNow.difference(dateTimeFinal);
  return diff.inSeconds;
}

String durationTime(startTime, endTime){
  DateTime dateTimeStart = DateTime.parse(startTime);
  DateTime dateFinalEnd = DateTime.parse(endTime);
  Duration duration = dateTimeStart.difference(dateFinalEnd);

  int hours = duration.inHours;
  int minutes = (duration.inMinutes % 60);
  int remainingSeconds = (duration.inSeconds % 60);

  String hoursStr = hours.toString().padLeft(2, '0');
  String minutesStr = minutes.toString().padLeft(2, '0');
  String secondsStr = remainingSeconds.toString().padLeft(2, '0');

  return "$hoursStr:$minutesStr:$secondsStr";
}