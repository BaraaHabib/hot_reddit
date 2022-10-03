import 'package:hot_reddit/core/feature/domain/entities/entity.dart';

import 'comments_entity.dart';

class MoreCommentsEntity extends Entity {
  ResJsonEntity? json;
  MoreCommentsEntity({this.json});
}

class ResJsonEntity {
  List<String>? errors;
  AllCommentsDataEntity? data;

  ResJsonEntity({this.errors, this.data});

}

class AllCommentsDataEntity {
  List<ThingsEntity>? things;

  AllCommentsDataEntity({this.things});

}

class ThingsEntity {
  String? kind;
  InnerCommentEntity? data;

  ThingsEntity({this.kind, this.data});

  CommentEntity toComment() => CommentEntity(
    innerData: CommentInnerDataEntity(
      author: data?.author,
      createdUtc: data?.createdUtc,
      body: data?.body,
      authorFullName: data?.authorFullname
    )
  );

}

class InnerCommentEntity {
  String? subredditId;
  String? subreddit;
  Null? likes;
  String? id;
  String? author;
  int? createdUtc;
  String? parentId;
  int? score;
  String? authorFullname;
  String? body;
  String? name;
  int? created;
  String? linkId;
  int? depth;

  InnerCommentEntity(
      {this.subredditId,
        this.subreddit,
        this.likes,
        this.id,
        this.author,
        this.createdUtc,
        this.parentId,
        this.score,
        this.authorFullname,
        this.body,
        this.name,
        this.created,
        this.linkId,
        this.depth});

}