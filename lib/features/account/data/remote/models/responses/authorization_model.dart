import 'package:hot_reddit/core/feature/data/models/responses/response_model.dart';
import 'package:hot_reddit/core/feature/domain/entities/entity.dart';

import '../../../../domain/entities/account_entity.dart';

class AuthorizationModel extends ResponseModel<AuthorizationEntity> {
  String? accessToken;
  String? tokenType;
  String? deviceId;
  int? expiresIn;
  String? scope;

  AuthorizationModel(
      {this.accessToken,
        this.tokenType,
        this.deviceId,
        this.expiresIn,
        this.scope});

  AuthorizationModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    deviceId = json['device_id'];
    expiresIn = json['expires_in'];
    scope = json['scope'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['token_type'] = this.tokenType;
    data['device_id'] = this.deviceId;
    data['expires_in'] = this.expiresIn;
    data['scope'] = this.scope;
    return data;
  }
  @override
  fromJson(Map<String, dynamic> json) => AuthorizationModel.fromJson(json);

  AuthorizationEntity toEntity() => AuthorizationEntity(
    accessToken: accessToken,
    deviceId: deviceId,
    expiresIn: expiresIn,
    scope: scope,
    tokenType: tokenType,
  );
}

