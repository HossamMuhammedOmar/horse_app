import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horse_app/bloc/home/states.dart';
import 'package:horse_app/constants/keys.dart';
import 'package:horse_app/helpers/end_points.dart';
import 'package:horse_app/helpers/shared_helper_Screen.dart';
import 'package:horse_app/models/categories_model.dart';
import 'package:horse_app/models/packages_model.dart';
import 'package:horse_app/networking/dio_helper.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());

  static HomeCubit get(context) => BlocProvider.of(context);

  List service = [];

  String selectedService = 'اشتراكات تدريب الخيل ارضي اقل 18 سنه';

  CategoriesModel? categoriesModel;

  void selecteService(currentValue) {
    selectedService = currentValue;
    emit(HomeChangeSelectedSerivce());
  }

  // GET USER DATA BY ID
  void getUserDataById() {
    emit(GetUserDataLoading());
    DioHelper.getData(
            url: '$GETUSERBYID/${SharedHelper.getCacheData(key: TOKEN)}')
        .then(
      (value) {
        print(value.data);
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
}
