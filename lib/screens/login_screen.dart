import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:horse_app/constants/colors.dart';
import 'package:horse_app/constants/fonts.dart';
import 'package:horse_app/widgets/reusable_widgets.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/logo.jpg',
                          width: 150,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AutoSizeText(
                                'إسم المستخدم',
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: mThirdArabicFont,
                                ),
                              ),
                              SizedBox(height: 5),
                              TextFormField(
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
                        myPrimaryButton(
                          title: 'دخـــــول',
                          onClick: () {},
                        ),
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
                          padding: const EdgeInsets.symmetric(horizontal: 80),
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
  }
}
