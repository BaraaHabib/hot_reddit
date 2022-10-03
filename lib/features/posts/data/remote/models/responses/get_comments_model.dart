import 'package:hot_reddit/core/feature/data/models/responses/response_model.dart';
import 'package:hot_reddit/core/feature/domain/entities/entity.dart';
import 'package:hot_reddit/features/posts/domain/entities/comments_entity.dart';

import 'get_Comments_model.dart';
import 'more_model.dart';

class CommentsModel extends ResponseModel<CommentsEntity> {
  String? kind;
  Data? data;

  CommentsModel({this.kind, this.data});

  CommentsModel.fromJson(dynamic json) {
    if(json is List && json.length >1) {
      kind = json[1]['kind'];
      data =
      json[1]['data'] != null ? new Data.fromJson(json[1]['data']) : null;
    }
    else{
        kind = json['kind'];
        data = json['data'] != null ? new Data.fromJson(json['data']) : null;
      }
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
  fromJson(Map<String, dynamic> json) => CommentsModel.fromJson(json);

  CommentsEntity toEntity() => CommentsEntity(data: data?.toEntity(),kind: kind);
}

class Data {
  String? after;
  num? dist;
  String? modhash;
  String? geoFilter;
  List<Comment>? children;
  MoreModel? more;
  String? before;

  Data(
      {this.after,
        this.dist,
        this.modhash,
        this.geoFilter,
        this.children,
        this.before,
      });

  Data.fromJson(Map<String, dynamic> json) {
    after = json['after'];
    dist = json['dist'];
    modhash = json['modhash'];
    geoFilter = json['geo_filter'];
    if (json['children'] != null) {
      children = <Comment>[];
      json['children'].forEach((v) {
        if(v['kind'] == 't1'){
          children!.add(new Comment.fromJson(v));
        }else{
          more = MoreModel.fromJson(v);
        }
      });
    }
    before = json['before'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['after'] = this.after;
    data['dist'] = this.dist;
    data['modhash'] = this.modhash;
    data['geo_filter'] = this.geoFilter;
    if (this.children != null) {
      data['children'] = this.children!.map((v) => v.toJson()).toList();
    }
    data['before'] = this.before;
    return data;
  }

  DataEntity toEntity() => DataEntity(
    after: after,
    before: before,
    dist: dist,
    geoFilter: geoFilter,
    modhash: modhash,
    comments: children?.map((e) => e.toEntity()).toList() ?? [],
    more:more?.toEntity(),

  );
}

class Comment {
  String? kind;
  InnerData? innerData;

  Comment({this.kind, this.innerData});

  Comment.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    innerData = json['data'] != null
        ? new InnerData.fromJson(json['data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kind'] = this.kind;
    if (this.innerData != null) {
      data['data'] = this.innerData!.toJson();
    }
    return data;
  }

  CommentEntity toEntity() =>
      CommentEntity(
        innerData: innerData?.toEntity(),
        kind: kind,
      );
}

class InnerData {
    String? body;
    num? createdUtc;
    String? author;
    String? authorFullName;
    List<Comment> replies = [];

    InnerData({
      this.body,
      this.createdUtc,
      this.author,
      this.authorFullName,
      this.replies = const [],
    });

    InnerData.fromJson(Map<String, dynamic> json) {
      body = json['body'];
      createdUtc = json['created_utc'];
      author = json['author'];
      authorFullName = json['author_fullname'];
      if (json['replies'] != null && json['replies'] != '' && json['replies']['data']['children'] != null) {
        replies = <Comment>[];
        json['replies']['data']['children'].forEach((v) {
          if(v['kind'] == 't1'){
            replies.add(Comment.fromJson(v));
          }
        });
      }
    }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data = new Map<String, dynamic>();
      data['body'] = this.body;
      data['created_utc'] = this.createdUtc;
      data['author'] = this.author;
      data['author_fullname'] = this.authorFullName;
      return data;
    }

    CommentInnerDataEntity toEntity() =>
        CommentInnerDataEntity(
          author: author,
          createdUtc: createdUtc,
          authorFullName: authorFullName,
          body: body,
          replies: replies.map((e) => e.toEntity()).toList(),
        );
  }