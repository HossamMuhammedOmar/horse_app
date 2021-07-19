class AttendModel {
  AttendModel({
    this.data,
    this.statue,
    this.code,
  });

  List<Data>? data;
  bool? statue;
  int? code;

  factory AttendModel.fromJson(Map<String, dynamic> json) => AttendModel(
        data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
        statue: json["statue"],
        code: json["code"],
      );
}

class Data {
  Data({
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

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
