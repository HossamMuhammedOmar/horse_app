import 'dart:io';
import 'package:flutter/material.dart';
import 'package:horse_app/constants/colors.dart';
import 'package:horse_app/models/attend_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horse_app/bloc/home/states.dart';
import 'package:horse_app/constants/keys.dart';
import 'package:horse_app/helpers/end_points.dart';
import 'package:horse_app/helpers/shared_helper_Screen.dart';
import 'package:horse_app/models/categories_model.dart';
import 'package:horse_app/models/ind_reservation_model.dart';
import 'package:horse_app/models/login_model.dart';
import 'package:horse_app/models/my_ind_subscribe_model.dart';
import 'package:horse_app/models/my_trainer_subscribe_model.dart';
import 'package:horse_app/models/notification_model.dart';
import 'package:horse_app/models/packages_model.dart';
import 'package:horse_app/models/posts_model.dart';
import 'package:horse_app/models/sub_package_model.dart';
import 'package:horse_app/models/trainers_model.dart';
import 'package:horse_app/networking/dio_helper.dart';
import 'package:image_picker/image_picker.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());

  static HomeCubit get(context) => BlocProvider.of(context);

  List service = [];

  List trainner = [];

  List timeList = [
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
  ];
  List subTimeList = [
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
  ];

  String selectedTime = '4';
  String subSelectedTime = '4';

  String selectedService = 'اشتراكات تدريب الخيل ارضي اقل 18 سنه';

  String selectedTrainner = 'الاخصائية منار محمد المكيرش';

  CategoriesModel? categoriesModel;

  String? colorGroupValue;

  void changeRadio(val) {
    colorGroupValue = val as String?;
    emit(HomeChangeRadioOption());
  }

  void selecteService(currentValue) {
    selectedService = currentValue;
    emit(HomeChangeSelectedSerivce());
  }

  void selecteTime(currentValue) {
    selectedTime = currentValue;
    emit(HomeChangeSelectedTime());
  }

  void subSelecteTime(currentValue) {
    subSelectedTime = currentValue;
    emit(HomeChangeSubSelectedTime());
  }

  void selecteTrainner(currentValue) {
    selectedTrainner = currentValue;
    emit(HomeChangeSelectedTrainner());
  }

  // GET USER DATA BY ID
  LoginModel? profileModel;
  void getUserDataById() {
    emit(GetUserDataLoading());
    DioHelper.getData(
            url: '$GETUSERBYID/${SharedHelper.getCacheData(key: TOKEN)}')
        .then(
      (value) {
        profileModel = LoginModel.fromJson(value.data);
        emit(GetUserDataSuccess());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(GetUserDataError());
      },
    );
  }

  // GET ALL CATEGORIES
  void getAllCategories() {
    emit(GetCategoriesDataLoading());
    DioHelper.getData(url: CATEGORIES).then(
      (value) {
        categoriesModel = CategoriesModel.fromJson(value.data);
        categoriesModel!.data!.forEach((element) {
          service.add(element);
        });
        emit(GetCategoriesDataSuccess());
      },
    ).catchError(
      (e) {
        emit(GetCategoriesDataError());
        print(e.toString());
      },
    );
  }

  // GET ALL CATEGORIES PACKAGE
  PackagesModel? packagesModel;
  void getAllCategoriesPackage({required catId}) {
    emit(GetCategoriesPackagesLoading());
    DioHelper.getData(url: '$GETCATEGORIESWITHID/$catId').then(
      (value) {
        packagesModel = PackagesModel.fromJson(value.data);
        emit(GetCategoriesPackagesSuccess());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(GetCategoriesPackagesError());
      },
    );
  }

  // GET ALL POSTS
  PostsModel? postsModel;
  void getAllPostsData() {
    emit(GetAllPostsDataLoading());
    DioHelper.getData(url: POSTS).then(
      (value) {
        postsModel = PostsModel.fromJson(value.data);
        emit(GetAllPostsDataSuccess());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(GetAllPostsDataError());
      },
    );
  }

  // GET ALL TRAINERS
  TrainersModel? trainersModel;
  void getAllTrainers() {
    emit(GetAllTrainersDataLoading());
    DioHelper.getData(url: TRAINERS).then(
      (value) {
        trainersModel = TrainersModel.fromJson(value.data);
        trainner.add(trainersModel!.data!);
        print(trainersModel!.data![1].name);
        emit(GetAllTrainersDataSuccess());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(GetAllTrainersDataError());
      },
    );
  }

  // GET PACKAGE REQUEST BY ID
  void getPackageRequestById() {
    print(SharedHelper.getCacheData(key: TOKEN));
    emit(GetPackageRequestLoading());
    DioHelper.getData(
            url: '$PACKAGEREQUEST/${SharedHelper.getCacheData(key: TOKEN)}')
        .then(
      (value) {
        print(value.data);
        emit(GetPackageRequestSuccess());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(GetPackageRequestError());
      },
    );
  }

  // GET INDIV RESERVATION
  IndReservationModel? indReservationModel;
  void getIndivReservation() {
    emit(GetIndReservationLoading());
    DioHelper.getData(url: INDRESERVATIONS).then(
      (value) {
        indReservationModel = IndReservationModel.fromJson(value.data);

        emit(GetIndReservationSuccess());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(GetIndReservationError());
      },
    );
  }

  // SUBSCRIPT TRAINER
  void subscribeTrainer({
    required studentId,
    required trainerId,
    required dateFrom,
    required dateTo,
    required timeFrom,
    required timeTo,
    required classCount,
  }) {
    emit(PostSubscribTrainerLoading());
    DioHelper.postData(
      url: ORDERS,
      data: {
        'student_id': studentId,
        'trainer_id': trainerId,
        'date_from': dateFrom,
        'date_to': dateTo,
        'time_from': timeFrom,
        'time_to': timeTo,
        'class_count': classCount,
      },
    ).then(
      (value) {
        print(value.data);
        emit(PostSubscribTrainerSuccess());
      },
    ).catchError(
      (e) {
        print("ERRRO ${e.toString()}");
        emit(PostSubscribTrainerError());
      },
    );
  }

  // SUBSCRIPT IND
  void subscribeInd({
    required userId,
    required indReservationId,
    required date,
    required time,
  }) {
    emit(PostSubscribIndLoading());
    DioHelper.postData(
      url:
          "$RESERVATIONREQUESTSWITHID=${SharedHelper.getCacheData(key: TOKEN)}",
      data: {
        'user_id': userId,
        'ind_reservation_id': indReservationId,
        'date': date,
        'time': time,
      },
    ).then((value) {
      print(value.data);
      emit(PostSubscribIndSuccess());
    }).catchError((e) {
      print(e.toString());
      emit(PostSubscribIndError());
    });
  }

  // GET MY TRAINER SUBSCRIBE
  MyTrainerSubscribeModel? myTrainerSubscribeModel;
  void getMyTrainerSubscribe() {
    emit(GetMySubscribTrainerLoading());
    DioHelper.getData(
            url: '$GETORDERS=${SharedHelper.getCacheData(key: TOKEN)}')
        .then(
      (value) {
        myTrainerSubscribeModel = MyTrainerSubscribeModel.fromJson(value.data);
        emit(GetMySubscribTrainerSuccess());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(GetMySubscribTrainerError());
      },
    );
  }

  // GET MY IND SUBSCRIBE
  MyIndSubscribeModel? myIndSubscribeModel;
  void getMyIndSubscribe() {
    emit(GetMySubscribIndLoading());
    DioHelper.getData(
            url:
                '$RESERVATIONREQUESTSWITHID=${SharedHelper.getCacheData(key: TOKEN)}')
        .then(
      (value) {
        myIndSubscribeModel = MyIndSubscribeModel.fromJson(value.data);
        myIndSubscribeModel!.data!
            .sort((b, a) => a.id!.compareTo((b.id)!.toInt()));
        emit(GetMySubscribIndSuccess());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(GetMySubscribIndError());
      },
    );
  }

  // GET NOTIFICATION
  NotificationModel? notificationModel;
  var notSeen;
  void getUserNotification() {
    emit(GetUserNotificationLoading());
    DioHelper.getData(
            url: 'user/${SharedHelper.getCacheData(key: TOKEN)}/notes')
        .then(
      (value) {
        notificationModel = NotificationModel.fromJson(value.data);
        notificationModel!.data!.where((element) => element.seen == '1');
        notificationModel!.data!
            .sort((b, a) => a.id!.compareTo((b.id)!.toInt()));

        emit(GetUserNotificationSuccess());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(GetUserNotificationError());
      },
    );
  }

  // NEW SUBSCRIBE
  void packageRequest({
    required attendAt,
    required packageId,
    required trainerId,
  }) {
    emit(CreatePackageRequestLoading());
    DioHelper.postData(
      url: '$PACKAGEREQUEST=${SharedHelper.getCacheData(key: TOKEN)}',
      data: {
        'agree': 'true',
        'attendAt': attendAt,
        'package_id': packageId,
        'trainer_id': trainerId,
      },
    ).then(
      (value) {
        print(value.data);
        emit(CreatePackageRequestSuccess());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(CreatePackageRequestError());
      },
    );
  }

  // BG BUTTON COLORS
  Color? all;
  Color? aceepted;
  Color? refused;
  Color? pending;
  // TEXT BUTTON COLOR
  Color? allT;
  Color? aceeptedT;
  Color? refusedT;
  Color? pendingT;

  String currentState = 'A';

  // GET ALL MY PACKAGES
  SubPackageModel? subPackageModel;
  void getMyPackages() {
    all = mPrimaryColor;
    aceepted = Color(0xffF6F6F6);
    refused = Color(0xffF6F6F6);
    pending = Color(0xffF6F6F6);
    allT = Colors.white;
    aceeptedT = Colors.black;
    refusedT = Colors.black;
    pendingT = Colors.black;

    currentState = 'A';

    emit(GetMyPackageLoading());
    DioHelper.getData(
            url: '$PACKAGEREQUEST=${SharedHelper.getCacheData(key: TOKEN)}')
        .then(
      (value) {
        subPackageModel = SubPackageModel.fromJson(value.data);
        subPackageModel!.data!.sort((b, a) => a.id!.compareTo((b.id)!.toInt()));
        emit(GetMyPackageSuccess());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(GetMyPackageError());
      },
    );
  }

  // GET MY PACKAGE ONLY ACCEPTED
  void getMyAcceptedPackages() {
    emit(GetMyPackageLoading());
    currentState = 'Y';
    all = Color(0xffF6F6F6);
    aceepted = mPrimaryColor;
    refused = Color(0xffF6F6F6);
    pending = Color(0xffF6F6F6);

    allT = Colors.black;
    aceeptedT = Colors.white;
    refusedT = Colors.black;
    pendingT = Colors.black;
    DioHelper.getData(
            url: '$PACKAGEREQUEST=${SharedHelper.getCacheData(key: TOKEN)}')
        .then(
      (value) {
        subPackageModel = SubPackageModel.fromJson(value.data);
        subPackageModel!.data!.sort((b, a) => a.id!.compareTo((b.id)!.toInt()));
        emit(GetMyPackageSuccess());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(GetMyPackageError());
      },
    );
  }

  // GET MY PACKAGE ONLY REFUSED
  void getMyRefusedPackages() {
    all = Color(0xffF6F6F6);
    aceepted = Color(0xffF6F6F6);
    refused = mPrimaryColor;
    pending = Color(0xffF6F6F6);

    allT = Colors.black;
    aceeptedT = Colors.black;
    refusedT = Colors.white;
    pendingT = Colors.black;

    currentState = 'R';
    emit(GetMyPackageLoading());
    DioHelper.getData(
            url: '$PACKAGEREQUEST=${SharedHelper.getCacheData(key: TOKEN)}')
        .then(
      (value) {
        subPackageModel = SubPackageModel.fromJson(value.data);
        subPackageModel!.data!.sort((b, a) => a.id!.compareTo((b.id)!.toInt()));

        emit(GetMyPackageSuccess());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(GetMyPackageError());
      },
    );
  }

  // GET MY PACKAGE ONLY PENDING
  void getMyPendingPackages() {
    all = Color(0xffF6F6F6);
    aceepted = Color(0xffF6F6F6);
    refused = Color(0xffF6F6F6);
    pending = mPrimaryColor;

    currentState = 'P';
    allT = Colors.black;
    aceeptedT = Colors.black;
    refusedT = Colors.black;
    pendingT = Colors.white;
    emit(GetMyPackageLoading());
    DioHelper.getData(
            url: '$PACKAGEREQUEST=${SharedHelper.getCacheData(key: TOKEN)}')
        .then(
      (value) {
        subPackageModel = SubPackageModel.fromJson(value.data);
        subPackageModel!.data!.sort((b, a) => a.id!.compareTo((b.id)!.toInt()));

        emit(GetMyPackageSuccess());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(GetMyPackageError());
      },
    );
  }

  // CONFIRM PACKAGE SUBSCRIBE
  File? pImage;
  var pPicker = ImagePicker();
  Future<void> getImage() async {
    final pPickedFile = await pPicker.getImage(source: ImageSource.gallery);

    if (pPickedFile != null) {
      pImage = File(pPickedFile.path);
      emit(PickedPackageImageSuccess());
    } else {
      print('No image selected.');
      emit(PickedPackageImageError());
    }
  }

  void sendPaymentInfo({required formData, required id}) {
    emit(SendPackagePaymentLoading());
    DioHelper.postData(
      url: '$CONFIRMPACKAGEREQUEST/$id',
      data: formData,
    ).then(
      (value) {
        print(value.toString());
        emit(SendPackagePaymentSuccess());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(SendPackagePaymentError());
      },
    );
  }

  // CONFIRM TRAINER SUBSCRIBE
  File? tImage;
  var tPicker = ImagePicker();
  Future<void> tGetImage() async {
    final tPickedFile = await pPicker.getImage(source: ImageSource.gallery);

    if (tPickedFile != null) {
      tImage = File(tPickedFile.path);
      emit(PickedTrainerImageSuccess());
    } else {
      print('No image selected.');
      emit(PickedTrainerImageError());
    }
  }

  void sendTrainerPaymentInfo({required formData, required id}) {
    emit(SendTrainerPaymentLoading());
    DioHelper.postData(url: '$RESRVATIONREQUESTS/$id', data: formData).then(
      (value) {
        print(value.toString());
        emit(SendTrainerPaymentSuccess());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(SendTrainerPaymentError());
      },
    );
  }

  // CONFIRM IND SUBSCRIBE
  File? iImage;
  var iPicker = ImagePicker();
  Future<void> iGetImage() async {
    final iPickedFile = await pPicker.getImage(source: ImageSource.gallery);

    if (iPickedFile != null) {
      iImage = File(iPickedFile.path);
      emit(PickedIndImageSuccess());
    } else {
      print('No image selected.');
      emit(PickedIndImageError());
    }
  }

  sendIndPaymentInfo({required formData, required id}) {
    emit(SendIndPaymentLoading());
    DioHelper.postData(url: '$RESRVATIONREQUESTSIND/$id', data: formData).then(
      (value) {
        print(value.toString());
        emit(SendIndPaymentSuccess());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(SendIndPaymentError());
      },
    );
  }

  // CONTACT US
  void contactUs({
    required name,
    required email,
    required title,
    required content,
  }) {
    emit(SendContactLoading());
    DioHelper.postData(url: '$CONTACTS', data: {
      'name': name,
      'email': email,
      'title': title,
      'content': content,
    }).then(
      (value) {
        print(value.data);
        emit(SendContactSuccess());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(SendContactError());
      },
    );
  }

  // UPDATE PROFILE
  void updateProfile({
    name,
    email,
    phone,
    password,
  }) {
    emit(UpdateProfileLoading());
    DioHelper.postData(
      url: '$UPDATEPROFILE/${SharedHelper.getCacheData(key: TOKEN)}',
      data: {
        'name': name,
        'email': email,
        'mobile': phone,
        if (password.toString().isNotEmpty) 'password': password,
      },
    ).then(
      (value) {
        emit(UpdateProfileSuccess());
        getUserDataById();
        print(value.data);
      },
    ).catchError((e) {
      print(e.toString());
      emit(UpdateProfileError());
    });
  }

  // FORGOT PASSWORD
  void forgotPassword({required email}) {
    emit(ForgotPasswordLoading());
    DioHelper.postData(
      url: '$FORGOTPASSWORD',
      data: {
        'email': email,
      },
    ).then(
      (value) {
        print(value);
        emit(ForgotPasswordSuccess());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(ForgotPasswordError());
      },
    );
  }

  // SEND NEW ATTEND
  AttendModel? attendModel;
  void sendNewAttend({
    required date,
    required time,
    required subId,
    required trainerId,
  }) {
    emit(SendNewAttendLoading());
    DioHelper.postData(
      url: ATTENDS,
      data: {
        'date': date,
        'time': time,
        'users_package_id': subId,
        'trainer_id': trainerId,
      },
    ).then(
      (value) {
        attendModel = AttendModel.fromJson(value.data);
        emit(SendNewAttendSuccess());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(SendNewAttendError());
      },
    );
  }

  // CANCEL ATTEND
  void cancelAttend({
    required id,
    required reason,
  }) {
    emit(CancelAttendLoading());
    DioHelper.postData(
      url: 'attend/$id/cancel',
      data: {
        'cancel_reason': reason,
      },
    ).then(
      (value) {
        emit(CancelAttendSuccess());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(CancelAttendError());
      },
    );
  }

  var activeSubcribe;
  int? activeCount = 0;
  // GET ALL ACTIVE SUBSCRIBE
  void getAllActiveSubcribe() {
    emit(GetActiveSubscribeLoading());
    DioHelper.getData(url: '$ACTIVE=${SharedHelper.getCacheData(key: TOKEN)}')
        .then(
      (value) {
        activeSubcribe = value.data;
        activeCount = activeSubcribe['data'].length;
        emit(GetActiveSubscribeSuccess());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(GetActiveSubscribeError());
      },
    );
  }

  var endSubcribe;
  int? endCount = 0;
  // GET ALL ACTIVE SUBSCRIBE
  void getAllEndSubcribe() {
    emit(GetEndSubscribeLoading());
    DioHelper.getData(url: '$END=${SharedHelper.getCacheData(key: TOKEN)}')
        .then(
      (value) {
        endSubcribe = value.data;
        endCount = endSubcribe['data'].length;
        emit(GetEndSubscribeSuccess());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(GetEndSubscribeError());
      },
    );
  }

  // GET SUBSCIRTION DETAIL
  SubPackageModel? subscribeDetails;
  void getSubDetail() {
    emit(GetSubscribeDetailLoading());
    DioHelper.getData(
            url: '$PACKAGEREQUEST=${SharedHelper.getCacheData(key: TOKEN)}')
        .then(
      (value) {
        subscribeDetails = SubPackageModel.fromJson(value.data);
        // subscribeDetails!.data!.where((element) => element.id == id);

        emit(GetSubscribeDetailSuccess());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(GetSubscribeDetailError());
      },
    );
  }

  // SEEN ALL NOTIFICATION
  void seenAllNotification({required noteId}) {
    DioHelper.getData(url: '$SEEN/$noteId').then((value) {}).catchError((e) {
      print(e.toString());
    });
  }
}
