class Helper {
  List<String> _months = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];
  String getFormattedDate({required String longDate}) {
    if (longDate == '') {
      return longDate;
    }
    DateTime dateTime = DateTime.parse(longDate);
    return "${dateTime.day} ${_months[dateTime.month - 1]}, ${dateTime.year}";
  }
}
