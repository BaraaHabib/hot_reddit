import 'package:flutter/material.dart';


class L10n {
  static final all = [
    const Locale('en'),
  ];

  static String getFlag(String code) {
    switch (code) {
      case 'ar':
        return '🇦🇪';
      case 'de':
        return '🇩🇪';
      case 'en':
      default:
        return '🇺🇸';
    }
  }
}

// class SpecifiedLocalizationDelegate
//     extends LocalizationsDelegate<S> {
//   const SpecifiedLocalizationDelegate(this.overriddenLocale);
//
//   final Locale overriddenLocale;
//
//   @override
//   bool isSupported(Locale locale) => overriddenLocale != null;
//
//   @override
//   Future<S> load(Locale locale) => S.load(overriddenLocale);
//
//   @override
//   bool shouldReload(SpecifiedLocalizationDelegate old) => true;
// }
