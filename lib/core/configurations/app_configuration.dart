import 'dart:io';

import 'package:intl/intl.dart';


class AppConfigurations {
  static const String applicationName = 'Hot Reddit';

  static const String baseUrl = 'https://oauth.reddit.com/';

  static const Map<String, String> baseHeaders = {
    'accept': 'text/plain',
    'Content-Type': 'application/json',
  };

  static DateFormat appDisplayDateFormat = DateFormat('dd/MM/yyyy', 'en');

  static DateFormat appDisplayDateTimeFormat = DateFormat('dd/MM/yyyy   HH:mm  ', 'en');

  static const RedditId = 'RrebWT7g_zer088R2WKl8A';
  static const RedditAgent = 'test_app';
  static const RedditRedirectUrl = 'hreddit://succsess';
}
