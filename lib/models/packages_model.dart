class PackagesModel {
  PackagesModel({
    this.data,
    this.statue,
    this.code,
  });

  Data? data;
  bool? statue;
  int? code;

  factory PackagesModel.fromJson(Map<String, dynamic> json) => PackagesModel(
        data: Data.fromJson(json["data"]),
        statue: json["statue"],
        code: json["code"],
      );

  Map<String, dynamic> toMap() => {
        "data": data!.toMap(),
        "statue": statue,
        "code": code,
      };
}

class Data {
  Data({
    this.id,
    this.name,
    this.image,
    this.packages,
  });

  int? id;
  String? name;
  String? image;
  List<Package>? packages;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        packages: List<Package>.from(
            json["packages"].map((x) => Package.fromJson(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "image": image,
        "packages": List<dynamic>.from(packages!.map((x) => x.toMap())),
      };
}

class Package {
  Package({
    this.id,
    this.title,
    this.classCount,
    this.subDays,
    this.price,
    this.createdAt,
    this.updatedAt,
    this.conditions,
    this.mainCategoryId,
    this.image,
  });

  int? id;
  String? title;
  String? classCount;
  String? subDays;
  String? price;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? conditions;
  String? mainCategoryId;
  String? image;

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        id: json["id"],
        title: json["title"],
        classCount: json["class_count"],
        subDays: json["sub_days"],
        price: json["price"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        conditions: json["conditions"],
        mainCategoryId: json["main_category_id"],
        image: json["image"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "class_count": classCount,
        "sub_days": subDays,
        "price": price,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "conditions": conditions,
        "main_category_id": mainCategoryId,
        "image": image,
      };
}
