import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeUtils {
  static Future<String> getChatTime(String? date) async {
    if (date == null || date.isEmpty) {
      return '';
    }
    String msg = '';
    var dt = date.contains("T")
        ? DateTime.parse(date).toLocal()
        : DateTime.parse(date);
    DateTime now = DateTime.now();

    if (now.isBefore(dt)) {
      return DateFormat.jm().format(DateTime.parse(date).toLocal()).toString();
    }

    var dur = now.difference(dt);
    if (dur.inDays > 0) {
      msg = '${dur.inDays} d';
      return dur.inDays == 1 ? '1d' : DateFormat("dd MMM").format(dt);
    } else if (dur.inDays < 0) {
      DateFormat("dd MMM YYYY").format(dt);
    } else if (dur.inHours > 0) {
      msg = '${dur.inHours} h';
    } else if (dur.inMinutes > 0) {
      msg = '${dur.inMinutes} m';
    } else if (dur.inSeconds > 0) {
      msg = '${dur.inSeconds} s';
    } else {
      msg = 'now';
    }
    return msg;
  }

  static Future<DateTime?> selectDate(
    BuildContext context, {
    DateTime? initial,
    DateTime? start,
    DateTime? end,
  }) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: initial ?? DateTime.now(),
        firstDate: start ?? DateTime(1945),
        lastDate: end ?? DateTime(2100));
    return picked;
  }
}
