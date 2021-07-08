import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:horse_app/bloc/login/cubit.dart';
import 'package:horse_app/bloc/login/states.dart';
import 'package:horse_app/constants/colors.dart';
import 'package:horse_app/constants/fonts.dart';
import 'package:horse_app/constants/keys.dart';
import 'package:horse_app/helpers/shared_helper_Screen.dart';
import 'package:horse_app/screens/home_screen.dart';
import 'package:horse_app/screens/welcome_screen.dart';
import 'package:horse_app/widgets/reusable_widgets.dart';
import 'package:transitioner/transitioner.dart';

class LoginScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, states) {
          if (states is LoginSuccessState) {
            SharedHelper.cacheData(
                key: TOKEN, value: '${states.loginModel.data!.id}');
            Fluttertoast.showToast(
              msg: 'تم الدخول بنجاح',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0,
            );
            Transitioner(
              context: context,
              child: HomeScreen(),
              animation: AnimationType.slideRight, // Optional value
              duration: Duration(milliseconds: 300), // Optional value
              replacement: true, // Optional value
              curveType: CurveType.decelerate, // Optional value
            );
          } else if (states is LoginErrorState) {
            Fluttertoast.showToast(
                msg: 'البيانات غير صحيحة',
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          }
        },
        builder: (context, states) {
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
                    Padding(
                      padding: const EdgeInsets.only(top: 70, left: 20),
                      child: IconButton(
                        onPressed: () {
                          Transitioner(
                            context: context,
                            child: WelcomeScreen(),
                            animation: AnimationType.fadeIn,
                            duration: Duration(milliseconds: 300),
                            replacement: true,
                            curveType: CurveType.decelerate,
                          );
                        },
                        icon: Icon(Icons.arrow_back_ios),
                      ),
                    ),
                    Center(
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/logo.png',
                                width: 150,
                              ),
                              SizedBox(
                                height: 40,
                              ),
                              Form(
                                key: _formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    AutoSizeText(
                                      'البريد الإلكتروني',
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: mThirdArabicFont,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      controller: _emailController,
                                      validator: (value) {
                                        if (value!.isEmpty ||
                                            !value.contains('@')) {
                                          return 'أدخل البريد الإلكتروني';
                                        }
                                      },
                                      decoration: new InputDecoration(
                                        enabledBorder: const OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: mPrimaryColor, width: 0.8),
                                        ),
                                        border: const OutlineInputBorder(),
                                        labelStyle:
                                            new TextStyle(color: Colors.green),
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    AutoSizeText(
                                      'كلمة المرور',
                                      maxLines: 1,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: mThirdArabicFont,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    TextFormField(
                                      keyboardType:
                                          TextInputType.visiblePassword,
                                      obscureText: true,
                                      controller: _passwordController,
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'أدخل كلمه المرور';
                                        }
                                      },
                                      decoration: new InputDecoration(
                                        enabledBorder: const OutlineInputBorder(
                                          // width: 0.0 produces a thin "hairline" border
                                          borderSide: const BorderSide(
                                              color: mPrimaryColor, width: 0.8),
                                        ),
                                        border: const OutlineInputBorder(),
                                        labelStyle:
                                            new TextStyle(color: Colors.green),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 30),
                              states is! LoginLoadingState
                                  ? myPrimaryButton(
                                      title: 'دخـــــول',
                                      onClick: () {
                                        if (_formKey.currentState!.validate()) {
                                          LoginCubit.get(context).login(
                                            email: _emailController.text,
                                            password: _passwordController.text,
                                          );
                                        }
                                      },
                                    )
                                  : Center(
                                      child: CircularProgressIndicator(
                                      color: mPrimaryColor,
                                    )),
                              SizedBox(
                                height: 30,
                              ),
                              AutoSizeText(
                                'إستعادة كلمة المرور',
                                maxLines: 1,
                                style: TextStyle(
                                  fontFamily: mPrimaryArabicFont,
                                  fontSize: 16,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 80),
                                child: Divider(
                                  thickness: .3,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
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
