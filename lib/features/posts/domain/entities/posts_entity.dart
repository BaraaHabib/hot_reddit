import 'package:hot_reddit/core/feature/domain/entities/entity.dart';

import '../../data/remote/models/responses/get_posts_model.dart';


class PostsEntity extends Entity {
  String? kind;
  DataEntity? data;

  PostsEntity({this.kind, this.data});

}

class DataEntity {
  String? after;
  num? dist;
  String? modhash;
  String? geoFilter;
  List<PostEntity>? children;
  String? before;

  DataEntity(
      {this.after,
        this.dist,
        this.modhash,
        this.geoFilter,
        this.children,
        this.before,
      });

}

class PostEntity {
  String? kind;
  InnerDataEntity? innerData;

  PostEntity({this.kind, this.innerData});

}

class InnerDataEntity {
  String? title;
  num? createdUtc;
  String? author;
  num? numComments;
  String? name;
  String? id;

  DateTime get creationDate => DateTime.fromMillisecondsSinceEpoch(
    createdUtc!.toInt() * 1000,
  ).toLocal();

  InnerDataEntity({this.title, this.createdUtc, this.author, this.numComments,this.id,this.name});

}
