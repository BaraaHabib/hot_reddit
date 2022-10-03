

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:draw/draw.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:hot_reddit/core/configurations/app_configuration.dart';
import 'package:hot_reddit/features/posts/data/remote/models/params/get_all_comments_params.dart';
import 'package:hot_reddit/features/posts/data/remote/models/params/get_comments_params.dart';
import 'package:hot_reddit/features/posts/data/remote/models/params/user_info_comments_params.dart';
import 'package:hot_reddit/features/posts/domain/entities/comments_entity.dart';
import 'package:hot_reddit/features/posts/domain/entities/get_all_comments_entity.dart';
import 'package:hot_reddit/features/posts/domain/entities/user_info_entity.dart';
import 'package:hot_reddit/features/posts/domain/use_cases/all_comments_use_case.dart';
import 'package:hot_reddit/features/posts/domain/use_cases/comments_use_case.dart';
import 'package:hot_reddit/features/posts/domain/use_cases/user_info_use_case.dart';

import '../../../../injection_container.dart';
import '../../data/remote/models/params/get_posts_params.dart';
import '../../data/repositories/posts_repository.dart';
import '../../domain/entities/posts_entity.dart';
import '../../domain/use_cases/posts_use_case.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {

  PostsBloc() : super(PostsInitial()) {
    on<GetHotPostsEvent>((event, emit) async {
      emit(PostsLoading(isFetchingPage: event.params.after != null));
      final res = await PostsUseCase(sl<PostsRepository>()).call(event.params);
      emit(
        res.fold(
              (l) => PostsError(l.errorMessage ?? ''),
              (r) => PostsLoaded(r),
        ),
      );
    });

    on<GetPostCommentsEvent>((event, emit) async {
      emit(CommentsLoading(isFetchingPage: event.params.after != null));
      final res = await CommentsUseCase(sl<PostsRepository>()).call(event.params);
      emit(
        res.fold(
              (l) => CommentsError(l.errorMessage ?? ''),
              (r) => CommentsLoaded(r),
        ),
      );
    });

    on<GetAllCommentsEvent>((event, emit) async {
      emit(AllCommentsLoading());
      final res = await AllCommentsUseCase(sl<PostsRepository>()).call(event.params);
      emit(
        res.fold(
              (l) => AllCommentsError(l.errorMessage ?? ''),
              (r) => AllCommentsLoaded(r),
        ),
      );
    });

    on<GetUserInfoEvent>((event, emit) async {
      emit(UserInfoLoading(user: event.params.name));
      final res = await UserInfoUseCase(sl<PostsRepository>()).call(event.params);
      emit(
        res.fold(
              (l) => UserInfoError(l.errorMessage ?? '',user: event.params.name),
              (r) => UserInfoLoaded(r,user: event.params.name),
        ),
      );
    });
  }
}