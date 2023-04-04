// ignore_for_file: constant_identifier_names

import 'package:intl/intl.dart';

class RelativeDateFormat {
  static const num ONE_MINUTE = 60000;
  static const num ONE_HOUR = 3600000;
  static const num ONE_DAY = 86400000;
  static const num ONE_WEEK = 604800000;

  static const String ONE_SECOND_AGO = " sec ago";
  static const String ONE_MINUTE_AGO = " min ago";
  //static final String ONE_HOUR_AGO = " An hour ago";
  // static final String ONE_SECOND_AGO = "Before";
  //static final String ONE_MINUTE_AGO = "minutes ago";
  static const String ONE_HOUR_AGO = " hour ago";
  static const String ONE_DAY_AGO = " Days ago";
  //static final String ONE_MONTH_AGO = " Before the month";
  static const String ONE_MONTH_AGO = " month ago";
  static const String ONE_YEAR_AGO = " years ago";

  //Time conversion
  static String format(DateTime date) {
    num delta =
        DateTime.now().millisecondsSinceEpoch - date.millisecondsSinceEpoch;
    if (delta < 1 * ONE_MINUTE) {
      num seconds = toSeconds(delta);
      return (seconds <= 0 ? 1 : seconds).toInt().toString() + ONE_SECOND_AGO;
    }
    if (delta < 45 * ONE_MINUTE) {
      num minutes = toMinutes(delta);
      return (minutes <= 0 ? 1 : minutes).toInt().toString() + ONE_MINUTE_AGO;
    }
    if (delta < 24 * ONE_HOUR) {
      num hours = toHours(delta);
      return (hours <= 0 ? 1 : hours).toInt().toString() + ONE_HOUR_AGO;
    }
    if (delta < 48 * ONE_HOUR) {
      return "yesterday";
    }
    if (delta < 30 * ONE_DAY) {
      num days = toDays(delta);
      return (days <= 0 ? 1 : days).toInt().toString() + ONE_DAY_AGO;
    }
    if (delta < 12 * 4 * ONE_WEEK) {
      num months = toMonths(delta);
      return (months <= 0 ? 1 : months).toInt().toString() + ONE_MONTH_AGO;
    } else if (date.year == DateTime.now().year) {
      return DateFormat('dd MMM').format(date);
    } else {
      num years = toYears(delta);

      return years <= 0
          ? "1 $ONE_YEAR_AGO"
          : DateFormat("dd/MM/yyyy").format(date);
      //return (years <= 0 ? 1 : years).toInt().toString() + ONE_YEAR_AGO;
    }
  }

  static num toSeconds(num date) {
    return date / 1000;
  }

  static num toMinutes(num date) {
    return toSeconds(date) / 60;
  }

  static num toHours(num date) {
    return toMinutes(date) / 60;
  }

  static num toDays(num date) {
    return toHours(date) / 24;
  }

  static num toMonths(num date) {
    return toDays(date) / 30;
  }

  static num toYears(num date) {
    return toMonths(date) / 365;
  }
}
