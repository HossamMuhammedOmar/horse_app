import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:horse_app/bloc/home/cubit.dart';
import 'package:horse_app/bloc/home/states.dart';
import 'package:horse_app/constants/colors.dart';
import 'package:horse_app/constants/fonts.dart';
import 'package:horse_app/screens/attend_detail.dart';
import 'package:intl/intl.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:transitioner/transitioner.dart';
import 'package:flutter/material.dart' as ui;
import 'notification_screen.dart';
import 'profile_screen.dart';

class NewAttendScreen extends StatelessWidget {
  final id;

  const NewAttendScreen({
    this.id,
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is SendNewAttendSuccess) {
          Fluttertoast.showToast(
            msg: "تم الإرسال بنجاح",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0,
          );
          HomeCubit.get(context).getSubDetail();
          Transitioner(
            context: context,
            child: AttendDetail(
              id: id,
            ),
            animation: AnimationType.fadeIn, // Optional value
            duration: Duration(milliseconds: 300), // Optional value
            replacement: true, // Optional value
            curveType: CurveType.decelerate, // Optional value
          );
        }
        if (state is SendNewAttendError) {
          Fluttertoast.showToast(
            msg: "فشل الإرسال، الرجاء إعاده المحاوله",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        }
      },
      builder: (context, state) {
        HomeCubit _cubit = HomeCubit.get(context);

        return state is! GetSubscribeDetailLoading
            ? Scaffold(
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
                            duration:
                                Duration(milliseconds: 300), // Optional value
                            replacement: true, // Optional value
                            curveType: CurveType.decelerate, // Optional value
                          );
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 40.0,
                          child: ClipRRect(
                            child: Image.network(
                              '${_cubit.profileModel!.data!.photo}',
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
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
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
                                            child: AttendDetail(
                                              id: id,
                                            ),
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Center(
                                      child: AutoSizeText(
                                        'إرسال طلب حضور حصة تدريبية',
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  width: double.infinity,
                                  height: 0.5,
                                  color: Color(0xff707070),
                                ),
                              ),
                              SizedBox(height: 20),
                              Expanded(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        width: double.infinity,
                                        child: Center(
                                          child: AutoSizeText(
                                            'الايام الغير متاحة ( الاحد )',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Cairo',
                                            ),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          color: Color(0xffa0ebfa),
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 10),
                                        width: double.infinity,
                                        child: Center(
                                          child: AutoSizeText(
                                            'تنبية : يمكنك أرسال الطلب قبل الحضور بـ 24 ساعة',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                          color: Color(0xffDC3545),
                                          borderRadius:
                                              BorderRadius.circular(3),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    state is! SendNewAttendLoading
                                        ? Expanded(
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              // width: 200,
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      height: double.infinity,
                                                      // height: 500,
                                                      child: ListView.separated(
                                                        physics:
                                                            BouncingScrollPhysics(),
                                                        itemBuilder:
                                                            (context, index) =>
                                                                _buildItem(
                                                          context,
                                                          _cubit,
                                                        ),
                                                        itemCount: _cubit
                                                            .subscribeDetails!
                                                            .data
                                                            .where((element) =>
                                                                element.id ==
                                                                id)
                                                            .first
                                                            .subscription
                                                            .info!
                                                            .restClassCount,
                                                        separatorBuilder:
                                                            (context, index) =>
                                                                SizedBox(
                                                                    height: 40),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        : LoadingRotating.square(
                                            backgroundColor: mPrimaryColor,
                                          ),
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  textDirection: ui.TextDirection.rtl,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            : Scaffold(
                body: Center(
                  child: Image.asset('assets/images/loading.gif'),
                ),
              );
      },
    );
  }

  Widget _buildItem(context, HomeCubit _cubit) {
    final _formKey = GlobalKey<FormState>();
    final _dateteController = TextEditingController();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 27.0),
            child: MaterialButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _cubit.sendNewAttend(
                    date: _dateteController.text,
                    time: _cubit.subSelectedTime,
                    subId: _cubit.subscribeDetails!.data
                        .where((element) => element.id == id)
                        .first
                        .subscription
                        .info!
                        .id,
                    trainerId: _cubit.subscribeDetails!.data
                        .where((element) => element.id == id)
                        .first
                        .trainer
                        .id,
                  );
                }
              },
              child: Text(
                'إرسال',
                style: TextStyle(fontFamily: mPrimaryArabicFont),
              ),
              color: Color(0xff25b16f),
              textColor: Colors.white,
            ),
          ),
          SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: ui.TextDirection.rtl,
            children: [
              Text(
                'الوقت',
                textDirection: ui.TextDirection.rtl,
                style: TextStyle(
                  fontFamily: mPrimaryArabicFont,
                ),
              ),
              Container(
                width: 100,
                height: 36,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black.withOpacity(0.6),
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(3),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: DropdownButtonHideUnderline(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      textDirection: ui.TextDirection.rtl,
                      children: [
                        Container(
                          child: DropdownButton(
                            iconSize: 0,
                            items: _cubit.subTimeList.map(
                              (s) {
                                return DropdownMenuItem(
                                  value: s,
                                  child: Row(
                                    children: [
                                      AutoSizeText(
                                        "$s مساء",
                                        textAlign: TextAlign.start,
                                        textDirection: ui.TextDirection.rtl,
                                        maxLines: 1,
                                        style: TextStyle(
                                          fontFamily: mPrimaryArabicFont,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ).toList(),
                            value: _cubit.subSelectedTime,
                            onChanged: (value) {
                              _cubit.subSelecteTime(
                                value,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 5),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            textDirection: ui.TextDirection.rtl,
            children: [
              Text(
                'اليوم',
                textDirection: ui.TextDirection.rtl,
                style: TextStyle(
                  fontFamily: mPrimaryArabicFont,
                ),
              ),
              Form(
                key: _formKey,
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
                              initialDate: DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2222))
                          .then((value) => _dateteController.text =
                              DateFormat('yyyy-MM-dd').format(value!));
                    },
                    readOnly: true,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                  width: 120,
                  height: 36,
                ),
              ),
            ],
          )
        ],
        textDirection: ui.TextDirection.rtl,
        mainAxisAlignment: MainAxisAlignment.start,
      ),
    );
  }
}
