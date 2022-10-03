import '../../../../../../core/configurations/app_configuration.dart';
import '../../../../../../core/constants.dart';
import '../../../../../../core/feature/data/models/params/params_model.dart';

class AuthorizeParams extends ParamsModel<AuthorizeParamsBody> {
  AuthorizeParams() : super(body: AuthorizeParamsBody(),baseUrl: "https://www.reddit.com/api/");

  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.post;

  @override
  String? get url => 'v1/access_token';

  @override
  Map<String, String> get urlParams => {};

  @override
  bool get isBasicAuth => true;

  @override
  bool get authorized => true;


}

class AuthorizeParamsBody extends BaseBodyModel {
  AuthorizeParamsBody();

  @override
  Map<String, dynamic> toJson() =>
      {
        "grant_type" : 'https://oauth.reddit.com/grants/installed_client',
        "device_id":  "RrebWT7g_zer088R2WKl8A"
      };
}
