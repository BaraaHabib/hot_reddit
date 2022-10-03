import '../../../../../../core/configurations/app_configuration.dart';
import '../../../../../../core/constants.dart';
import '../../../../../../core/feature/data/models/params/params_model.dart';

class PostsParams extends ParamsModel<PostsParamsBody> {
  PostsParams({
    this.subreddit = 'flutterdev',
    this.filterType = 'hot',
    this.count,
    this.after
  }) : super(body: PostsParamsBody(),);

  final String subreddit;
  final String filterType;
  final String? after;
  final int? count;


  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.get;

  @override
  String? get url => 'r/$subreddit/$filterType';

  @override
  Map<String, String> get urlParams => {
    "limit":"10",
    if(after != null)
      "after" : after!,
    if(count != null)
      "count" : count!.toString(),

  };

  @override
  bool get authorized => true;


}

class PostsParamsBody extends BaseBodyModel {
  PostsParamsBody();

  @override
  Map<String, dynamic> toJson() =>
      {
      };
}
