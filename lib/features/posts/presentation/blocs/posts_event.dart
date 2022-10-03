part of 'posts_bloc.dart';

abstract class PostsEvent  {
  const PostsEvent();
}

class GetHotPostsEvent extends PostsEvent {
  const GetHotPostsEvent(this.params);
  final PostsParams params;
}

class GetPostCommentsEvent extends PostsEvent {
  const GetPostCommentsEvent(this.params);
  final CommentsParams params;
}

class GetAllCommentsEvent extends PostsEvent {
  const GetAllCommentsEvent(this.params);
  final AllCommentsParams params;
}
class GetUserInfoEvent extends PostsEvent {
  const GetUserInfoEvent(this.params);
  final UserInfoParams params;
}
