class IndReservationModel {
  IndReservationModel({
    this.data,
    this.statue,
    this.code,
  });

  List<Data>? data;
  bool? statue;
  int? code;

  factory IndReservationModel.fromJson(Map<String, dynamic> json) =>
      IndReservationModel(
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
    this.title,
    this.content,
    this.image,
    this.price,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? title;
  String? content;
  String? image;
  String? price;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        image: json["image"],
        price: json["price"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "content": content,
        "image": image,
        "price": price,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
