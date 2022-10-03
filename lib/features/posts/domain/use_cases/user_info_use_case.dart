import 'package:dartz/dartz.dart';
import 'package:hot_reddit/features/posts/data/remote/models/params/get_posts_params.dart';
import 'package:hot_reddit/features/posts/data/remote/models/params/user_info_comments_params.dart';
import 'package:hot_reddit/features/posts/domain/entities/user_info_entity.dart';
import '../../../../core/feature/domain/entities/error_entity.dart';
import '../../../../core/feature/domain/use_cases/use_case.dart';
import '../../data/repositories/posts_repository.dart';
import '../entities/posts_entity.dart';

class UserInfoUseCase extends UseCase<UserInfoEntity, UserInfoParams> {
  UserInfoUseCase(this.repository);
  PostsRepository repository;

  @override
  Future<Either<ErrorEntity, UserInfoEntity>> call(UserInfoParams params) async =>
      repository.getUserInfo(params);
}
