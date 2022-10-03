
import 'package:hot_reddit/core/feature/domain/entities/entity.dart';

abstract class ResponseModel<T extends Entity> {

  fromJson(Map<String, dynamic> json);

  Entity toEntity();
}
