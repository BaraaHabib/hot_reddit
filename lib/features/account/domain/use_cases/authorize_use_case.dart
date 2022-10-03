import 'package:dartz/dartz.dart';
import 'package:hot_reddit/features/account/data/remote/models/params/authorize_params.dart';
import 'package:hot_reddit/features/posts/data/remote/models/params/get_posts_params.dart';
import '../../../../core/feature/domain/entities/error_entity.dart';
import '../../../../core/feature/domain/use_cases/use_case.dart';
import '../../data/repositories/account_repository.dart';
import '../entities/account_entity.dart';

class AuthorizeUseCase extends UseCase<AuthorizationEntity, AuthorizeParams> {
  AuthorizeUseCase(this.repository);
  AccountRepository repository;

  @override
  Future<Either<ErrorEntity, AuthorizationEntity>> call(AuthorizeParams params) async =>
      repository.getToken(params);
}
