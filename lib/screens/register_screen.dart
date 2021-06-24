import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:horse_app/bloc/register/cubit.dart';
import 'package:horse_app/bloc/register/states.dart';
import '../constants/colors.dart';
import '../constants/fonts.dart';
import '../widgets/reusable_widgets.dart';

class RegisterScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _mobileController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is RegisterSucessStates) {
            if (state.registerModel.status == true) {
              Fluttertoast.showToast(
                msg: state.registerModel.message!,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0,
              );
              // navigationAndFinish(context, HomeScreen());
            } else {
              Fluttertoast.showToast(
                msg: state.registerModel.message!,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0,
              );
            }
          }
        },
        builder: (context, state) {
          RegisterCubit _cubit = RegisterCubit.get(context);
          return Scaffold(
            body: LayoutBuilder(
              builder: (context, constraint) {
                return Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Image.asset(
                        'assets/images/bg.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 40,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/images/logo.png',
                              width: 150,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            AutoSizeText(
                              'تسجيل عضوية جديدة',
                              maxLines: 1,
                              style: TextStyle(
                                fontFamily: mPrimaryArabicFont,
                                color: mPrimaryColor,
                                fontSize: 16,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 70),
                              child: Divider(
                                thickness: .3,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 30),
                            Form(
                              key: _formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                textDirection: TextDirection.rtl,
                                children: [
                                  AutoSizeText(
                                    'إختر نوع العضوية',
                                    maxLines: 1,
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: mPrimaryArabicFont,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1,
                                        color: Colors.grey.withOpacity(0.9),
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: DecoratedBox(
                                      decoration: ShapeDecoration(
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(3.0),
                                          ),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: DropdownButton(
                                            iconEnabledColor: mPrimaryColor,
                                            items: _cubit.members.map(
                                              (member) {
                                                return DropdownMenuItem(
                                                  value: member,
                                                  child: Container(
                                                    child: AutoSizeText(
                                                      member,
                                                      maxLines: 1,
                                                      style: TextStyle(
                                                        color: mPrimaryColor,
                                                        fontFamily:
                                                            mPrimaryArabicFont,
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ).toList(),
                                            onChanged: (value) {
                                              _cubit.selecteMember(
                                                  value.toString());
                                            },
                                            value: _cubit.selectedMember,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  TextFormField(
                                    controller: _nameController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'من فضلك أدخل هذا الحقل';
                                      }
                                    },
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'الإسم',
                                      hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: mPrimaryArabicFont,
                                          fontSize: 14),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  TextFormField(
                                    controller: _emailController,
                                    validator: (value) {
                                      if (value!.isEmpty ||
                                          !value.contains('@')) {
                                        return 'من فضلك أدخل هذا الحقل';
                                      }
                                    },
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'البريد الإلكتروني',
                                      hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: mPrimaryArabicFont,
                                          fontSize: 14),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  TextFormField(
                                    controller: _mobileController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'من فضلك أدخل هذا الحقل';
                                      }
                                    },
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'رقم الجوال',
                                      hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: mPrimaryArabicFont,
                                          fontSize: 14),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  TextFormField(
                                    controller: _passwordController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'من فضلك أدخل هذا الحقل';
                                      }
                                    },
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'كلمة السر',
                                      hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: mPrimaryArabicFont,
                                          fontSize: 14),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  TextFormField(
                                    controller: _confirmPasswordController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'من فضلك أدخل هذا الحقل';
                                      } else if (value !=
                                          _passwordController.text) {
                                        return 'كلمه السر غير متطابه';
                                      }
                                    },
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(),
                                      hintText: 'تأكيد كلمة السر',
                                      hintStyle: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: mPrimaryArabicFont,
                                          fontSize: 14),
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 10),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            state is! RegisterLoadingStates
                                ? myPrimaryButton(
                                    title: 'تسجيل',
                                    onClick: () {
                                      String? memberType;
                                      switch (_cubit.selectedMember) {
                                        case 'التسجيل كـ فارس':
                                          memberType = 'knight';
                                          break;
                                        case 'التسجيل كـ فارسة':
                                          memberType = 'knightG';
                                          break;
                                        case 'التسجيل كـ طفل':
                                          memberType = 'child';
                                          break;
                                      }
                                      if (_formKey.currentState!.validate()) {
                                        _cubit.register(
                                          name: _nameController.text,
                                          email: _emailController.text,
                                          mobile: _mobileController.text,
                                          password: _passwordController.text,
                                          membership: memberType,
                                        );
                                      }
                                    },
                                  )
                                : Center(
                                    child: CircularProgressIndicator(
                                      color: mPrimaryColor,
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
