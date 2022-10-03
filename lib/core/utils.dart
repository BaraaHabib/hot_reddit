import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'configurations/app_configuration.dart';

class Utils {

  static void showToast(String message, [Toast? toastLength]) {
    Fluttertoast.showToast(msg: message, toastLength: toastLength);
  }

  static void showToastWithColor(String message ) {
    Fluttertoast.cancel();
    Fluttertoast.showToast(msg: message);
  }


  // use with splashPage to restart
  static void clearAllAndPushNamed(context, String route,
      {arguments,}) {

    Navigator.of(context, rootNavigator: true).popUntil((route) =>
    route.isFirst);
    Navigator.of(context, rootNavigator: true).pushReplacementNamed(
        route, arguments: arguments);
  }
  static void pushNavigateTo(context, String route,
      {arguments}) {
    if(kDebugMode){
      print('Going to rout: $route');
    }
    Navigator.of(context).pushNamed(route, arguments: arguments);
  }

  static Future pushReplacementNavigateTo(context, String route, {arguments}) async {
    await Navigator.of(context).pushReplacementNamed(route, arguments: arguments);
    // WidgetsBinding.instance?.addPostFrameCallback((_) {
    // });
  }


  static void popNavigate(context, {int popsCount = 1, bool value = false}) {
    // WidgetsBinding.instance?.addPostFrameCallback((_) {
      for (var i = 0; i < popsCount; i++) {
        if(Navigator.canPop(context)) {
          Navigator.of(context).pop(value);
        }
      }
    // });
  }

  static void popNavigateToFirst(context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).popUntil((route) => route.isFirst);
    });
  }

  static void clearAndPush(context, newRouteName) {
    print('Going to rout: $newRouteName');

    Navigator.of(context).popUntil((route) => route.isFirst);
    Navigator.of(context).pushReplacementNamed(newRouteName);
  }



  static String? getDateWithAppFormat(DateTime? value) =>
      value != null ? AppConfigurations.appDisplayDateFormat.format(value) : '';


  static String? getDateTimeWithAppFormat(DateTime? value) => value != null
      ? AppConfigurations.appDisplayDateTimeFormat.format(value)
      : '';


}
