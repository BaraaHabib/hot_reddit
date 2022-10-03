import '../../../../../../core/configurations/app_configuration.dart';
import '../../../../../../core/constants.dart';
import '../../../../../../core/feature/data/models/params/params_model.dart';

class CommentsParams extends ParamsModel<CommentsParamsBody> {
  CommentsParams({
    required this.postId,
    this.subreddit = 'flutterdev',
    this.after,
    this.count,
  }) : super(body: CommentsParamsBody());

  final String subreddit;
  final String? after;
  final String postId;
  final int? count;


  @override
  Map<String, String> get additionalHeaders => {};

  @override
  RequestType? get requestType => RequestType.get;

  @override
  String? get url => 'r/$subreddit/comments/$postId';

  @override
  Map<String, String> get urlParams => {
    if(after != null)
      "after" : after!,
    if(count != null)
      "count" : count!.toString(),
  };

  @override
  bool get authorized => true;


}

class CommentsParamsBody extends BaseBodyModel {
  CommentsParamsBody();

  @override
  Map<String, dynamic> toJson() =>
      {
      };
}
