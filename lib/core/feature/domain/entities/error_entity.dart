
import '../../../exceptions/app_exceptions.dart';
import 'base_response.dart';
import 'entity.dart';

class ErrorEntity extends Entity {
  ErrorEntity({this.errorMessage,});

  ErrorEntity.fromJson(Map<String, dynamic> parsedJson){
    if (parsedJson['message'] != null) {
      errorMessage = parsedJson['message'];
    }
  }

  ErrorEntity.fromException(AppException exception) {
    errorMessage = exception.message;
  }


  String? errorMessage;

}