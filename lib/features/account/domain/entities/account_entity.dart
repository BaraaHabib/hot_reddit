import 'package:hot_reddit/core/feature/domain/entities/entity.dart';


class AuthorizationEntity extends Entity {
  String? accessToken;
  String? tokenType;
  String? deviceId;
  int? expiresIn;
  String? scope;

  AuthorizationEntity(
      {
        this.accessToken,
        this.tokenType,
        this.deviceId,
        this.expiresIn,
        this.scope,
      });
}
