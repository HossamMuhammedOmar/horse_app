import '../../models/login_model.dart';

abstract class LoginStates {}

class LoginInitState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final LoginModel loginModel;

  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends LoginStates {}
