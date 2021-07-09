import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:horse_app/bloc/home/cubit.dart';
import 'package:horse_app/bloc/home/states.dart';
import 'package:horse_app/constants/colors.dart';
import 'package:horse_app/constants/fonts.dart';
import 'package:horse_app/screens/login_screen.dart';
import 'package:transitioner/transitioner.dart';

class ForgotPasswordScreen extends StatelessWidget {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is ForgotPasswordError) {
          Fluttertoast.showToast(
              msg: "حدث خطأ، الرجاء إعاده المحاوله",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
        if (state is ForgotPasswordSuccess) {
          _emailController.text = '';
          Fluttertoast.showToast(
              msg: "تم إرسال كلمه المرور بنجاح",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
      builder: (context, state) {
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
                          child: LoginScreen(),
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
                                ],
                              ),
                            ),
                            SizedBox(height: 30),
                            MaterialButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  HomeCubit.get(context).forgotPassword(
                                      email: _emailController.text);
                                }
                              },
                              color: mPrimaryColor,
                              minWidth: double.infinity,
                              height: 50,
                              child: state is! ForgotPasswordLoading
                                  ? Text(
                                      'إستعاده',
                                      style: TextStyle(
                                        fontFamily: 'NotoKufiArabic',
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Center(
                                      child: CircularProgressIndicator(
                                      color: Colors.white,
                                    )),
                            ),
                            // : Center(
                            //     child: CircularProgressIndicator(
                            //     color: mPrimaryColor,
                            //   )),
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
    );
  }
}
