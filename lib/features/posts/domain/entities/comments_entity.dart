

import '../../../../core/feature/domain/entities/entity.dart';
import 'more_entity.dart';

class CommentsEntity extends Entity {
  String? kind;
  DataEntity? data;

  CommentsEntity({this.kind, this.data});

}

class DataEntity {
  String? after;
  num? dist;
  String? modhash;
  String? geoFilter;
  List<CommentEntity>? comments;
  MoreEntity? more;
  String? before;

  DataEntity(
      {this.after,
        this.dist,
        this.modhash,
        this.geoFilter,
        this.comments,
        this.before,
        this.more,
      });

}

class CommentEntity {
  String? kind;
  CommentInnerDataEntity? innerData;

  CommentEntity({this.kind, this.innerData});

  CommentEntity get toComment => CommentEntity(kind: kind,innerData: innerData);

}

class CommentInnerDataEntity {
  String? author;
  String? body;
  num? createdUtc;
  String? authorFullName;
  List<CommentEntity> replies = [];

  CommentInnerDataEntity({
    this.body,
    this.createdUtc,
    this.author,
    this.authorFullName,
    this.replies = const [],
  });

}
