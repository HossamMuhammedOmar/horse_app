class NotificationModel {
  NotificationModel({
    this.data,
    this.statue,
    this.code,
  });

  List<Data>? data;
  bool? statue;
  int? code;

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
        statue: json["statue"],
        code: json["code"],
      );
}

class Data {
  Data({
    this.id,
    this.userId,
    this.content,
    this.url,
    this.seen,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? userId;
  String? content;
  String? url;
  String? seen;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        userId: json["user_id"],
        content: json["content"],
        url: json["url"],
        seen: json["seen"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}
