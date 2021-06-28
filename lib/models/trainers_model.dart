class TrainersModel {
  TrainersModel({
    this.data,
    this.statue,
    this.code,
  });

  List<Data>? data;
  bool? statue;
  int? code;

  factory TrainersModel.fromJson(Map<String, dynamic> json) => TrainersModel(
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
    this.name,
    this.email,
    this.gender,
    this.mobile,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.datumAbstract,
    this.show,
  });

  int? id;
  String? name;
  String? email;
  String? gender;
  String? mobile;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? datumAbstract;
  String? show;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        gender: json["gender"],
        mobile: json["mobile"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        datumAbstract: json["abstract"],
        show: json["show"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "gender": gender,
        "mobile": mobile,
        "image": image,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "abstract": datumAbstract,
        "show": show,
      };
}
