class MyTrainerSubscribeModel {
  MyTrainerSubscribeModel({
    this.data,
    this.statue,
    this.code,
  });

  List<Data>? data;
  bool? statue;
  int? code;

  factory MyTrainerSubscribeModel.fromJson(Map<String, dynamic> json) =>
      MyTrainerSubscribeModel(
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
        statue: json["statue"],
        code: json["code"],
      );
}

class Data {
  Data({
    this.id,
    this.trainer,
    this.student,
    this.statue,
    this.statueMsg,
    this.dateFrom,
    this.dateTo,
    this.timeFrom,
    this.timeTo,
    this.statueAr,
    this.transaction,
    this.classCount,
  });

  String? classCount;
  int? id;
  Trainer? trainer;
  Student? student;
  String? statue;
  dynamic statueMsg;
  DateTime? dateFrom;
  DateTime? dateTo;
  String? timeFrom;
  String? timeTo;
  String? statueAr;
  Transaction? transaction;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        trainer: Trainer.fromJson(json["trainer"]),
        student: Student.fromJson(json["student"]),
        statue: json["statue"],
        statueMsg: json["statue_msg"],
        dateFrom: DateTime.parse(json["date_from"]),
        dateTo: DateTime.parse(json["date_to"]),
        timeFrom: json["time_from"],
        timeTo: json["time_to"],
        statueAr: json["statue_ar"],
        transaction: Transaction.fromJson(json["transaction"]),
        classCount: json['class_count'],
      );
}

class Student {
  Student({
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

  factory Student.fromJson(Map<String, dynamic> json) => Student(
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

class Trainer {
  Trainer({
    this.id,
    this.name,
    this.email,
    this.gender,
    this.mobile,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.trainerAbstract,
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
  String? trainerAbstract;
  String? show;

  factory Trainer.fromJson(Map<String, dynamic> json) => Trainer(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        gender: json["gender"],
        mobile: json["mobile"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        trainerAbstract: json["abstract"],
        show: json["show"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "gender": gender,
        "mobile": mobile,
        "image": image,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "abstract": trainerAbstract,
        "show": show,
      };
}

class Transaction {
  Transaction({
    this.date,
    this.image,
  });

  dynamic date;
  String? image;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        date: json["date"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "image": image,
      };
}
