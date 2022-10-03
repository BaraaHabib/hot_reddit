
// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hot_reddit/core/navigation_service.dart';
import 'package:provider/provider.dart';

import '../../injection_container.dart';
import '../app/state/appstate.dart';

class Styles {

  static Color get colorPrimary =>
      Provider
          .of<AppStateModel>(
          sl<NavigationService>().navigatorKey.currentContext!)
          .isLightTheme
          ? colorPrimaryLight : colorPrimaryDark;

  static const colorPrimaryLight = Color(0xFF2B5793);
  static Color colorPrimaryDark = Color(0xff414141);

  static const colorAppRed = Color(0xFFC15959);

  static const subTitleCustomColor = Color(0xFF989898);


  static const fontFamily = 'OpenSans';

  // styles
  static const boxShadow = BoxShadow(
      color: Color(0x0000001A),
      blurRadius: 20,
      offset: Offset(0, 4),
      spreadRadius: 0,
      blurStyle: BlurStyle.normal
  );

}

abstract class CommonSizes {
  static const TINY_LAYOUT_W_GAP = 10.0;
  static const SMALL_LAYOUT_W_GAP = 25.0;
  static const MED_LAYOUT_W_GAP = 50.0;
  static const BIG_LAYOUT_W_GAP = 75.0;
  static const BIGGER_LAYOUT_W_GAP = 100.0;
  static const BIGGEST_LAYOUT_W_GAP = 125.0;
  static const BORDER_RADIUS_STANDARD = 15.0;
  static const BORDER_RADIUS_CORNERS_BIG = 18.0;

  // common sizes
  static var v5 = SizedBox(height: 5.h);
  static var v10 = SizedBox(height: 10.h);
  static var v25 = SizedBox(height: 25.h);


  static var h5 = SizedBox(width: 5.w,);
  static var h10 = SizedBox(width: 10.w);
  static var h20 = SizedBox(width: 20.w);


  static const divider = Divider(thickness: 10);

}
