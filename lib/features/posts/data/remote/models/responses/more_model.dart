import 'package:hot_reddit/features/posts/domain/entities/more_entity.dart';
import 'package:hot_reddit/features/posts/domain/entities/posts_entity.dart';

class MoreModel {
  String? kind;
  MoreDataModel? data;

  MoreModel({this.kind, this.data});

  MoreModel.fromJson(Map<String, dynamic> json) {
    kind = json['kind'];
    data = json['data'] != null ? new MoreDataModel.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kind'] = this.kind;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }

  MoreEntity toEntity() => MoreEntity(
    kind: kind,
    data: data?.toEntity()
  );
}

class MoreDataModel {
  int? count;
  String? name;
  String? id;
  String? parentId;
  int? depth;
  List<String>? children;

  MoreDataModel(
      {this.count,
        this.name,
        this.id,
        this.parentId,
        this.depth,
        this.children});

  MoreDataModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    name = json['name'];
    id = json['id'];
    parentId = json['parent_id'];
    depth = json['depth'];
    children = json['children'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['name'] = this.name;
    data['id'] = this.id;
    data['parent_id'] = this.parentId;
    data['depth'] = this.depth;
    data['children'] = this.children;
    return data;
  }

  MoreDataEntity toEntity() => MoreDataEntity(
    count: count,
    name:name,
    id: id,
    depth: depth,
    parentId: parentId,
    children: children,
  );
}