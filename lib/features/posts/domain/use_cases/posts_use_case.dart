import 'package:dartz/dartz.dart';
import 'package:hot_reddit/features/posts/data/remote/models/params/get_posts_params.dart';
import '../../../../core/feature/domain/entities/error_entity.dart';
import '../../../../core/feature/domain/use_cases/use_case.dart';
import '../../data/repositories/posts_repository.dart';
import '../entities/posts_entity.dart';

class PostsUseCase extends UseCase<PostsEntity, PostsParams> {
  PostsUseCase(this.repository);
  PostsRepository repository;

  @override
  Future<Either<ErrorEntity, PostsEntity>> call(PostsParams params) async =>
      repository.logIn(params);
}
