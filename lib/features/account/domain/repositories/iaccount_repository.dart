import 'package:dartz/dartz.dart';
import 'package:hot_reddit/core/feature/domain/entities/error_entity.dart';

import '../../../../core/feature/domain/repositories/irepository.dart';
import '../../data/remote/models/params/authorize_params.dart';
import '../entities/account_entity.dart';



abstract class IAccountRepository extends IRepository {
  Future<Either<ErrorEntity, AuthorizationEntity>> getToken(AuthorizeParams model);
}
