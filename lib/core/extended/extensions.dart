import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:collection/collection.dart';
import '../constants.dart';


extension DateTimeExten on DateTime {

  bool sameDayAs(DateTime other) =>
      year == other.year && month == other.month && day == other.day;

  bool sameMonthAs(DateTime other) =>
      year == other.year && month == other.month;

  DateTime copyWith(
      {int? year, int? month, int? day, int? hours, int? minutes}) {
    final rYear = year ?? this.year;
    final rMonth = month ?? this.month;
    final rDay = day ?? this.day;
    final rHour = hours ?? hour;
    final rMinutes = minutes ?? minute;

    return DateTime(rYear, rMonth, rDay, rHour, rMinutes);
  }

  DateTime toDate(
      {int? year, int? month, int? day, int? hours, int? minutes}) {
    final rYear = year ?? this.year;
    final rMonth = month ?? this.month;
    final rDay = day ?? this.day;
    final rHour = hours ?? hour;
    final rMinutes = minutes ?? minute;

    return DateTime(rYear, rMonth, rDay, rHour, rMinutes,);
  }

  DateTime removeDate(
          {int? year, int? month, int? day, int? hours, int? minutes}) =>
      DateTime(0, 0, 0, hour, minute, second);

  /// use this to calculate date in hour, minuit, seconds only
  /// this is to avoid day light saving issues
  Duration timeDifferenceOnly(DateTime other) =>
      removeDate().difference(other.removeDate());

  String get apiFormat =>
      DateFormat('E,d LLL yyyy HH:mm:ss', 'en').format(this);
}

extension IntExten on num {
  num get fixed {
    var result = this;
    if (result == roundToDouble()) {
      result = toInt();
    }
    return result;
  }
}

extension FileExten on File{


  String? get extension {
    final ext = path
        .split('.')
        .lastOrNull;
    return ext;
  }

  String? get name {
    var parts = path.split('/');
    if (parts.isNotEmpty) {
      parts = parts.last.split('.');
      if (parts.isNotEmpty) {
        return parts[0];
      }
    }
    return null;
  }
}

extension StringExtension on String {
    String get capitalize => '${this[0].toUpperCase()}'
        '${substring(1).toLowerCase()}';
}
