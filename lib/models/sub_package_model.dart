class SubPackageModel {
  SubPackageModel({
    this.data,
    this.statue,
    this.code,
  });

  List<Data>? data;
  bool? statue;
  int? code;

  factory SubPackageModel.fromJson(Map<String, dynamic> json) =>
      SubPackageModel(
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
        statue: json["statue"],
        code: json["code"],
      );
}

class Data {
  Data({
    this.id,
    this.package,
    this.student,
    this.amount,
    this.statue,
    this.statueAr,
    this.refuseMsg,
    this.attendAt,
    this.trainer,
    this.paymentVerified,
    this.transaction,
    this.subscription,
  });

  int? id;
  Package? package;
  Student? student;
  String? amount;
  String? statue;
  String? statueAr;
  String? refuseMsg;
  String? attendAt;
  Trainer? trainer;
  String? paymentVerified;
  Transaction? transaction;
  Subscription? subscription;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        package: Package.fromJson(json["package"]),
        student: Student.fromJson(json["student"]),
        amount: json["amount"],
        statue: json["statue"],
        statueAr: json["statue_ar"],
        refuseMsg: json["refuse_msg"] == null ? null : json["refuse_msg"],
        attendAt: json["attendAt"],
        trainer: Trainer.fromJson(json["trainer"]),
        paymentVerified: json["payment_verified"],
        transaction: Transaction.fromJson(json["transaction"]),
        subscription: Subscription.fromJson(json["subscription"]),
      );
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
  dynamic photo;
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
}

class Subscription {
  Subscription({
    this.info,
    this.attends,
  });

  Info? info;
  List<Attend>? attends;

  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
        info: json["info"] == null ? null : Info.fromJson(json["info"]),
        attends:
            List<Attend>.from(json["attends"].map((x) => Attend.fromJson(x))),
      );
}

class Attend {
  Attend({
    this.id,
    this.time,
    this.day,
    this.date,
    this.attended,
    this.canceled,
    this.statue,
    this.statueAr,
    this.attendStatus,
    this.refuseReason,
    this.cancelReason,
    this.trainer,
    this.canUserCancel,
    this.cancelRequests,
  });

  int? id;
  String? time;
  String? day;
  DateTime? date;
  String? attended;
  String? canceled;
  String? statue;
  String? statueAr;
  String? attendStatus;
  String? refuseReason;
  String? cancelReason;
  Trainer? trainer;
  bool? canUserCancel;
  List<CancelRequest>? cancelRequests;

  factory Attend.fromJson(Map<String, dynamic> json) => Attend(
        id: json["id"],
        time: json["time"],
        day: json["day"],
        date: DateTime.parse(json["date"]),
        attended: json["attended"],
        canceled: json["canceled"],
        statue: json["statue"],
        statueAr: json["statue_ar"],
        attendStatus: json["attend_status"],
        refuseReason:
            json["refuse_reason"] == null ? null : json["refuse_reason"],
        cancelReason:
            json["cancel_reason"] == null ? null : json["cancel_reason"],
        trainer: Trainer.fromJson(json["trainer"]),
        canUserCancel: json["canUserCancel"],
        cancelRequests: List<CancelRequest>.from(
            json["cancelRequests"].map((x) => CancelRequest.fromJson(x))),
      );
}

class CancelRequest {
  CancelRequest({
    this.id,
    this.attendId,
    this.status,
    this.cancelReason,
    this.refusedReason,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? attendId;
  String? status;
  String? cancelReason;
  dynamic refusedReason;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory CancelRequest.fromJson(Map<String, dynamic> json) => CancelRequest(
        id: json["id"],
        attendId: json["attend_id"],
        status: json["status"],
        cancelReason: json["cancel_reason"],
        refusedReason: json["refused_reason"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
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
}

class Info {
  Info({
    this.id,
    this.package,
    this.startIn,
    this.endIn,
    this.statue,
    this.statueAr,
    this.restClassCount,
  });

  int? id;
  Package? package;
  DateTime? startIn;
  DateTime? endIn;
  String? statue;
  String? statueAr;
  String? restClassCount;

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        id: json["id"],
        package: Package.fromJson(json["package"]),
        startIn: DateTime.parse(json["start_in"]),
        endIn: DateTime.parse(json["end_in"]),
        statue: json["statue"],
        statueAr: json["statue_ar"],
        restClassCount: json["rest_class_count"],
      );
}

class Transaction {
  Transaction({
    this.image,
    this.date,
  });

  String? image;
  String? date;

  factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        image: json["image"] == null ? null : json["image"],
        date: json["date"] == null ? null : json["date"],
      );
}
