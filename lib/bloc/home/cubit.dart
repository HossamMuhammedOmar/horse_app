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
import 'package:horse_app/models/packages_model.dart';
import 'package:horse_app/models/posts_model.dart';
import 'package:horse_app/models/trainers_model.dart';
import 'package:horse_app/networking/dio_helper.dart';

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

  String selectedTime = '4';

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
        emit(GetMySubscribIndSuccess());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(GetMySubscribIndError());
      },
    );
  }
}
