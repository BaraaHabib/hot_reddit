import 'package:dartz/dartz.dart';
import 'package:hot_reddit/core/feature/domain/entities/error_entity.dart';
import 'package:hot_reddit/features/posts/data/remote/models/params/get_all_comments_params.dart';
import 'package:hot_reddit/features/posts/data/remote/models/params/get_comments_params.dart';
import 'package:hot_reddit/features/posts/data/remote/models/params/user_info_comments_params.dart';
import 'package:hot_reddit/features/posts/domain/entities/get_all_comments_entity.dart';
import 'package:hot_reddit/features/posts/domain/entities/user_info_entity.dart';

import '../../../../core/feature/domain/repositories/irepository.dart';
import '../../data/remote/models/params/get_posts_params.dart';
import '../entities/comments_entity.dart';
import '../entities/posts_entity.dart';



abstract class IPostsRepository extends IRepository {
  Future<Either<ErrorEntity, PostsEntity>> logIn(PostsParams model);
  Future<Either<ErrorEntity, CommentsEntity>> getComments(CommentsParams model);
  Future<Either<ErrorEntity, MoreCommentsEntity>> getAllComments(AllCommentsParams model);
  Future<Either<ErrorEntity, UserInfoEntity>> getUserInfo(UserInfoParams model);
}
