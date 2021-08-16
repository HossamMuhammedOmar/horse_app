class SubPackageModel {
  SubPackageModel({
    required this.data,
    required this.statue,
    required this.code,
  });
  late final List<Data> data;
  late final bool statue;
  late final int code;

  SubPackageModel.fromJson(Map<String, dynamic> json) {
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
    statue = json['statue'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e) => e.toJson()).toList();
    _data['statue'] = statue;
    _data['code'] = code;
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.package,
    required this.student,
    required this.amount,
    required this.statue,
    required this.statueAr,
    this.refuseMsg,
    required this.attendAt,
    required this.trainer,
    required this.paymentVerified,
    required this.transaction,
    required this.subscription,
  });
  late final int id;
  late final Package package;
  late final Student student;
  late final String amount;
  late final String statue;
  late final String statueAr;
  late final Null refuseMsg;
  late final String attendAt;
  late final Trainer trainer;
  late final String paymentVerified;
  late final Transaction transaction;
  late final Subscription subscription;

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    package = Package.fromJson(json['package']);
    student = Student.fromJson(json['student']);
    amount = json['amount'];
    statue = json['statue'];
    statueAr = json['statue_ar'];
    refuseMsg = null;
    attendAt = json['attendAt'];
    trainer = Trainer.fromJson(json['trainer']);
    paymentVerified = json['payment_verified'];
    transaction = Transaction.fromJson(json['transaction']);
    subscription = Subscription.fromJson(json['subscription']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['package'] = package.toJson();
    _data['student'] = student.toJson();
    _data['amount'] = amount;
    _data['statue'] = statue;
    _data['statue_ar'] = statueAr;
    _data['refuse_msg'] = refuseMsg;
    _data['attendAt'] = attendAt;
    _data['trainer'] = trainer.toJson();
    _data['payment_verified'] = paymentVerified;
    _data['transaction'] = transaction.toJson();
    _data['subscription'] = subscription.toJson();
    return _data;
  }
}

class Package {
  Package({
    required this.id,
    required this.title,
    required this.classCount,
    required this.subDays,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.conditions,
    required this.mainCategoryId,
    required this.image,
  });
  late final int id;
  late final String title;
  late final String classCount;
  late final String subDays;
  late final String price;
  late final String createdAt;
  late final String updatedAt;
  late final String conditions;
  late final String mainCategoryId;
  late final String image;

  Package.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    classCount = json['class_count'];
    subDays = json['sub_days'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    conditions = json['conditions'];
    mainCategoryId = json['main_category_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['class_count'] = classCount;
    _data['sub_days'] = subDays;
    _data['price'] = price;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['conditions'] = conditions;
    _data['main_category_id'] = mainCategoryId;
    _data['image'] = image;
    return _data;
  }
}

class Student {
  Student({
    required this.id,
    required this.name,
    required this.email,
    required this.photo,
    required this.mobile,
    this.otherMobile,
    this.groupId,
    this.facebook,
    this.twitter,
    this.instagram,
    this.apiToken,
    this.expireFrom,
    this.expireTo,
    required this.active,
    this.activeAccount,
    required this.createdAt,
    required this.updatedAt,
    this.experience,
    this.information,
    required this.membership,
    this.age,
  });
  late final int id;
  late final String name;
  late final String email;
  late final String photo;
  late final String mobile;
  late final Null otherMobile;
  late final Null groupId;
  late final Null facebook;
  late final Null twitter;
  late final Null instagram;
  late final Null apiToken;
  late final Null expireFrom;
  late final Null expireTo;
  late final String active;
  late final Null activeAccount;
  late final String createdAt;
  late final String updatedAt;
  late final Null experience;
  late final Null information;
  late final String membership;
  late final Null age;

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    photo = json['photo'];
    mobile = json['mobile'];
    otherMobile = null;
    groupId = null;
    facebook = null;
    twitter = null;
    instagram = null;
    apiToken = null;
    expireFrom = null;
    expireTo = null;
    active = json['active'];
    activeAccount = null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    experience = null;
    information = null;
    membership = json['membership'];
    age = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['photo'] = photo;
    _data['mobile'] = mobile;
    _data['other_mobile'] = otherMobile;
    _data['group_id'] = groupId;
    _data['facebook'] = facebook;
    _data['twitter'] = twitter;
    _data['instagram'] = instagram;
    _data['api_token'] = apiToken;
    _data['expire_from'] = expireFrom;
    _data['expire_to'] = expireTo;
    _data['active'] = active;
    _data['active_account'] = activeAccount;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['experience'] = experience;
    _data['information'] = information;
    _data['membership'] = membership;
    _data['age'] = age;
    return _data;
  }
}

class Trainer {
  Trainer({
    required this.id,
    required this.name,
    required this.email,
    required this.gender,
    required this.mobile,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.abstract,
    required this.show,
  });
  late final int id;
  late final String name;
  late final String email;
  late final String gender;
  late final String mobile;
  late final String image;
  late final String createdAt;
  late final String updatedAt;
  late final String abstract;
  late final String show;

  Trainer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    gender = json['gender'];
    mobile = json['mobile'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    abstract = json['abstract'];
    show = json['show'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['gender'] = gender;
    _data['mobile'] = mobile;
    _data['image'] = image;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['abstract'] = abstract;
    _data['show'] = show;
    return _data;
  }
}

class Transaction {
  Transaction({
    this.image,
    this.date,
  });
  late final Null image;
  late final Null date;

  Transaction.fromJson(Map<String, dynamic> json) {
    image = null;
    date = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['image'] = image;
    _data['date'] = date;
    return _data;
  }
}

class Subscription {
  Subscription({
    this.info,
    required this.attends,
  });
  late final Info? info;
  late final List<dynamic> attends;

  Subscription.fromJson(Map<String, dynamic> json) {
    info = null;
    attends = List.castFrom<dynamic, dynamic>(json['attends']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['info'] = info;
    _data['attends'] = attends;
    return _data;
  }
}

class Info {
  Info({
    required this.id,
    required this.package,
    required this.startIn,
    required this.endIn,
    required this.statue,
    required this.statueAr,
    required this.restClassCount,
  });
  late final int id;
  late final Package package;
  late final String startIn;
  late final String endIn;
  late final String statue;
  late final String statueAr;
  late final int restClassCount;

  Info.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    package = Package.fromJson(json['package']);
    startIn = json['start_in'];
    endIn = json['end_in'];
    statue = json['statue'];
    statueAr = json['statue_ar'];
    restClassCount = json['rest_class_count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['package'] = package.toJson();
    _data['start_in'] = startIn;
    _data['end_in'] = endIn;
    _data['statue'] = statue;
    _data['statue_ar'] = statueAr;
    _data['rest_class_count'] = restClassCount;
    return _data;
  }
}
