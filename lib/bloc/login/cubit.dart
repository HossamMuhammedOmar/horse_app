import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horse_app/bloc/login/states.dart';
import 'package:horse_app/helpers/end_points.dart';
import 'package:horse_app/networking/dio_helper.dart';

class LoginCubit extends Cubit<LgoinStates> {
  LoginCubit() : super(LoginInitState());

  static LoginCubit get(context) => BlocProvider.of(context);

  void login({required email, required password}) {
    emit(LoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {'email': email, 'password': password},
    ).then(
      (value) {
        print(value);
        emit(LoginSuccessState());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(LoginErrorState());
      },
    );
  }
}
