import 'package:dartz/dartz.dart';

import '../../../../core/exceptions/app_exceptions.dart';
import '../../../../core/feature/domain/entities/error_entity.dart';
import '../../domain/entities/account_entity.dart';
import '../../domain/repositories/iaccount_repository.dart';
import '../remote/data_sources/account_remote_data_source.dart';
import '../remote/models/params/authorize_params.dart';
import '../remote/models/responses/authorization_model.dart';


class AccountRepository extends IAccountRepository {
  AccountRemoteDataSource remoteDataSource;

  AccountRepository(this.remoteDataSource);


  @override
  Future<Either<ErrorEntity, AuthorizationEntity>> getToken(AuthorizeParams model) async {
    try {
      final res = await remoteDataSource.getToken(model);
      final AuthorizationModel remote = AuthorizationModel.fromJson(res);
    return Right(remote.toEntity());
    } on AppException catch (e) {
    return Left(ErrorEntity.fromException(e));
    }
  }

}
