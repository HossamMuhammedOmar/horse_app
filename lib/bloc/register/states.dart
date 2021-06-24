import 'package:horse_app/models/register_model.dart';

abstract class RegisterStates {}

class RegisterInitStates extends RegisterStates {}

class RegisterLoadingStates extends RegisterStates {}

class RegisterSucessStates extends RegisterStates {
  final RegisterModel registerModel;
  RegisterSucessStates(this.registerModel);
}

class RegisterErrorStates extends RegisterStates {}

class RegisterChooseMember extends RegisterStates {}
