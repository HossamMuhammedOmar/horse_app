import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horse_app/bloc/home/states.dart';
import 'package:horse_app/constants/keys.dart';
import 'package:horse_app/helpers/end_points.dart';
import 'package:horse_app/helpers/shared_helper_Screen.dart';
import 'package:horse_app/models/categories_model.dart';
import 'package:horse_app/models/login_model.dart';
import 'package:horse_app/models/packages_model.dart';
import 'package:horse_app/models/posts_model.dart';
import 'package:horse_app/models/trainers_model.dart';
import 'package:horse_app/networking/dio_helper.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());

  static HomeCubit get(context) => BlocProvider.of(context);

  List service = [];

  List trainner = [];

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
}
