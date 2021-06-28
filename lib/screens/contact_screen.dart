import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:horse_app/constants/colors.dart';
import 'package:horse_app/constants/fonts.dart';
import 'package:transitioner/transitioner.dart';

import 'home_screen.dart';

class ContactScreen extends StatelessWidget {
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: LayoutBuilder(
              builder: (context, constraint) {
                var topHeight = constraint.maxHeight;
                var topWidht = constraint.maxWidth;
                return SingleChildScrollView(
                  child: Column(
                    textDirection: TextDirection.rtl,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Container(
                          width: double.infinity,
                          height: 0.3,
                          color: Color(0xff707070),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Transitioner(
                              context: context,
                              child: HomeScreen(),
                              animation: AnimationType.fadeIn, // Optional value
                              duration:
                                  Duration(milliseconds: 300), // Optional value
                              replacement: true, // Optional value
                              curveType: CurveType.decelerate, // Optional value
                            );
                          },
                          icon: Icon(
                            Icons.double_arrow,
                            color: mPrimaryColor,
                            size: 22,
                          )),
                      AutoSizeText(
                        'يمكنكم التواصل معنا عبر الواتس أو الإتصال',
                        style: TextStyle(
                          fontFamily: mPrimaryArabicFont,
                          fontSize: 16,
                        ),
                        maxLines: 1,
                      ),
                      SizedBox(height: 15),
                      AutoSizeText(
                        '0506499275',
                        style: TextStyle(
                          fontFamily: mPrimaryArabicFont,
                          fontSize: 16,
                          color: Colors.red,
                        ),
                        maxLines: 1,
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Form(
                          child: Column(
                            children: [
                              Text(
                                'العنوان',
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  fontFamily: mPrimaryArabicFont,
                                ),
                              ),
                              SizedBox(height: 3),
                              Container(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                height: 40,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'البريد',
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  fontFamily: mPrimaryArabicFont,
                                ),
                              ),
                              SizedBox(height: 3),
                              Container(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                height: 40,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'الجوال',
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  fontFamily: mPrimaryArabicFont,
                                ),
                              ),
                              SizedBox(height: 3),
                              Container(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                                height: 40,
                              ),
                              SizedBox(height: 10),
                              Text(
                                'المحتوي',
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  fontFamily: mPrimaryArabicFont,
                                ),
                              ),
                              SizedBox(height: 3),
                              TextFormField(
                                maxLines: 8,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 40),
                                child: Center(
                                  child: MaterialButton(
                                    onPressed: () {},
                                    child: Text(
                                      'إرسال',
                                      style: TextStyle(
                                        fontFamily: 'Cairo',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    minWidth: double.infinity,
                                    height: 50,
                                    elevation: 6,
                                    color: mPrimaryColor,
                                  ),
                                ),
                              )
                            ],
                            textDirection: TextDirection.rtl,
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
