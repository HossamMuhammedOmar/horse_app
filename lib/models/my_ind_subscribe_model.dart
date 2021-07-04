class MyIndSubscribeModel {
  MyIndSubscribeModel({
    this.data,
    this.statue,
    this.code,
  });

  List<Data>? data;
  bool? statue;
  int? code;

  factory MyIndSubscribeModel.fromJson(Map<String, dynamic> json) =>
      MyIndSubscribeModel(
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
        statue: json["statue"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "statue": statue,
        "code": code,
      };
}

class Data {
  Data({
    this.id,
    this.reservation,
    this.user,
    this.date,
    this.time,
    this.status,
    this.statusAr,
    this.rejectMessage,
    this.transaction,
  });

  int? id;
  Reservation? reservation;
  User? user;
  DateTime? date;
  String? time;
  String? status;
  String? statusAr;
  String? rejectMessage;
  Transaction? transaction;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        reservation: Reservation.fromJson(json["reservation"]),
        user: User.fromJson(json["user"]),
        date: DateTime.parse(json["date"]),
        time: json["time"],
        status: json["status"],
        statusAr: json["status_ar"],
        rejectMessage: json["reject_message"],
        transaction: Transaction.fromJson(json["transaction"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "reservation": reservation!.toJson(),
        "user": user!.toJson(),
        "date":
            "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "time": time,
        "status": status,
        "status_ar": statusAr,
        "reject_message": rejectMessage,
        "transaction": transaction!.toJson(),
      };
}

class Reservation {
  Reservation({
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

  factory Reservation.fromJson(Map<String, dynamic> json) => Reservation(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        image: json["image"],
        price: json["price"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "image": image,
        "price": price,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}

class Transaction {
  Transaction({
    this.date,
    this.image,
    this.status,
    this.statusAr,
  });

  dynamic date;
  dynamic image;
  String? status;
  String? statusAr;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        date: json["date"],
        image: json["image"],
        status: json["status"],
        statusAr: json["status_ar"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "image": image,
        "status": status,
        "status_ar": statusAr,
      };
}

class User {
  User({
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

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        photo: json["photo"],
        mobile: json["mobile"],
        otherMobile: json["other_mobile"],
        groupId: json["group_id"],
        facebook: json["facebook"],
        twitter: json["twitter"],
        instagram: json["instagram"],
        apiToken: json["api_token"],
        expireFrom: json["expire_from"],
        expireTo: json["expire_to"],
        active: json["active"],
        activeAccount: json["active_account"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        experience: json["experience"],
        information: json["information"],
        membership: json["membership"],
        age: json["age"],
      );

  Map<String, dynamic> toJson() => {
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
