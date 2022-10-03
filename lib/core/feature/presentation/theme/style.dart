import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hot_reddit/core/configurations/styles.dart';

final ThemeData appLightTheme = ThemeData(
  fontFamily: Styles.fontFamily,
  primaryColor: Styles.colorPrimaryLight,
  primaryColorLight: const Color( 0xffd8e3f3 ),
  primaryColorDark: const Color( 0xff234676 ),
  canvasColor: const Color( 0xfffafafa ),
  scaffoldBackgroundColor: Color(0xFFF5F5F5),
  bottomAppBarColor: const Color( 0xffffffff ),
  cardColor: const Color( 0xffffffff ),
  dividerColor: const Color( 0xFF9C9C9C ),
  highlightColor: const Color( 0x66bcbcbc ),
  splashColor: const Color( 0x66c8c8c8 ),
  selectedRowColor: const Color( 0xfff5f5f5 ),
  unselectedWidgetColor: const Color( 0x8a000000 ),
  disabledColor: const Color( 0x61000000 ),
  toggleableActiveColor: const Color( 0xff2e5d9e ),
  secondaryHeaderColor: const Color( 0xffebf1f9 ),
  backgroundColor: const Color( 0xffb0c8e8 ),
  dialogBackgroundColor: const Color( 0xffffffff ),
  indicatorColor: const Color( 0xff3a75c5 ),
  hintColor: const Color( 0x8a000000 ),
  errorColor: const Color( 0xffd32f2f ),
  textTheme: TextTheme(
    headline5:TextStyle(
        color: Color(0xFF989898)
    ) ,
    subtitle2: TextStyle(
      color: Color(0xFF000000)
    ),
  ),
  buttonTheme: const ButtonThemeData(
    textTheme: ButtonTextTheme.normal,
    minWidth: 88,
    height: 36,
    padding: EdgeInsets.only(top:0,bottom:0,left:16, right:16),
    shape:     RoundedRectangleBorder(
      side: BorderSide(color: Color( 0xff000000 ), width: 0, style: BorderStyle.none, ),
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    )
    ,
    alignedDropdown: false ,
    buttonColor: Color( 0xffe0e0e0 ),
    disabledColor: Color( 0x61000000 ),
    highlightColor: Color( 0x29000000 ),
    splashColor: Color( 0x1f000000 ),
    focusColor: Color( 0x1f000000 ),
    hoverColor: Color( 0x0a000000 ),
    colorScheme: ColorScheme(
      primary: Color( 0xff2b5793 ),
      secondary: Color( 0xff3a75c5 ),
      surface: Color( 0xffffffff ),
      background: Color( 0xffb0c8e8 ),
      error: Color( 0xffd32f2f ),
      onPrimary: Color( 0xffffffff ),
      onSecondary: Color( 0xffffffff ),
      onSurface: Color( 0xff000000 ),
      onBackground: Color( 0xffffffff ),
      onError: Color( 0xffffffff ),
      brightness: Brightness.light,
    ),
  ),
  iconTheme: const IconThemeData(
    color: Color( 0xdd000000 ),
    opacity: 1,
    size: 24,
  ),
  primaryIconTheme: const IconThemeData(
    color: Color( 0xffffffff ),
    opacity: 1,
    size: 24,
  ),
  tabBarTheme: const TabBarTheme(
    indicatorSize: TabBarIndicatorSize.tab,
    labelColor: Color( 0xffffffff ),
    unselectedLabelColor: Color( 0xb2ffffff ),
  ),
  chipTheme: const ChipThemeData(
    backgroundColor: Color( 0x1f000000 ),
    brightness: Brightness.light,
    deleteIconColor: Color( 0xde000000 ),
    disabledColor: Color( 0x0c000000 ),
    labelPadding: EdgeInsets.only(top:0,bottom:0,left:8, right:8),
    labelStyle: TextStyle(
      color: Color( 0xde000000 ),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    padding: EdgeInsets.only(top:4,bottom:4,left:4, right:4),
    secondaryLabelStyle: TextStyle(
      color: Color( 0x3d000000 ),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    secondarySelectedColor: Color( 0x3d2b5793 ),
    selectedColor: Color( 0x3d000000 ),
    shape: StadiumBorder( side: BorderSide(color: Color( 0xff000000 ), width: 0, style: BorderStyle.none, ) ),
  ),
  dialogTheme: const DialogTheme(
      shape:     RoundedRectangleBorder(
        side: BorderSide(color: Color( 0xff000000 ), width: 0, style: BorderStyle.none, ),
        borderRadius: BorderRadius.all(Radius.circular(0.0)),
      )

  ), colorScheme: ColorScheme.fromSwatch(primarySwatch: const MaterialColor(4281030547,{50: Color( 0xffebf1f9 )
    , 100: Color( 0xffd8e3f3 )
    , 200: Color( 0xffb0c8e8 )
    , 300: Color( 0xff89acdc )
    , 400: Color( 0xff6190d1 )
    , 500: Color( 0xff3a75c5 )
    , 600: Color( 0xff2e5d9e )
    , 700: Color( 0xff234676 )
    , 800: Color( 0xff172f4f )
    , 900: Color( 0xff0c1727 )
  })).copyWith(secondary: const Color( 0xff3a75c5 )), textSelectionTheme: const TextSelectionThemeData(cursorColor: Color( 0xff4285f4 ), selectionColor: Color( 0xffb0c8e8 ), selectionHandleColor: Color( 0xff89acdc ),),
);

final ThemeData appDarkTheme = ThemeData(
  fontFamily: Styles.fontFamily,
  primaryColor: Styles.colorPrimaryDark,
  primaryColorLight: const Color( 0xff9e9e9e ),
  primaryColorDark: const Color( 0xff000000 ),
  canvasColor: const Color( 0xff303030 ),
  scaffoldBackgroundColor: const Color(0xFF212121),
  bottomAppBarColor: const Color( 0xff424242 ),
  cardColor: const Color( 0xff424242 ),
  dividerColor: const Color( 0x1fffffff ),
  highlightColor: const Color( 0x40cccccc ),
  splashColor: const Color( 0x40cccccc ),
  selectedRowColor: const Color( 0xfff5f5f5 ),
  unselectedWidgetColor: const Color( 0xb3ffffff ),
  disabledColor: const Color( 0x62ffffff ),
  toggleableActiveColor: const Color( 0xff64ffda ),
  secondaryHeaderColor: const Color( 0xff616161 ),
  backgroundColor: const Color( 0xff616161 ),
  dialogBackgroundColor: const Color( 0xff424242 ),
  indicatorColor: const Color( 0xff64ffda ),
  hintColor: const Color( 0x80ffffff ),
  errorColor: const Color( 0xffd32f2f ),
  textTheme: const TextTheme(
    headline5:TextStyle(
        color: Color(0xFF989898)
    ) ,
    subtitle2: const TextStyle(
      color: Color(0xFFFFFFFF)
    ),
    bodyText2:TextStyle(
        color: Color(0xFFFFFFFF)
    ),
  ),
  buttonTheme: const ButtonThemeData(
    textTheme: ButtonTextTheme.normal,
    minWidth: 88,
    height: 36,
    padding: EdgeInsets.only(top:0,bottom:0,left:16, right:16),
    shape:     RoundedRectangleBorder(
      side: BorderSide(color: Color( 0xff000000 ), width: 0, style: BorderStyle.none, ),
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    )
    ,
    alignedDropdown: false ,
    buttonColor: Color( 0xff2e5d9e ),
    disabledColor: Color( 0x61ffffff ),
    highlightColor: Color( 0x29ffffff ),
    splashColor: Color( 0x1fffffff ),
    focusColor: Color( 0x1fffffff ),
    hoverColor: Color( 0x0affffff ),
    colorScheme: ColorScheme(
      primary: Color( 0xff2b5793 ),
      secondary: Color( 0xff64ffda ),
      surface: Color( 0xff424242 ),
      background: Color( 0xff616161 ),
      error: Color( 0xffd32f2f ),
      onPrimary: Color( 0xffffffff ),
      onSecondary: Color( 0xff000000 ),
      onSurface: Color( 0xffffffff ),
      onBackground: Color( 0xffffffff ),
      onError: Color( 0xff000000 ),
      brightness: Brightness.dark,
    ),
  ),
  iconTheme: const IconThemeData(
    color: Color( 0xffffffff ),
    opacity: 1,
    size: 24,
  ),
  primaryIconTheme: const IconThemeData(
    color: Color( 0xffffffff ),
    opacity: 1,
    size: 24,
  ),
  sliderTheme: const SliderThemeData(
    activeTrackColor: null,
    inactiveTrackColor: null,
    disabledActiveTrackColor: null,
    disabledInactiveTrackColor: null,
    activeTickMarkColor: null,
    inactiveTickMarkColor: null,
    disabledActiveTickMarkColor: null,
    disabledInactiveTickMarkColor: null,
    thumbColor: null,
    disabledThumbColor: null,
    thumbShape: null,
    overlayColor: null,
    valueIndicatorColor: null,
    valueIndicatorShape: null,
    showValueIndicator: null,
    valueIndicatorTextStyle: TextStyle(
      color: Color( 0xdd000000 ),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  ),
  tabBarTheme: const TabBarTheme(
    indicatorSize: TabBarIndicatorSize.tab,
    labelColor: Color( 0xffffffff ),
    unselectedLabelColor: Color( 0xb2ffffff ),
  ),
  chipTheme: const ChipThemeData(
    backgroundColor: Color( 0x1fffffff ),
    brightness: Brightness.dark,
    deleteIconColor: Color( 0xdeffffff ),
    disabledColor: Color( 0x0cffffff ),
    labelPadding: EdgeInsets.only(top:0,bottom:0,left:8, right:8),
    labelStyle: TextStyle(
      color: Color( 0xdeffffff ),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    padding: EdgeInsets.only(top:4,bottom:4,left:4, right:4),
    secondaryLabelStyle: TextStyle(
      color: Color( 0x3dffffff ),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    secondarySelectedColor: Color( 0x3d212121 ),
    selectedColor: Color( 0x3dffffff ),
    shape: StadiumBorder( side: BorderSide(color: Color( 0xff000000 ), width: 0, style: BorderStyle.none, ) ),
  ),
  dialogTheme: const DialogTheme(
      shape:     RoundedRectangleBorder(
        side: BorderSide(color: Color( 0xff000000 ), width: 0, style: BorderStyle.none, ),
        borderRadius: BorderRadius.all(Radius.circular(0.0)),
      )

  ), colorScheme: ColorScheme.fromSwatch(primarySwatch: const MaterialColor(4280361249,{50: Color( 0xfff2f2f2 )
    , 100: Color( 0xffe6e6e6 )
    , 200: Color( 0xffcccccc )
    , 300: Color( 0xffb3b3b3 )
    , 400: Color( 0xff999999 )
    , 500: Color( 0xff808080 )
    , 600: Color( 0xff666666 )
    , 700: Color( 0xff4d4d4d )
    , 800: Color( 0xff333333 )
    , 900: Color( 0xff191919 )
  })).copyWith(secondary: const Color( 0xff64ffda )),
  textSelectionTheme: const TextSelectionThemeData(cursorColor: Color( 0xff4285f4 ), selectionColor: Color( 0xff64ffda ), selectionHandleColor: Color( 0xff1de9b6 ),),
);