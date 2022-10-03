import 'package:dartz/dartz.dart';
import 'package:hot_reddit/features/posts/data/remote/models/params/get_all_comments_params.dart';
import 'package:hot_reddit/features/posts/data/remote/models/params/get_comments_params.dart';
import 'package:hot_reddit/features/posts/data/remote/models/params/user_info_comments_params.dart';
import 'package:hot_reddit/features/posts/data/remote/models/responses/user_info_model.dart';
import 'package:hot_reddit/features/posts/domain/entities/comments_entity.dart';
import 'package:hot_reddit/features/posts/domain/entities/get_all_comments_entity.dart';
import 'package:hot_reddit/features/posts/domain/entities/user_info_entity.dart';

import '../../../../core/exceptions/app_exceptions.dart';
import '../../../../core/feature/domain/entities/error_entity.dart';
import '../../domain/entities/posts_entity.dart';
import '../../domain/repositories/iposts_repository.dart';
import '../remote/data_sources/posts_remote_data_source.dart';
import '../remote/models/params/get_posts_params.dart';
import '../remote/models/responses/get_all_comments_model.dart';
import '../remote/models/responses/get_comments_model.dart';
import '../remote/models/responses/get_posts_model.dart';


class PostsRepository extends IPostsRepository {
  PostsRemoteDataSource remoteDataSource;

  PostsRepository(this.remoteDataSource);

  @override
  Future<Either<ErrorEntity, PostsEntity>> logIn(PostsParams model) async {
    try {
      final res = await remoteDataSource.getPosts(model);
      final PostsModel remote =PostsModel.fromJson(res);
      return Right(remote.toEntity());
    } on AppException catch (e) {
      return Left(ErrorEntity.fromException(e));
    }
  }

  @override
  Future<Either<ErrorEntity, CommentsEntity>> getComments(CommentsParams model) async {
    try {
      final res = await remoteDataSource.getPostComments(model);
      final CommentsModel remote =CommentsModel.fromJson(res);
      return Right(remote.toEntity());
    } on AppException catch (e) {
      return Left(ErrorEntity.fromException(e));
    }
  }

  @override
  Future<Either<ErrorEntity, MoreCommentsEntity>> getAllComments(AllCommentsParams model) async {
    try {
      final res = await remoteDataSource.getAllComments(model);
      final MoreCommentsModel remote = MoreCommentsModel.fromJson(res);
      return Right(remote.toEntity());
    } on AppException catch (e) {
      return Left(ErrorEntity.fromException(e));
    }
  }

  @override
  Future<Either<ErrorEntity, UserInfoEntity>> getUserInfo(UserInfoParams model) async {
    try {
      final res = await remoteDataSource.getUserInfo(model);
      final UserInfoModel remote = UserInfoModel.fromJson(res);
      return Right(remote.toEntity());
    } on AppException catch (e) {
      return Left(ErrorEntity.fromException(e));
    }
  }

}
