import 'package:hot_reddit/core/feature/data/models/responses/response_model.dart';
import 'package:hot_reddit/core/feature/domain/entities/entity.dart';

import '../../../../domain/entities/get_all_comments_entity.dart';

class MoreCommentsModel extends ResponseModel<MoreCommentsEntity> {
  ResJson? json;

  MoreCommentsModel({this.json});

  MoreCommentsModel.fromJson(Map<String, dynamic> json) {
    this.json = json['json'] != null ? new ResJson.fromJson(json['json']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.json != null) {
      data['json'] = this.json!.toJson();
    }
    return data;
  }

  @override
  fromJson(Map<String, dynamic> json) => MoreCommentsModel.fromJson(json);

  @override
  MoreCommentsEntity toEntity() => MoreCommentsEntity(
    json: json?.toEntity(),

  );
}

class ResJson {
  List<String>? errors;
  AllCommentsData? data;

  ResJson({this.errors, this.data});

  ResJson.fromJson(Map<String, dynamic> json) {
    if (json['errors'] != null) {
      errors = <String>[];
      json['errors'].forEach((v) {
        errors!.add((v));
      });
    }
    data = json['data'] != null ? new AllCommentsData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.errors != null) {
      data['errors'] = this.errors!.map((v) => v).toList();
    }
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }


  ResJsonEntity toEntity() => ResJsonEntity(
    errors: errors,
    data: data?.toEntity(),
  );
}

class AllCommentsData {
  List<Things>? things;

  AllCommentsData({this.things});

  AllCommentsData.fromJson(Map<String, dynamic> json) {
    if (json['things'] != null) {
      things = <Things>[];
      json['things'].forEach((v) {
        things!.add(new Things.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.things != null) {
      data['things'] = this.things!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  AllCommentsDataEntity toEntity() => AllCommentsDataEntity(
    things: things?.map((e) => e.toEntity()).toList() ?? [],
  );
}

class Things {
  String? kind;
  InnerComment? data;

  Things({this.kind, this.data});

  Things.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    data = json['data'] != null ? new InnerComment.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kind'] = this.kind;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }

  ThingsEntity toEntity() => ThingsEntity(
    kind: kind,
    data: data?.toEntity(),
  );
}

class InnerComment {
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

  InnerComment(
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

  InnerComment.fromJson(Map<String, dynamic> json) {
    subredditId = json['subreddit_id'];
    subreddit = json['subreddit'];
    likes = json['likes'];
    id = json['id'];
    author = json['author'];
    createdUtc = json['created_utc'];
    parentId = json['parent_id'];
    score = json['score'];
    authorFullname = json['author_fullname'];
    body = json['body'];
    name = json['name'];
    created = json['created'];
    linkId = json['link_id'];
    depth = json['depth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subreddit_id'] = this.subredditId;
    data['subreddit'] = this.subreddit;
    data['likes'] = this.likes;
    data['id'] = this.id;
    data['author'] = this.author;
    data['created_utc'] = this.createdUtc;
    data['parent_id'] = this.parentId;
    data['score'] = this.score;
    data['author_fullname'] = this.authorFullname;
    data['body'] = this.body;
    data['name'] = this.name;
    data['created'] = this.created;
    data['link_id'] = this.linkId;
    data['depth'] = this.depth;
    return data;
  }


  InnerCommentEntity toEntity() => InnerCommentEntity(
    parentId: parentId,
    depth: depth,
    id: id,
    name: name,
    body: body,
    createdUtc: createdUtc,
    author: author,
    authorFullname: authorFullname,
    created: created,
    likes: likes,
    linkId: linkId,
    score: score,
    subreddit: subreddit,
    subredditId: subredditId,
  );
}