import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horse_app/bloc/register/states.dart';
import 'package:horse_app/constants/keys.dart';
import 'package:horse_app/helpers/end_points.dart';
import 'package:horse_app/helpers/shared_helper_Screen.dart';
import 'package:horse_app/models/register_model.dart';
import 'package:horse_app/networking/dio_helper.dart';
import 'package:image_picker/image_picker.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterInitStates());

  //? Call Cubit Class
  static RegisterCubit get(context) => BlocProvider.of(context);

  //* VARS
  RegisterModel? registerModel;

  File? productImage;
  final picker = ImagePicker();
  String? userImageUrl;

  List members = [
    'التسجيل كـ فارس',
    'التسجيل كـ فارسة',
    'التسجيل كـ طفل',
  ];

  String selectedMember = 'التسجيل كـ فارس';

  void selecteMember(currentSelected) {
    selectedMember = currentSelected;
    emit(RegisterChooseMember());
  }

  // IMAGE
  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      productImage = File(pickedFile.path);
      // emit(HomeUploadImageSuccess());
    } else {
      print('No image selected.');
      // emit(HomeUploadImageError());
    }
  }

  void register({
    required name,
    required email,
    required mobile,
    required password,
    required membership,
  }) {
    emit(RegisterLoadingStates());
    DioHelper.postData(
      url: REGISTER,
      data: {
        'name': name,
        'email': email,
        'mobile': mobile,
        'password': password,
        'membership': membership,
      },
    ).then(
      (value) {
        print(value.data);
        registerModel = RegisterModel.fromJson(value.data);
        print(registerModel!.message);
        SharedHelper.cacheData(key: TOKEN, value: '');
        emit(RegisterSucessStates(registerModel!));
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(RegisterErrorStates());
      },
    );
  }
}
