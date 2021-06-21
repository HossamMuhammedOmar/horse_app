import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/colors.dart';
import '../constants/fonts.dart';
import '../widgets/reusable_widgets.dart';

class RegisterScreen extends StatelessWidget {
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
                        padding: const EdgeInsets.symmetric(horizontal: 70),
                        child: Divider(
                          thickness: .3,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 30),
                      Form(
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
                            TextFormField(
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.rtl,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                prefixIcon:
                                    Icon(Icons.arrow_drop_down_outlined),
                                hintText: 'تسجيل كـ فارس',
                                hintStyle: TextStyle(
                                    color: mPrimaryColor,
                                    fontFamily: mPrimaryArabicFont,
                                    fontSize: 14),
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                              ),
                            ),
                            SizedBox(height: 15),
                            TextFormField(
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
                                    const EdgeInsets.symmetric(horizontal: 10),
                              ),
                            ),
                            SizedBox(height: 15),
                            TextFormField(
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
                                    const EdgeInsets.symmetric(horizontal: 10),
                              ),
                            ),
                            SizedBox(height: 15),
                            TextFormField(
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
                                    const EdgeInsets.symmetric(horizontal: 10),
                              ),
                            ),
                            SizedBox(height: 15),
                            TextFormField(
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
                                    const EdgeInsets.symmetric(horizontal: 10),
                              ),
                            ),
                            SizedBox(height: 15),
                            TextFormField(
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
                                    const EdgeInsets.symmetric(horizontal: 10),
                              ),
                            ),
                            SizedBox(height: 15),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      myPrimaryButton(
                        title: 'تسجيل',
                        onClick: () {},
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
  }
}
