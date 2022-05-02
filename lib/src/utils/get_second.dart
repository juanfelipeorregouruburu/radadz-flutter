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