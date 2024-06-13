import 'package:intl/intl.dart';

extension DateExtension on int {
  bool get isToday {
    final DateTime now = DateTime.now();
    final DateTime dateTime = toDateTime;

    return now.day == dateTime.day &&
        now.month == dateTime.month &&
        now.year == dateTime.year;
  }

  String get formatToDate {
    return DateFormat.MMMMd().format(
      toDateTime,
    );
  }

  DateTime get toDateTime {
    return DateTime.fromMillisecondsSinceEpoch(this);
  }

  String get formatToHour {
    return DateFormat.Hm().format(
      toDateTime,
    );
  }
}
