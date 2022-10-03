
import 'package:hot_reddit/features/posts/data/remote/models/params/get_all_comments_params.dart';
import 'package:hot_reddit/features/posts/data/remote/models/params/get_comments_params.dart';

import '../../../../../core/feature/data/data_sources/remote_data_source.dart';
import '../models/params/get_posts_params.dart';
import '../models/params/user_info_comments_params.dart';
import '../models/responses/get_posts_model.dart';

abstract class IPostsRemoteDataSource extends RemoteDataSource {
  Future<dynamic> getPosts(PostsParams model);
  Future<dynamic> getPostComments(CommentsParams model);
  Future<dynamic> getAllComments(AllCommentsParams model);
  Future<dynamic> getUserInfo(UserInfoParams model);
}

class PostsRemoteDataSource extends IPostsRemoteDataSource {
  @override
  Future<dynamic> getPosts(PostsParams model) async {
    var res = await performRequest(model);
    return Future.value(res);
  }

  @override
  Future getPostComments(CommentsParams model) async {
    var res = await performRequest(model);
    return Future.value(res);
  }

  @override
  Future getAllComments(AllCommentsParams model) async {
    var res = await performRequest(model);
    return Future.value(res);

  }

  @override
  Future getUserInfo(UserInfoParams model) async {
    var res = await performRequest(model);
    return Future.value(res);

  }
}
