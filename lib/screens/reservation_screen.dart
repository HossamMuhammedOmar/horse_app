import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:horse_app/bloc/home/cubit.dart';
import 'package:horse_app/bloc/home/states.dart';
import 'package:horse_app/constants/colors.dart';
import 'package:horse_app/constants/fonts.dart';
import 'package:horse_app/screens/confirm_screen.dart';
import 'package:horse_app/screens/home_screen.dart';
import 'package:transitioner/transitioner.dart';

import 'notification_screen.dart';
import 'profile_screen.dart';

class ReservationScreen extends StatelessWidget {
  final id;
  final price;
  final title;
  final classCount;
  final subDays;
  final image;
  final conditions;

  const ReservationScreen({
    Key? key,
    required this.id,
    required this.price,
    required this.title,
    required this.classCount,
    required this.subDays,
    required this.image,
    required this.conditions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> trainers = [];
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is CreatePackageRequestSuccess) {
          Fluttertoast.showToast(
              msg: "تم التسجيل بنجاح",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);

          HomeCubit.get(context).getUserNotification();
          Transitioner(
            context: context,
            child: ConfirmScreen(),
            animation: AnimationType.fadeIn, // Optional value
            duration: Duration(milliseconds: 300), // Optional value
            replacement: true, // Optional value
            curveType: CurveType.decelerate, // Optional value
          );
        }

        if (state is CreatePackageRequestError) {
          Fluttertoast.showToast(
              msg: "حدث خطأ، الرجاء إعاده المحاوله",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      },
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
                      onPressed: () {
                        _cubit.getUserNotification();
                        _cubit.notificationModel!.data!
                            .where((element) => element.seen == '0')
                            .forEach((element) {
                          print(element.id);
                          _cubit.seenAllNotification(noteId: element.id);
                        });
                        Transitioner(
                          context: context,
                          child: NotificationScreen(),
                          animation: AnimationType.fadeIn, // Optional value
                          duration:
                              Duration(milliseconds: 300), // Optional value
                          replacement: true, // Optional value
                          curveType: CurveType.decelerate, // Optional value
                        );
                      },
                      icon: Icon(
                        Icons.notifications_none,
                        size: 30,
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 4,
                      child: Container(
                        // padding: const EdgeInsets.all(2),
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(30),
                          // border: Border.all(
                          //   color: Color(0xff707070),
                          // ),
                        ),
                        child: Center(
                          child: Text(
                            '${_cubit.notificationModel!.data!.where((element) => element.seen == '0').length}',
                            style: TextStyle(color: Colors.white),
                          ),
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
                child: GestureDetector(
                  onTap: () {
                    _cubit.getUserDataById();
                    Transitioner(
                      context: context,
                      child: ProfileScreen(),
                      animation: AnimationType.fadeIn, // Optional value
                      duration: Duration(milliseconds: 300), // Optional value
                      replacement: true, // Optional value
                      curveType: CurveType.decelerate, // Optional value
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 40.0,
                    child: ClipRRect(
                      child: Image.asset(
                        'assets/images/hore_image.jpeg',
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: LayoutBuilder(
                  builder: (context, constraint) {
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
                                      child: HomeScreen(),
                                      animation: AnimationType
                                          .fadeIn, // Optional value
                                      duration: Duration(
                                          milliseconds: 300), // Optional value
                                      replacement: true, // Optional value
                                      curveType: CurveType
                                          .decelerate, // Optional value
                                    );
                                  },
                                  icon: Icon(
                                    Icons.double_arrow,
                                    color: mPrimaryColor,
                                  )),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Center(
                                child: AutoSizeText(
                                  'إشتراك جديد',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: mPrimaryArabicFont,
                                  ),
                                ),
                              ),
                            ),
                          ],
                          alignment: Alignment.centerRight,
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            width: double.infinity,
                            height: 0.5,
                            color: Color(0xff707070),
                          ),
                        ),
                        SizedBox(height: 20),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                textDirection: TextDirection.rtl,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    color: Colors.black,
                                    width: double.infinity,
                                    height: 60,
                                    child: Center(
                                      child: AutoSizeText(
                                        '$title',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: mPrimaryArabicFont,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        textDirection: TextDirection.rtl,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                    child: Image.asset(
                                      'assets/images/image_4.png',
                                      fit: BoxFit.cover,
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25),
                                  ),
                                  SizedBox(height: 15),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25),
                                    child: Container(
                                      child: Row(
                                        textDirection: TextDirection.rtl,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          AutoSizeText(
                                            '$price',
                                            textDirection: TextDirection.rtl,
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.red,
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          AutoSizeText(
                                            'ريال',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: mPrimaryArabicFont,
                                              color: Colors.black,
                                            ),
                                            textDirection: TextDirection.rtl,
                                          ),
                                          SizedBox(width: 10),
                                          Container(
                                            height: 30,
                                            width: 1,
                                            color: mPrimaryColor,
                                          ),
                                          SizedBox(width: 10),
                                          AutoSizeText(
                                            'عدد الحصص',
                                            textDirection: TextDirection.rtl,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: mPrimaryArabicFont,
                                            ),
                                          ),
                                          SizedBox(width: 5),
                                          AutoSizeText(
                                            '$classCount',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.red,
                                            ),
                                            textDirection: TextDirection.rtl,
                                          ),
                                          SizedBox(width: 10),
                                          Container(
                                            height: 30,
                                            width: 1,
                                            color: mPrimaryColor,
                                          ),
                                          SizedBox(width: 10),
                                          Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.black,
                                                width: 0.5,
                                              ),
                                            ),
                                            child: AutoSizeText(
                                              '$subDays يوم ',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.red,
                                                fontFamily: mPrimaryArabicFont,
                                              ),
                                              textAlign: TextAlign.center,
                                              textDirection: TextDirection.rtl,
                                            ),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                          ),
                                        ],
                                      ),
                                      color: mPrimaryColor.withOpacity(0.07),
                                      height: 50,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 0.5,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: AutoSizeText(
                                      'شروط الإشتراك :',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: mPrimaryArabicFont,
                                      ),
                                      textDirection: TextDirection.rtl,
                                    ),
                                    width: double.infinity,
                                    height: 60,
                                    padding: const EdgeInsets.all(10),
                                  ),
                                  SizedBox(height: 20),
                                  SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Container(
                                        child: AutoSizeText(
                                          '${conditions.toString().trim()}',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: mPrimaryArabicFont,
                                          ),
                                          textDirection: TextDirection.rtl,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: AutoSizeText(
                                      'إختر المدرب',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontFamily: mPrimaryArabicFont,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Column(
                                    textDirection: TextDirection.rtl,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.black,
                                            width: 0.5,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                          ),
                                          child: DropdownButtonHideUnderline(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              textDirection: TextDirection.rtl,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    width: double.infinity,
                                                    child: DropdownButton(
                                                      iconSize: 0,
                                                      items: _cubit
                                                          .trainersModel!.data!
                                                          .map(
                                                        (s) {
                                                          trainers.add({
                                                            'name': s.name,
                                                            'id': s.id
                                                          });
                                                          return DropdownMenuItem(
                                                            value: s.name,
                                                            child: Container(
                                                              child:
                                                                  AutoSizeText(
                                                                s.name!,
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                textDirection:
                                                                    TextDirection
                                                                        .rtl,
                                                                maxLines: 1,
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      mPrimaryArabicFont,
                                                                  fontSize: 15,
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ).toList(),
                                                      value: _cubit
                                                          .selectedTrainner,
                                                      onChanged: (value) {
                                                        _cubit.selecteTrainner(
                                                          value,
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 40),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20, left: 20, bottom: 50),
                                      child: Container(
                                        child: MaterialButton(
                                          onPressed: () {
                                            var newList = trainers.where(
                                                (element) =>
                                                    element['name'] ==
                                                    _cubit.selectedTrainner);

                                            print(id);
                                            print(newList.first['id']);
                                            _cubit.packageRequest(
                                              attendAt: 'week_days',
                                              packageId: id,
                                              trainerId: newList.first['id'],
                                            );
                                          },
                                          child: state
                                                  is! CreatePackageRequestLoading
                                              ? AutoSizeText(
                                                  'إشترك الآن',
                                                  style: TextStyle(
                                                    fontFamily: 'Cairo',
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16,
                                                  ),
                                                )
                                              : Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                          color: Colors.white),
                                                ),
                                          color: Color(0xff7AB861),
                                        ),
                                        width: double.infinity,
                                        height: 50,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
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
      },
    );
  }
}
