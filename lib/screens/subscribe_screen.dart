import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:horse_app/constants/colors.dart';
import 'package:horse_app/constants/fonts.dart';
import 'package:horse_app/screens/profile_screen.dart';
import 'package:transitioner/transitioner.dart';

import 'home_screen.dart';

class SubscibeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 110,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Container(
          margin: const EdgeInsets.only(right: 15, top: 15),
          child: Image.asset(
            'assets/images/logo.png',
            width: 140,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Container(
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_none,
                    size: 30,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(2),
                  height: 25,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Color(0xff707070),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '0',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 30.0,
              child: ClipRRect(
                child: Image.asset(
                  'assets/images/hore_image.jpeg',
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(60.0),
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset('assets/images/bg.jpg'),
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: LayoutBuilder(
              builder: (context, constraint) {
                var topHeight = constraint.maxHeight;
                var topWidht = constraint.maxWidth;
                return Column(
                  textDirection: TextDirection.rtl,
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: IconButton(
                              onPressed: () {
                                Transitioner(
                                  context: context,
                                  child: ProfileScreen(),
                                  animation:
                                      AnimationType.fadeIn, // Optional value
                                  duration: Duration(
                                      milliseconds: 300), // Optional value
                                  replacement: true, // Optional value
                                  curveType:
                                      CurveType.decelerate, // Optional value
                                );
                              },
                              icon: Icon(
                                Icons.double_arrow,
                                color: mPrimaryColor,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Center(
                            child: AutoSizeText(
                              'إشتراكاتي',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                                fontFamily: mPrimaryArabicFont,
                              ),
                            ),
                          ),
                        ),
                      ],
                      alignment: Alignment.centerRight,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        width: double.infinity,
                        height: 0.5,
                        color: Color(0xff707070),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        textDirection: TextDirection.rtl,
                        children: [
                          GestureDetector(
                            child: Container(
                              width: 65,
                              height: 35,
                              decoration: BoxDecoration(
                                color: mPrimaryColor,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  'الـكل',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: mPrimaryArabicFont,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {},
                          ),
                          SizedBox(width: 8),
                          GestureDetector(
                            child: Container(
                              width: 100,
                              height: 35,
                              decoration: BoxDecoration(
                                color: Color(0xffF6F6F6),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  'تحت المراجعه',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: mPrimaryArabicFont,
                                    color: Colors.black,
                                  ),
                                  maxLines: 1,
                                ),
                              ),
                            ),
                            onTap: () {},
                          ),
                          SizedBox(width: 8),
                          GestureDetector(
                            child: Container(
                              width: 65,
                              height: 35,
                              decoration: BoxDecoration(
                                color: Color(0xffF6F6F6),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  'مقبوله',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: mPrimaryArabicFont,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {},
                          ),
                          SizedBox(width: 8),
                          GestureDetector(
                            child: Container(
                              width: 75,
                              height: 35,
                              decoration: BoxDecoration(
                                color: Color(0xffF6F6F6),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text(
                                  'مرفوضه',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: mPrimaryArabicFont,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}