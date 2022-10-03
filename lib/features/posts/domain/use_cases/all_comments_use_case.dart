import 'package:dartz/dartz.dart';
import 'package:hot_reddit/features/posts/data/remote/models/params/get_all_comments_params.dart';
import 'package:hot_reddit/features/posts/data/remote/models/params/get_posts_params.dart';
import 'package:hot_reddit/features/posts/domain/entities/get_all_comments_entity.dart';
import '../../../../core/feature/domain/entities/error_entity.dart';
import '../../../../core/feature/domain/use_cases/use_case.dart';
import '../../data/remote/models/params/get_comments_params.dart';
import '../../data/repositories/posts_repository.dart';
import '../entities/comments_entity.dart';
import '../entities/posts_entity.dart';

class AllCommentsUseCase extends UseCase<MoreCommentsEntity, AllCommentsParams> {
  AllCommentsUseCase(this.repository);

  PostsRepository repository;

  @override
  Future<Either<ErrorEntity, MoreCommentsEntity>> call(
      AllCommentsParams params) async =>
      repository.getAllComments(params);
}
