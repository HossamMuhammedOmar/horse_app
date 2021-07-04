import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horse_app/bloc/home/cubit.dart';
import 'package:horse_app/bloc/home/states.dart';
import 'package:horse_app/constants/colors.dart';
import 'package:horse_app/constants/fonts.dart';
import 'package:horse_app/screens/home_screen.dart';
import 'package:horse_app/screens/ind_reservations_list_screen.dart';
import 'package:horse_app/screens/my_ind_subscribe_follow.dart';
import 'package:horse_app/screens/subscribe_screen.dart';
import 'package:horse_app/screens/trainer_reservation_list_screen.dart';
import 'package:horse_app/screens/trainer_subscribe_follow.dart';
import 'package:transitioner/transitioner.dart';

import 'contact_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit _cubit = HomeCubit.get(context);
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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Container(
            height: 65.0,
            width: 65.0,
            child: FittedBox(
              child: FloatingActionButton(
                elevation: 0,
                backgroundColor: Colors.white,
                onPressed: () {
                  Transitioner(
                    context: context,
                    child: HomeScreen(),
                    animation: AnimationType.fadeIn, // Optional value
                    duration: Duration(milliseconds: 300), // Optional value
                    replacement: true, // Optional value
                    curveType: CurveType.decelerate, // Optional value
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Image.asset('assets/images/home.png'),
                ),
              ),
            ),
          ),
          body: _cubit.profileModel != null
              ? Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/bg.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: LayoutBuilder(
                              builder: (context, constraint) {
                                var topHeight = constraint.maxHeight;
                                var topWidht = constraint.maxWidth;
                                return Column(
                                  textDirection: TextDirection.rtl,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 20,
                                        right: 25,
                                        top: 20,
                                        bottom: 3,
                                      ),
                                      child: AutoSizeText(
                                        'إعدادات الحساب',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                            fontFamily: mSecondArabicFont,
                                            fontSize: 16,
                                            color: mPrimaryColor),
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Container(
                                        width: double.infinity,
                                        height: 0.5,
                                        color: Color(0xff707070),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Center(
                                      child: AutoSizeText(
                                        'hossam test1',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: mPrimaryArabicFont,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 5),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xffF8F8F8),
                                          border: Border.all(
                                            color: Color(0xffD2D2D2),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        width: double.infinity,
                                        height: 310,
                                        padding: const EdgeInsets.all(13),
                                        child: Column(
                                          children: [
                                            GestureDetector(
                                              child: Container(
                                                child: Row(
                                                  children: [
                                                    Center(
                                                      child: Image.asset(
                                                        'assets/images/arrow_double.png',
                                                        width: 10,
                                                      ),
                                                    ),
                                                    SizedBox(width: 15),
                                                    AutoSizeText(
                                                      'تعديل بياناتي',
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontFamily:
                                                            mPrimaryArabicFont,
                                                        fontSize: 16,
                                                        color: mPrimaryColor,
                                                      ),
                                                    ),
                                                  ],
                                                  textDirection:
                                                      TextDirection.rtl,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 12),
                                            Container(
                                              height: 1,
                                              width: double.infinity,
                                              color: Color(0xffD2D2D2),
                                            ),
                                            SizedBox(height: 12),
                                            GestureDetector(
                                              child: Container(
                                                child: Row(
                                                  children: [
                                                    Center(
                                                      child: Image.asset(
                                                        'assets/images/arrow_double.png',
                                                        width: 10,
                                                      ),
                                                    ),
                                                    SizedBox(width: 15),
                                                    AutoSizeText(
                                                      'إشتراكاتي',
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontFamily:
                                                            mPrimaryArabicFont,
                                                        fontSize: 16,
                                                        color: mPrimaryColor,
                                                      ),
                                                    ),
                                                  ],
                                                  textDirection:
                                                      TextDirection.rtl,
                                                ),
                                              ),
                                              onTap: () {
                                                // _cubit.getPackageRequestById();
                                                Transitioner(
                                                  context: context,
                                                  child: SubscibeScreen(),
                                                  animation:
                                                      AnimationType.fadeIn,
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  replacement: true,
                                                  curveType:
                                                      CurveType.decelerate,
                                                );
                                              },
                                            ),
                                            SizedBox(height: 12),
                                            Container(
                                              height: 1,
                                              width: double.infinity,
                                              color: Color(0xffD2D2D2),
                                            ),
                                            SizedBox(height: 12),
                                            GestureDetector(
                                              child: Container(
                                                child: Row(
                                                  children: [
                                                    Center(
                                                      child: Image.asset(
                                                        'assets/images/arrow_double.png',
                                                        width: 10,
                                                      ),
                                                    ),
                                                    SizedBox(width: 15),
                                                    AutoSizeText(
                                                      'حجز موعد',
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontFamily:
                                                            mPrimaryArabicFont,
                                                        fontSize: 16,
                                                        color: mPrimaryColor,
                                                      ),
                                                    ),
                                                  ],
                                                  textDirection:
                                                      TextDirection.rtl,
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 12),
                                            Container(
                                              height: 1,
                                              width: double.infinity,
                                              color: Color(0xffD2D2D2),
                                            ),
                                            SizedBox(height: 12),
                                            GestureDetector(
                                              child: Container(
                                                child: Row(
                                                  children: [
                                                    Center(
                                                      child: Image.asset(
                                                        'assets/images/arrow_double.png',
                                                        width: 10,
                                                      ),
                                                    ),
                                                    SizedBox(width: 15),
                                                    AutoSizeText(
                                                      'إشتراكات المدربين',
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontFamily:
                                                            mPrimaryArabicFont,
                                                        fontSize: 16,
                                                        color: mPrimaryColor,
                                                      ),
                                                    ),
                                                  ],
                                                  textDirection:
                                                      TextDirection.rtl,
                                                ),
                                              ),
                                              onTap: () {
                                                _cubit.getMyTrainerSubscribe();
                                                Transitioner(
                                                  context: context,
                                                  child:
                                                      TrainerSubscribeFollow(),
                                                  animation:
                                                      AnimationType.fadeIn,
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  replacement: true,
                                                  curveType:
                                                      CurveType.decelerate,
                                                );
                                              },
                                            ),
                                            SizedBox(height: 12),
                                            Container(
                                              height: 1,
                                              width: double.infinity,
                                              color: Color(0xffD2D2D2),
                                            ),
                                            SizedBox(height: 12),
                                            GestureDetector(
                                              child: Container(
                                                child: Row(
                                                  children: [
                                                    Center(
                                                      child: Image.asset(
                                                        'assets/images/arrow_double.png',
                                                        width: 10,
                                                      ),
                                                    ),
                                                    SizedBox(width: 15),
                                                    AutoSizeText(
                                                      'الإشتراكات الفرديه',
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontFamily:
                                                            mPrimaryArabicFont,
                                                        fontSize: 16,
                                                        color: mPrimaryColor,
                                                      ),
                                                    ),
                                                  ],
                                                  textDirection:
                                                      TextDirection.rtl,
                                                ),
                                              ),
                                              onTap: () {
                                                _cubit.getMyIndSubscribe();
                                                Transitioner(
                                                  context: context,
                                                  child: MyIndSubscribeFollow(),
                                                  animation:
                                                      AnimationType.fadeIn,
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  replacement: true,
                                                  curveType:
                                                      CurveType.decelerate,
                                                );
                                              },
                                            ),
                                            SizedBox(height: 12),
                                            Container(
                                              height: 1,
                                              width: double.infinity,
                                              color: Color(0xffD2D2D2),
                                            ),
                                          ],
                                          textDirection: TextDirection.rtl,
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            child: MaterialButton(
                              onPressed: () {},
                              color: Color(0xffD82E37),
                              minWidth: double.infinity,
                              height: 50,
                              child: Text(
                                'تسجيل الخروج',
                                style: TextStyle(
                                  fontFamily: 'Cairo',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: mPrimaryColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height / 13.5,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Transitioner(
                                      context: context,
                                      child: ContactScreen(),
                                      animation: AnimationType
                                          .fadeIn, // Optional value
                                      duration: Duration(
                                          milliseconds: 300), // Optional value
                                      replacement: true, // Optional value
                                      curveType: CurveType
                                          .decelerate, // Optional value
                                    );
                                  },
                                  child: Image.asset(
                                    'assets/images/mail_bulk.png',
                                    width: 30,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _cubit.getUserDataById();
                                    print('Account Info');
                                  },
                                  child: Image.asset(
                                    'assets/images/chalkboard.png',
                                    width: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(
                    color: mPrimaryColor,
                  ),
                ),
        );
      },
    );
  }
}
