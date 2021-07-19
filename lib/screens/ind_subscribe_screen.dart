import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:horse_app/bloc/home/cubit.dart';
import 'package:horse_app/bloc/home/states.dart';
import 'package:horse_app/constants/colors.dart';
import 'package:horse_app/constants/fonts.dart';
import 'package:horse_app/constants/keys.dart';
import 'package:horse_app/helpers/shared_helper_Screen.dart';
import 'package:horse_app/screens/ind_reservations_list_screen.dart';
import 'package:intl/intl.dart';
import 'dart:ui' as ui;

import 'package:transitioner/transitioner.dart';

import 'notification_screen.dart';

class IndSubscribeScreen extends StatelessWidget {
  final indReservationId;
  final name;

  final _formKey = GlobalKey<FormState>();
  final _dateteController = TextEditingController();

  IndSubscribeScreen({
    Key? key,
    required this.indReservationId,
    required this.name,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(indReservationId);
    print(name);
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is PostSubscribIndSuccess) {
          Fluttertoast.showToast(
            msg: "تم إرسال الطلب بنجاح",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          _dateteController.text = '';
        }
        if (state is PostSubscribIndError) {
          Fluttertoast.showToast(
            msg: "حدث خطأ ما، الرجاء إعاده المحاوله",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 5,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
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
                    if (_cubit.notificationModel != null)
                      if (_cubit.notificationModel!.data!
                              .where((element) => element.seen == '0')
                              .length !=
                          0)
                        Positioned(
                          right: 7,
                          top: 7,
                          child: Container(
                            // padding: const EdgeInsets.all(2),
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(30),
                              // border: Border.all(
                              //   color: Color(0xff707070),
                              // ),
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
          body: SingleChildScrollView(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: LayoutBuilder(
                    builder: (context, constraint) {
                      return Column(
                        textDirection: ui.TextDirection.rtl,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: IconButton(
                                    onPressed: () {
                                      Transitioner(
                                        context: context,
                                        child: IndReservationListScreen(),
                                        animation: AnimationType
                                            .fadeIn, // Optional value
                                        duration: Duration(
                                            milliseconds:
                                                300), // Optional value
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
                                    'إشتراك فردي جديد',
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
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              textDirection: ui.TextDirection.rtl,
                              children: [
                                Container(
                                  color: Colors.black,
                                  width: double.infinity,
                                  height: 50,
                                  child: Center(
                                    child: AutoSizeText(
                                      '$name',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontFamily: mPrimaryArabicFont,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textDirection: ui.TextDirection.rtl,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 30),
                                Form(
                                  key: _formKey,
                                  child: Column(
                                    textDirection: ui.TextDirection.rtl,
                                    children: [
                                      Row(
                                        textDirection: ui.TextDirection.rtl,
                                        children: [
                                          AutoSizeText(
                                            'التاريخ',
                                            textDirection: ui.TextDirection.rtl,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: mPrimaryArabicFont,
                                            ),
                                          ),
                                          SizedBox(width: 45),
                                          Expanded(
                                            child: Container(
                                              child: TextFormField(
                                                controller: _dateteController,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'هذا الحقل مطلوب';
                                                  }
                                                },
                                                onTap: () {
                                                  showDatePicker(
                                                          context: context,
                                                          initialDate:
                                                              DateTime.now(),
                                                          firstDate:
                                                              DateTime.now(),
                                                          lastDate:
                                                              DateTime(2222))
                                                      .then((value) =>
                                                          _dateteController
                                                              .text = DateFormat(
                                                                  'yyyy-MM-dd')
                                                              .format(value!));
                                                },
                                                textInputAction:
                                                    TextInputAction.done,
                                                keyboardType:
                                                    TextInputType.number,
                                                decoration:
                                                    const InputDecoration(
                                                  border: OutlineInputBorder(),
                                                ),
                                              ),
                                              width: double.infinity,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      Row(
                                        textDirection: ui.TextDirection.rtl,
                                        children: [
                                          AutoSizeText(
                                            'الوقت',
                                            textDirection: ui.TextDirection.rtl,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: mPrimaryArabicFont,
                                            ),
                                          ),
                                          SizedBox(width: 45),
                                          Expanded(
                                            child: Container(
                                              width: double.infinity,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.black
                                                      .withOpacity(0.6),
                                                  width: 0.5,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(3),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 20,
                                                ),
                                                child:
                                                    DropdownButtonHideUnderline(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    textDirection:
                                                        ui.TextDirection.rtl,
                                                    children: [
                                                      Expanded(
                                                        child: Container(
                                                          child: DropdownButton(
                                                            iconSize: 0,
                                                            items: _cubit
                                                                .timeList
                                                                .map(
                                                              (s) {
                                                                return DropdownMenuItem(
                                                                  value: s,
                                                                  child: Row(
                                                                    children: [
                                                                      AutoSizeText(
                                                                        "$s مساء",
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        textDirection: ui
                                                                            .TextDirection
                                                                            .rtl,
                                                                        maxLines:
                                                                            1,
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              mPrimaryArabicFont,
                                                                          fontSize:
                                                                              15,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            ).toList(),
                                                            value: _cubit
                                                                .selectedTime,
                                                            onChanged: (value) {
                                                              _cubit
                                                                  .selecteTime(
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
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 40),
                                      MaterialButton(
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            _cubit.subscribeInd(
                                              userId: SharedHelper.getCacheData(
                                                  key: TOKEN),
                                              indReservationId:
                                                  indReservationId,
                                              date: _dateteController.text,
                                              time: _cubit.selectedTime
                                                      .toString()
                                                      .padLeft(2, '0') +
                                                  ":00:00",
                                            );
                                          }
                                        },
                                        child: state is! PostSubscribIndLoading
                                            ? Text(
                                                'إرسال الطلب',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Cairo',
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              )
                                            : Center(
                                                child:
                                                    CircularProgressIndicator(
                                                        color: Colors.white)),
                                        color: Color(0xff7AB861),
                                        minWidth: double.infinity,
                                        height: 50,
                                      )
                                    ],
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                  ),
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
          ),
        );
      },
    );
  }
}
