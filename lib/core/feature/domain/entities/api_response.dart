
import '../../../exceptions/app_exceptions.dart';
import '../../../helper_functions.dart';
import '../../../utils.dart';
import '../../data/models/responses/error_model.dart';
import 'error_entity.dart';

class ApiResponse<T> {
  Status? status;
  T? data;
  String? message;

  ApiResponse.loading([this.message = '']) : status = Status.LOADING;

  ApiResponse.completed(this.data) : status = Status.COMPLETED;

  ApiResponse.noInternet() : status = Status.NO_INTERNET;

  ApiResponse.noItems() : status = Status.NO_ITEMS;

  /// you can send error model or an exception
  ApiResponse.error(error, [context]) {
    status = Status.ERROR;
    try {
      if (AppHelperFunctions.checkIfIsSubType<Exception>(error) ||
          AppHelperFunctions.checkIfIsSubType<Error>(error)) {
        message = error?.toString();

        if (AppHelperFunctions.checkIfSubOrSameType<ServerErrorException>(
            error)) {
          var err = ErrorModel.fromJson(error.questionData['error']);
          message = err.message;
        }
      }
      else if (error is String) {
        message = error;
      }
    } catch (e) {
      message = 'Server error';
    }
  }

  ApiResponse.idle([this.message = '']) : status = Status.IDLE;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { LOADING, COMPLETED, ERROR, IDLE, NO_ITEMS, NO_INTERNET }
