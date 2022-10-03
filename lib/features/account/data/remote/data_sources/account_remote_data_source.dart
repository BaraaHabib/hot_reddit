
import '../../../../../core/feature/data/data_sources/remote_data_source.dart';
import '../models/params/authorize_params.dart';
import '../models/responses/authorization_model.dart';

abstract class IAccountRemoteDataSource extends RemoteDataSource {
  Future<dynamic> getToken(AuthorizeParams model);
}

class AccountRemoteDataSource extends IAccountRemoteDataSource {
  @override
  Future<dynamic> getToken(AuthorizeParams model) async {
    var res = await performRequest(model);
    return Future.value(res);
  }

}
