import 'package:dartz/dartz.dart';
import 'package:hot_reddit/features/posts/data/remote/models/params/get_posts_params.dart';
import '../../../../core/feature/domain/entities/error_entity.dart';
import '../../../../core/feature/domain/use_cases/use_case.dart';
import '../../data/remote/models/params/get_comments_params.dart';
import '../../data/repositories/posts_repository.dart';
import '../entities/comments_entity.dart';
import '../entities/posts_entity.dart';

class CommentsUseCase extends UseCase<CommentsEntity, CommentsParams> {
  CommentsUseCase(this.repository);
  PostsRepository repository;

  @override
  Future<Either<ErrorEntity, CommentsEntity>> call(CommentsParams params) async =>
      repository.getComments(params);
}
