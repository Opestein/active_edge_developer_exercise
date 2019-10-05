import 'dart:math';

import 'package:active_edge_developer_exercise/src/app.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

double responsiveWidth(context, double width) {
  MediaQueryData _mediaQueryData = MediaQuery.of(context);

  double blockHorizontal = _mediaQueryData.size.width / 100;
  double actualWidth = width * blockHorizontal;

  return actualWidth;
}

double responsiveHeight(context, double height) {
  MediaQueryData _mediaQueryData = MediaQuery.of(context);

  double blockVertical = _mediaQueryData.size.height / 100;
  double actualHeight = height * blockVertical;

  return actualHeight;
}

double safeAreaWidth(context, double width) {
  MediaQueryData _mediaQueryData = MediaQuery.of(context);

  double safeAreaHorizontal =
      _mediaQueryData.padding.left + _mediaQueryData.padding.right;

  double safeAreaBlockHorizontal =
      (_mediaQueryData.size.width - safeAreaHorizontal) / 100;
  double actualWidth = width * safeAreaBlockHorizontal;

  return actualWidth;
}

double safeAreaHeight(context, double height) {
  MediaQueryData _mediaQueryData = MediaQuery.of(context);

  double safeAreaVertical =
      _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;

  double safeAreaBlockVertical =
      (_mediaQueryData.size.height - safeAreaVertical) / 100;
  double actualHeight = height * safeAreaBlockVertical;

  return actualHeight;
}

double _singleUnit;
double _scaleFactor;
const noOfUnits = 480.0;

_setSingleUnit(context) {
  _singleUnit = MediaQuery.of(context).size.width;
  _scaleFactor = MediaQuery.of(context).textScaleFactor;
}

double textFontSize(context, double size) {
  double _scaleFactor = MediaQuery.of(context).textScaleFactor;
  return (size) / _scaleFactor;
}

//fontSize using textScaleFactor
double singleTextUnit(BuildContext context, double size) {
  if (_scaleFactor == null) _setSingleUnit(context);
  return (size) / _scaleFactor;
}

String randomString(int stringLength) {
  const chars = "abcdefghijklmnopqrstuvwxyz0123456789";

  Random rnd = new Random(new DateTime.now().millisecondsSinceEpoch);
  String result = "";
  for (var i = 0; i < stringLength; i++) {
    result += chars[rnd.nextInt(chars.length)];
  }
  return result;
}

const _days = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday'
];

const _months = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December'
];

const _shortMonths = [
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sept',
  'Oct',
  'Nov',
  'Dec'
];

const _shortDays = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

String getUrlToUse(String url) {
  return url.replaceAll('url', replacementUrlA);
}

int getDayOfMonth(int dateValue) {
  var date = DateTime.fromMillisecondsSinceEpoch(dateValue);
  return date.day;
}

String getDayOfWeek(int dateValue) {
  var date = DateTime.fromMillisecondsSinceEpoch(dateValue);
  return _days[date.weekday - 1];
}

String getMonthOfYear(int dateValue) {
  var date = DateTime.fromMillisecondsSinceEpoch(dateValue);
  return _months[date.month - 1];
}

String getDayDDmm(int dateValue) {
  //Thu, 09 May
  var date = DateTime.fromMillisecondsSinceEpoch(dateValue);
  return '${_shortDays[date.weekday - 1]}, ${beautifyDay(date.day)} ${_shortMonths[date.month - 1]}';
}

String beautifyDay(int day) {
  if (day < 10)
    return '0$day';
  else
    return '$day';
}

int nextDay(int dateValue) {
  var date = DateTime.fromMillisecondsSinceEpoch(dateValue);
  date.add(Duration(days: 1));
  return date.millisecondsSinceEpoch;
  ;
}

String getLongDate(int dateValue) {
  var date = DateTime.fromMillisecondsSinceEpoch(dateValue);
  return DateFormat('EEE, MMM d, yyyy').format(date);
}

String getLongDateB(String dateValue) {
  var date = DateFormat('yyyy-MM-dd HH:mm:ss').parse(dateValue);
  return DateFormat('EEE, d MMM yyyy').format(date);
}

String getMonthDate(int dateValue) {
  var date = DateTime.fromMillisecondsSinceEpoch(dateValue);
  return DateFormat('MMM, dd').format(date);
}

String get24hrsFromString(String dateValue) {
  var date = DateFormat('yyyy-MM-dd HH:mm:ss').parse(dateValue);
  return get24hrs(date.millisecondsSinceEpoch);
}

String get24hrs(int dateValue) {
  var date = DateTime.fromMillisecondsSinceEpoch(dateValue);
  return DateFormat('HH:mm').format(date);
}

String getDuration(String original) {
  var values = original.split(':');
  if (values[0].contains('.')) {
    var subValues = values[0].split('.');
    values[0] =
        ((int.parse(subValues[0]) * 24) + int.parse(subValues[1])).toString();
  }
  return '${values[0]}h ${values[1]}m';
}

String simpleDate(int dateValue) {
  var date = DateTime.fromMillisecondsSinceEpoch(dateValue);
  return DateFormat('yyyy-MM-dd').format(date);
}

String getLongDayDateFromString(String dateValue) {
  var date =
      DateFormat('yyyy-MM-dd HH:mm:ss').parse(dateValue.replaceAll('T', ' '));
  return getLongDayDate(date.millisecondsSinceEpoch);
}

String getLongDayDate(int dateValue) {
  var date = DateTime.fromMillisecondsSinceEpoch(dateValue);
  return DateFormat('EEE, d MMM yyyy').format(date);
}

String getSubmitDate(int dateValue) {
  var date = DateTime.fromMillisecondsSinceEpoch(dateValue);
  return DateFormat('MM/dd/yyyy').format(date);
}

String formattedMoney(double value) {
  return NumberFormat('#,###').format(value);
}

String formatted(double value) {
  return NumberFormat('###').format(value);
}

DateTime getTenYearsFromDateTime(DateTime dateTime) {
  //Adds ten years and a month to the passed DateTime,
  //Setting the day to zero returns the previous month's last day
  DateTime tenYearsFromDateTime =
      DateTime(dateTime.year + 10, dateTime.month + 1, 0);
  return tenYearsFromDateTime;
}
