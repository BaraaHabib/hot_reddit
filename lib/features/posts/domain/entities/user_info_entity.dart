import 'package:hot_reddit/core/feature/domain/entities/entity.dart';

class UserInfoEntity extends Entity {
  String? kind;
  UserInfoDataEntity? data;

  UserInfoEntity({this.kind, this.data});
}

class UserInfoDataEntity {
  String? snoovatarImg;

  UserInfoDataEntity({this.snoovatarImg,});

}