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
    this.packageId,
    this.studentId,
    this.amount,
    this.statue,
    this.refuseMsg,
    this.createdAt,
    this.updatedAt,
    this.attendAt,
    this.sa,
    this.su,
    this.mo,
    this.tu,
    this.we,
    this.th,
    this.fr,
    this.trainerId,
    this.image,
    this.date,
    this.paymentVerified,
  });

  int? id;
  String? packageId;
  String? studentId;
  String? amount;
  String? statue;
  String? refuseMsg;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? attendAt;
  String? sa;
  String? su;
  String? mo;
  String? tu;
  String? we;
  String? th;
  String? fr;
  String? trainerId;
  String? image;
  dynamic date;
  String? paymentVerified;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        packageId: json["package_id"],
        studentId: json["student_id"],
        amount: json["amount"],
        statue: json["statue"],
        refuseMsg: json["refuse_msg"] == null ? null : json["refuse_msg"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        attendAt: json["attendAt"],
        sa: json["sa"],
        su: json["su"],
        mo: json["mo"],
        tu: json["tu"],
        we: json["we"],
        th: json["th"],
        fr: json["fr"],
        trainerId: json["trainer_id"],
        image: json["image"] == null ? null : json["image"],
        date: json["date"],
        paymentVerified: json["payment_verified"],
      );
}
