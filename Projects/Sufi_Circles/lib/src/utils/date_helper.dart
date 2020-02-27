DateTime getCurrentDate() {
  DateTime now = new DateTime.now();
  return new DateTime(now.year, now.month, now.day);
}