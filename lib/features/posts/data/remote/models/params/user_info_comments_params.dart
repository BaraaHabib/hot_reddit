import '../../../../../../core/configurations/app_configuration.dart';
import '../../../../../../core/constants.dart';
import '../../../../../../core/feature/data/models/params/params_model.dart';

class UserInfoParams extends ParamsModel<AllCommentsParamsBody> {
  UserInfoParams({
    required this.name,
  }) : super(body: AllCommentsParamsBody(),baseUrl: 'https://www.reddit.com/user/');

  final String name;

  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.get;

  @override
  String? get url => '$name/about.json';

  @override
  Map<String, String> get urlParams => {
  };

  @override
  bool get authorized => false;


}

class AllCommentsParamsBody extends BaseBodyModel {
  AllCommentsParamsBody();

  @override
  Map<String, dynamic> toJson() =>
      {};
}
