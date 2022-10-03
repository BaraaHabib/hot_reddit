import 'package:flutter/cupertino.dart';

import '../../../../constants.dart';

@immutable
abstract class ParamsModel<BodyModelType extends BaseBodyModel> {
  final BodyModelType? body;

  /// set this to override base url
  final String? baseUrl;

  /// add additional headers to request here
  Map<String, String> get additionalHeaders;

  /// type of request : [RequestType.post] or [RequestType.get]
  RequestType? get requestType;

  /// [url] to api endpoint (without base url)
  /// not url is without page number or length
  /// you should fill base_url property in base provider
  String? get url;

  /// query parameters to be included in url
  Map<String, dynamic> get urlParams;

  bool get authorized => false;

  bool get isBasicAuth => false;

  const ParamsModel({this.body, this.baseUrl});

}

abstract class BaseBodyModel {
  Map<String, dynamic> toJson();
}
