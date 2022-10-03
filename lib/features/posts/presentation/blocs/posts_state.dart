part of 'posts_bloc.dart';

abstract class PostsState  {
  const PostsState({this.message});
  final String? message;
}

class PostsInitial extends PostsState {

}

//# region
class PostsLoading extends PostsState {

  PostsLoading({this.isFetchingPage = false});

  final bool isFetchingPage;
}

class PostsLoaded extends PostsState {
  PostsLoaded(this.posts);

  PostsEntity posts;
}

class PostsError extends PostsState {

  PostsError(String message) : super(message: message);
}
//#endregion

//# region

class CommentsLoading extends PostsState {

  CommentsLoading({this.isFetchingPage = false});

  final bool isFetchingPage;
}

class CommentsLoaded extends PostsState {
  CommentsLoaded(this.comments);

  CommentsEntity comments;
}

class CommentsError extends PostsState {

  CommentsError(String message) : super(message: message);
}

//#endregion

//# region all comments

class AllCommentsLoading extends PostsState {

  AllCommentsLoading({this.isFetchingPage = false});

  final bool isFetchingPage;
}

class AllCommentsLoaded extends PostsState {
  AllCommentsLoaded(this.comments);

  MoreCommentsEntity comments;
}

class AllCommentsError extends PostsState {

  AllCommentsError(String message) : super(message: message);
}

//#endregion

//# region user info

class UserInfoState  extends PostsState{
  final String? user;

  UserInfoState(this.user);

}
class UserInfoLoading extends UserInfoState {

  UserInfoLoading({String? user}) : super(user);

}

class UserInfoLoaded extends UserInfoState {
  UserInfoLoaded(this.userInfo,{String? user}) : super(user);

  UserInfoEntity userInfo;

}

class UserInfoError extends UserInfoState {

  UserInfoError(String message,{String? user}) : super(user);

}

//#endregion
