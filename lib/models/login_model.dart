class LoginModel {
  Data? data;
  bool? statue;
  int? code;

  LoginModel({
    this.data,
    this.statue,
    this.code,
  });

  factory LoginModel.fromJson(Map<String, dynamic>? json) => LoginModel(
        data: Data.fromJson(json?["data"]),
        statue: json?["statue"],
        code: json?["code"],
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
    this.email,
    this.photo,
    this.mobile,
    this.otherMobile,
    this.groupId,
    this.facebook,
    this.twitter,
    this.instagram,
    this.apiToken,
    this.expireFrom,
    this.expireTo,
    this.active,
    this.activeAccount,
    this.createdAt,
    this.updatedAt,
    this.experience,
    this.information,
    this.membership,
    this.age,
  });

  int? id;
  String? name;
  String? email;
  String? photo;
  String? mobile;
  dynamic otherMobile;
  dynamic groupId;
  dynamic facebook;
  dynamic twitter;
  dynamic instagram;
  dynamic apiToken;
  dynamic expireFrom;
  dynamic expireTo;
  String? active;
  dynamic activeAccount;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic experience;
  dynamic information;
  String? membership;
  dynamic age;

  factory Data.fromJson(Map<String, dynamic>? json) => Data(
        id: json?["id"],
        name: json?["name"],
        email: json?["email"],
        photo: json?["photo"],
        mobile: json?["mobile"],
        otherMobile: json?["other_mobile"],
        groupId: json?["group_id"],
        facebook: json?["facebook"],
        twitter: json?["twitter"],
        instagram: json?["instagram"],
        apiToken: json?["api_token"],
        expireFrom: json?["expire_from"],
        expireTo: json?["expire_to"],
        active: json?["active"],
        activeAccount: json?["active_account"],
        createdAt: DateTime.parse(json?["created_at"]),
        updatedAt: DateTime.parse(json?["updated_at"]),
        experience: json?["experience"],
        information: json?["information"],
        membership: json?["membership"],
        age: json?["age"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "email": email,
        "photo": photo,
        "mobile": mobile,
        "other_mobile": otherMobile,
        "group_id": groupId,
        "facebook": facebook,
        "twitter": twitter,
        "instagram": instagram,
        "api_token": apiToken,
        "expire_from": expireFrom,
        "expire_to": expireTo,
        "active": active,
        "active_account": activeAccount,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "experience": experience,
        "information": information,
        "membership": membership,
        "age": age,
      };
}
