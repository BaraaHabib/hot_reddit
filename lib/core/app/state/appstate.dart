
import 'package:flutter/material.dart';
import 'package:hot_reddit/core/constants.dart';
import 'package:hot_reddit/core/extended/extensions.dart';
import 'package:hot_reddit/core/shared_preferences_items.dart';
import 'package:hot_reddit/features/account/domain/entities/account_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../injection_container.dart';

class AppStateModel with ChangeNotifier {
  var theme = ThemeMode.light;
  late SharedPreferences prefs;

  bool get isLightTheme => theme == ThemeMode.light;

  AuthorizationEntity? authInfo;


  bool get isSessionExpired {
    var expiryDate = DateTime.tryParse(
        prefs.getString(SharedPreferencesKeys.TOKEN_EXPIRY_DATE) ?? '');
    if (expiryDate == null) {
      return true;
    }
    return authInfo?.accessToken == null ||
        expiryDate.compareTo(DateTime.now()) <= 0;
  }

  init() async {
    authInfo = AuthorizationEntity(
      tokenType: prefs.getString(SharedPreferencesKeys.TOKEN_TYPE),
      scope: prefs.getString(SharedPreferencesKeys.SCOPE),
      expiresIn: prefs.getInt(SharedPreferencesKeys.EXPIRES_IN),
      deviceId: prefs.getString(SharedPreferencesKeys.DEVICE_ID),
      accessToken: prefs.getString(SharedPreferencesKeys.TOKEN),
    );

  }

  authorizeApp(AuthorizationEntity auth) async{
    authInfo = auth;
    await prefs.setString(SharedPreferencesKeys.TOKEN, auth.accessToken! );
    await prefs.setString(SharedPreferencesKeys.TOKEN_TYPE, auth.tokenType!);
    await prefs.setInt(SharedPreferencesKeys.EXPIRES_IN, auth.expiresIn! );
    await prefs.setString(SharedPreferencesKeys.DEVICE_ID, auth.deviceId!);
    await prefs.setString(SharedPreferencesKeys.SCOPE, auth.scope!);
    await prefs.setString(SharedPreferencesKeys.TOKEN_EXPIRY_DATE, DateTime.now().add(Duration(seconds: auth.expiresIn ?? 0)).toString());

  }

  void changeMode() {
    if(isLightTheme){
      theme = ThemeMode.dark;
    }else{
      theme = ThemeMode.light;
    }
    prefs.setInt(SharedPreferencesKeys.APP_THEME, theme.index)
        .then((value) => notifyListeners());
  }

  _setTheme(){
    var themeIndex = prefs.getInt(SharedPreferencesKeys.APP_THEME,) ?? ThemeMode.light.index;
    switch(themeIndex){
      case 0:
        theme = ThemeMode.system;
        break;
      case 1:
        theme = ThemeMode.light;
        break;
      case 2:
        theme = ThemeMode.dark;
        break;
    }
  }

  Future<void> initTheme() async {
    prefs = await SharedPreferences.getInstance();
    // set theme
    _setTheme();
  }
}
