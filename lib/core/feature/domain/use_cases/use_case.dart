
import 'package:dartz/dartz.dart';

import '../../data/models/params/params_model.dart';
import '../entities/entity.dart';
import '../entities/error_entity.dart';

abstract class UseCase<DataEntity extends Entity, Params extends ParamsModel> {
  Future<Either<ErrorEntity, DataEntity>> call(Params params);
}

// This will be used by the code calling the use case whenever the use case
// doesn't accept any parameters.
class NoParams  {
}
