import '../../../../../../core/configurations/app_configuration.dart';
import '../../../../../../core/constants.dart';
import '../../../../../../core/feature/data/models/params/params_model.dart';

class AllCommentsParams extends ParamsModel<AllCommentsParamsBody> {
  AllCommentsParams({
    required this.linkId,
    this.postId,
    this.children = const [],
  }) : super(body: AllCommentsParamsBody());

  final String linkId;

  final List<String> children;
  final String? postId;


  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.get;

  @override
  String? get url => 'api/morechildren';

  @override
  Map<String, String> get urlParams => {
    if(children.isNotEmpty)
      "children" : children.join(','),
    "link_id" : linkId.toString(),
    "api_type" : 'json',
  };

  @override
  bool get authorized => true;


}

class AllCommentsParamsBody extends BaseBodyModel {
  AllCommentsParamsBody();

  @override
  Map<String, dynamic> toJson() =>
      {
      };
}
