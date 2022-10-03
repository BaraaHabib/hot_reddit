import 'package:hot_reddit/core/feature/data/models/responses/response_model.dart';
import 'package:hot_reddit/core/feature/domain/entities/entity.dart';
import 'package:hot_reddit/core/feature/domain/entities/error_entity.dart';

class ErrorModel extends ResponseModel<ErrorEntity> {
  ErrorModel({this.message, this.details, this.validationErrors});

  ErrorModel.fromJson(Map<dynamic, dynamic> parsedJson)
  {
    message = parsedJson['message'] ?? '';
  }

  String? message;
  String? details;
  List<String>? validationErrors = [];


  @override
  fromJson(Map<String, dynamic> json) {
    message = json['message'] ?? '';

  }

  @override
  ErrorEntity toEntity() => ErrorEntity(errorMessage: message ?? '');
}
