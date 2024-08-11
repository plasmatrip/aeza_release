import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<bool> openUrl(url) async {
  final uri = Uri.parse(url);
  if (!uri.hasScheme || !uri.hasAuthority) {
    return false;
  }
  launchUrl(uri);
  return true;
}

bool datesIsEqual(DateTime? date1, DateTime? date2) {
  if (date1 == null || date2 == null) {
    return false;
  }
  return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
}

bool timeIsEqual(DateTime? time1, DateTime? time2) {
  if (time1 == null || time2 == null) {
    return false;
  }
  return time1.hour == time2.hour;
}

bool dateInRange(DateTime? date, DateTime? start, DateTime? end) {
  if (date == null || start == null || end == null) {
    return false;
  }
  if (datesIsEqual(date, start) || datesIsEqual(date, end)) {
    return true;
  }
  if (date.isAfter(start) && date.isBefore(end)) {
    return true;
  }
  return false;
}

RelativeRect position(GlobalKey globalKey, BuildContext context) {
  final RenderBox popupButtonObject = globalKey.currentContext!.findRenderObject() as RenderBox;
  final RenderBox overlay = Overlay.of(context).context.findRenderObject() as RenderBox;
  final RelativeRect position = RelativeRect.fromRect(
    Rect.fromPoints(
      popupButtonObject.localToGlobal(Offset.zero, ancestor: overlay),
      popupButtonObject.localToGlobal(popupButtonObject.size.bottomRight(Offset.zero), ancestor: overlay),
    ),
    Offset.zero & overlay.size,
  );
  return position;
}

bool dateIsBefore(DateTime? testingDate, DateTime? startDate) {
  if (testingDate == null || startDate == null) {
    return false;
  }
  return (testingDate.year < startDate.year) ||
      (testingDate.year <= startDate.year && testingDate.month < startDate.month) ||
      (testingDate.year <= startDate.year && testingDate.month <= startDate.month && testingDate.day < startDate.day);
}

bool dateIsAfter(DateTime? testingDate, DateTime? startDate) {
  if (testingDate == null || startDate == null) {
    return false;
  }
  return (testingDate.year > startDate.year) ||
      (testingDate.year >= startDate.year && testingDate.month > startDate.month) ||
      (testingDate.year >= startDate.year && testingDate.month >= startDate.month && testingDate.day > startDate.day);
}
