class PostsModel {
  PostsModel({
    this.data,
    this.statue,
    this.code,
  });

  List<Data>? data;
  bool? statue;
  int? code;

  factory PostsModel.fromJson(Map<String, dynamic> json) => PostsModel(
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
        statue: json["statue"],
        code: json["code"],
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data!.map((x) => x.toMap())),
        "statue": statue,
        "code": code,
      };
}

class Data {
  Data({
    this.id,
    this.categoryId,
    this.title,
    this.content,
    this.createdAt,
    this.updatedAt,
    this.image,
  });

  int? id;
  String? categoryId;
  String? title;
  String? content;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? image;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        categoryId: json["category_id"],
        title: json["title"],
        content: json["content"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "category_id": categoryId,
        "title": title,
        "content": content,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "image": image,
      };
}
