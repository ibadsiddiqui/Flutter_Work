String getFullDateString(DateTime date) {
  return date.toString().split(" ")[0];
}

bool compareDate(DateTime dateTo, DateTime dateFrom) {
  return dateTo.compareTo(dateFrom) == 1;
}
