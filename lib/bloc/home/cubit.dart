import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horse_app/bloc/home/states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());

  static HomeCubit get(context) => BlocProvider.of(context);

  List service = [
    'خدمه رقم واحد',
    'خدمه رقم اتنين',
    'خدمه رقم تلاته',
    'خدمه رقم اربعه',
  ];

  String selectedService = 'خدمه رقم واحد';

  void selecteService(currentValue) {
    selectedService = currentValue;
    emit(HomeChangeSelectedSerivce());
  }
}
