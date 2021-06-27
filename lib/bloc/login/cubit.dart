import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horse_app/bloc/login/states.dart';
import 'package:horse_app/helpers/end_points.dart';
import 'package:horse_app/models/login_model.dart';
import 'package:horse_app/networking/dio_helper.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitState());

  static LoginCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;
  void login({required email, required password}) {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {
        'email': email,
        'password': password,
      },
    ).then(
      (value) {
        if (value.data['statue'] == true) {
          loginModel = LoginModel.fromJson(value.data);
          print('${value.data['statue']}');
          emit(LoginSuccessState(loginModel!));
        } else {
          emit(LoginErrorState());
        }
      },
    ).catchError(
      (e) {
        print("ERROR ${e.toString()}");
        emit(LoginErrorState());
      },
    );
  }
}
