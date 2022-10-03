
import 'package:flutter/foundation.dart' as Foundation;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class AppHelperFunctions {
  /// boolean to check if application in release or debug
  static bool get inReleaseMode => Foundation.kReleaseMode;

  /// check if instance is a sub type from type T
  static bool checkIfIsSubType<T>(instance) =>
      instance is T && instance.runtimeType != T;

  /// check if instance is a sub type from type T or it is same type
  static bool checkIfSubOrSameType<T>(instance) =>
      instance is T && instance.runtimeType != T || instance is T;

  static Color hexToColor(String code) {
    try {
      if (code == '') {
        return Colors.grey;
      }
      else {
        return Color(
          int.tryParse(code.substring(1, 7), radix: 16)! + 0xFF000000,);
      }
    }
    on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return Colors.grey;
    }
  }
  static String colorToHex(Color color) {
    try {
      final value=color.value.toRadixString(16);
      return
          value.replaceFirst('ff', '#') ;
    }
    on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return '#000000';
    }
  }

}