import 'package:hot_reddit/core/feature/data/models/responses/response_model.dart';
import 'package:hot_reddit/core/feature/domain/entities/entity.dart';

import '../../../../domain/entities/posts_entity.dart';

class PostsModel extends ResponseModel<PostsEntity> {
  String? kind;
  Data? data;

  PostsModel({this.kind, this.data});

  PostsModel.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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
  fromJson(Map<String, dynamic> json) => PostsModel.fromJson(json);

  PostsEntity toEntity() => PostsEntity(data: data?.toEntity(),kind: kind);
}

class Data {
  String? after;
  num? dist;
  String? modhash;
  String? geoFilter;
  List<PostModel>? children;
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
      children = <PostModel>[];
      json['children'].forEach((v) {
        children!.add(new PostModel.fromJson(v));
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
    children: children?.map((e) => e.toEntity()).toList() ?? []
  );
}

class PostModel {
  String? kind;
  InnerData? innerData;

  PostModel({this.kind, this.innerData});

  PostModel.fromJson(Map<String, dynamic> json) {
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

  PostEntity toEntity() => PostEntity(innerData: innerData?.toEntity(),kind:kind );
}

class InnerData {
  String? title;
  num? createdUtc;
  String? author;
  num? numComments;
  String? name;
  String? id;

  InnerData({this.title, this.createdUtc, this.author, this.numComments,this.id,this.name});

  InnerData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    createdUtc = json['created_utc'];
    author = json['author'];
    numComments = json['num_comments'];
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['created_utc'] = this.createdUtc;
    data['author'] = this.author;
    data['num_comments'] = this.numComments;
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }

  InnerDataEntity toEntity() => InnerDataEntity(
      author: author,
      createdUtc: createdUtc,
      numComments: numComments,
      title: title,
      id:id,
      name: name
  );
}