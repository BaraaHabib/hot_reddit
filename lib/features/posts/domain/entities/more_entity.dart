class MoreEntity {
  String? kind;
  MoreDataEntity? data;

  MoreEntity({this.kind, this.data});


}

class MoreDataEntity {
  int? count;
  String? name;
  String? id;
  String? parentId;
  int? depth;
  List<String>? children;

  MoreDataEntity(
      {this.count,
        this.name,
        this.id,
        this.parentId,
        this.depth,
        this.children});


}