import 'package:hot_reddit/core/feature/data/models/responses/response_model.dart';
import 'package:hot_reddit/core/feature/domain/entities/entity.dart';
import 'package:hot_reddit/features/posts/domain/entities/user_info_entity.dart';

class UserInfoModel extends ResponseModel<UserInfoEntity> {
  String? kind;
  UserInfoDataModel? data;

  UserInfoModel({this.kind, this.data});

  UserInfoModel.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    data = json['data'] != null ? new UserInfoDataModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kind'] = this.kind;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => UserInfoModel.fromJson(json);

  @override
  UserInfoEntity toEntity() => UserInfoEntity(
    data: data?.toEntity(),
    kind: kind,
  );
}

class UserInfoDataModel {
  String? snoovatarImg;

  UserInfoDataModel(
      {this.snoovatarImg,});

  UserInfoDataModel.fromJson(Map<String, dynamic> json) {
    snoovatarImg = json['snoovatar_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['snoovatar_img'] = this.snoovatarImg;
    return data;
  }

  UserInfoDataEntity toEntity() => UserInfoDataEntity(
    snoovatarImg: snoovatarImg,
  );
}
