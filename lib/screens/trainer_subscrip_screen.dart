import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:horse_app/bloc/home/cubit.dart';
import 'package:horse_app/bloc/home/states.dart';
import 'package:horse_app/constants/keys.dart';
import 'package:horse_app/helpers/shared_helper_Screen.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:horse_app/constants/colors.dart';
import 'package:horse_app/constants/fonts.dart';
import 'package:horse_app/screens/trainer_reservation_list_screen.dart';
import 'package:transitioner/transitioner.dart';
import 'dart:ui' as ui;

import 'notification_screen.dart';
import 'profile_screen.dart';

class TrainerSubscribeScreen extends StatelessWidget {
  final id;
  final name;

  const TrainerSubscribeScreen({Key? key, required this.id, required this.name})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _startDateController = TextEditingController();
    final _endDateController = TextEditingController();
    final _startTimeController = TextEditingController();
    final _endTimeController = TextEditingController();
    final _classCountController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is PostSubscribTrainerSuccess) {
          Fluttertoast.showToast(
            msg: "تم إرسال الطلب بنجاح",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          _startDateController.text = '';
          _endDateController.text = '';
          _startTimeController.text = '';
          _endTimeController.text = '';
          _classCountController.text = '';
        }
        if (state is PostSubscribTrainerError) {
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
                        children: [
                          Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: IconButton(
                                    onPressed: () {
                                      Transitioner(
                                        context: context,
                                        child: TrainerReservationListScreen(),
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
                                    'حجز مدرب جديد',
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
                                  color: Color(0xffEEA412),
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
                                            'عدد الحصص',
                                            textDirection: ui.TextDirection.rtl,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: mPrimaryArabicFont,
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          Expanded(
                                            child: Container(
                                              child: TextFormField(
                                                controller:
                                                    _classCountController,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'هذا الحقل مطلوب';
                                                  }
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
                                            'من تاريخ',
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
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'هذا الحقل مطلوب';
                                                  }
                                                },
                                                controller:
                                                    _startDateController,
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
                                                          _startDateController
                                                              .text = DateFormat(
                                                                  'yyyy-MM-dd')
                                                              .format(value!));
                                                },
                                                readOnly: true,
                                                keyboardType:
                                                    TextInputType.datetime,
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
                                            'إلي تاريخ',
                                            textDirection: ui.TextDirection.rtl,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: mPrimaryArabicFont,
                                            ),
                                          ),
                                          SizedBox(width: 40),
                                          Expanded(
                                            child: Container(
                                              child: TextFormField(
                                                controller: _endDateController,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'هذا الحقل مطلوب';
                                                  }
                                                },
                                                readOnly: true,
                                                keyboardType:
                                                    TextInputType.datetime,
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
                                                          _endDateController
                                                              .text = DateFormat(
                                                                  'yyyy-MM-dd')
                                                              .format(value!));
                                                },
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
                                      SizedBox(height: 30),
                                      Container(
                                        width: double.infinity,
                                        height: 0.5,
                                        color:
                                            Color(0xff707070).withOpacity(0.5),
                                      ),
                                      SizedBox(height: 20),
                                      Row(
                                        textDirection: ui.TextDirection.rtl,
                                        children: [
                                          AutoSizeText(
                                            'من الساعه',
                                            textDirection: ui.TextDirection.rtl,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: mPrimaryArabicFont,
                                            ),
                                          ),
                                          SizedBox(width: 30),
                                          Expanded(
                                            child: Container(
                                              child: TextFormField(
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'هذا الحقل مطلوب';
                                                  }
                                                },
                                                controller:
                                                    _startTimeController,
                                                onTap: () {
                                                  showTimePicker(
                                                    context: context,
                                                    initialTime:
                                                        TimeOfDay.now(),
                                                  ).then((value) {
                                                    final hours = value!.hour
                                                        .toString()
                                                        .padLeft(2, '0');
                                                    final minute = value.minute
                                                        .toString()
                                                        .padLeft(2, '0');
                                                    return _startTimeController
                                                            .text =
                                                        "$hours:$minute:00";
                                                  });
                                                },
                                                readOnly: true,
                                                keyboardType:
                                                    TextInputType.datetime,
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
                                            'إلي الساعه',
                                            textDirection: ui.TextDirection.rtl,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: mPrimaryArabicFont,
                                            ),
                                          ),
                                          SizedBox(width: 27),
                                          Expanded(
                                            child: Container(
                                              child: TextFormField(
                                                controller: _endTimeController,
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return 'هذا الحقل مطلوب';
                                                  }
                                                },
                                                readOnly: true,
                                                keyboardType:
                                                    TextInputType.datetime,
                                                onTap: () {
                                                  showTimePicker(
                                                    context: context,
                                                    initialTime:
                                                        TimeOfDay.now(),
                                                  ).then((value) {
                                                    final hours = value!.hour
                                                        .toString()
                                                        .padLeft(2, '0');
                                                    final minute = value.minute
                                                        .toString()
                                                        .padLeft(2, '0');
                                                    return _endTimeController
                                                            .text =
                                                        "$hours:$minute:00";
                                                  });
                                                },
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
                                      MaterialButton(
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            HomeCubit.get(context)
                                                .subscribeTrainer(
                                              studentId:
                                                  SharedHelper.getCacheData(
                                                      key: TOKEN),
                                              trainerId: id.toString(),
                                              dateFrom: _startDateController
                                                  .text
                                                  .toString(),
                                              dateTo: _endDateController.text
                                                  .toString(),
                                              timeFrom: _startTimeController
                                                  .text
                                                  .toString(),
                                              timeTo: _endTimeController.text
                                                  .toString(),
                                              classCount: _classCountController
                                                  .text
                                                  .toString(),
                                            );
                                          }
                                        },
                                        child: state
                                                is! PostSubscribTrainerLoading
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
