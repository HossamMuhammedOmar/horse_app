import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horse_app/bloc/home/cubit.dart';
import 'package:horse_app/bloc/home/states.dart';
import 'package:horse_app/constants/colors.dart';
import 'package:horse_app/constants/fonts.dart';
import 'package:horse_app/screens/attend_detail.dart';
import 'package:horse_app/screens/payment_sub_detail.dart';
import 'package:horse_app/screens/subscribe_screen.dart';
import 'package:transitioner/transitioner.dart';
import 'notification_screen.dart';
import 'profile_screen.dart';

class SubscribeDetail extends StatelessWidget {
  final id;

  const SubscribeDetail({
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
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
                                            child: SubscibeScreen(),
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
                                        'تفاصيل الإشتراك',
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
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          width: 1300,
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                'assets/images/sub_detail.png',
                                              ),
                                              Container(
                                                // height: 500,
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color:
                                                              Color(0xffDEE2E6),
                                                        ),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          '${_cubit.subscribeDetails!.data.where((element) => element.id == id).first.package.title}',
                                                          maxLines: 1,
                                                          textDirection:
                                                              TextDirection.rtl,
                                                          textAlign:
                                                              TextAlign.start,
                                                          // style: TextStyle(
                                                          //   fontFamily: mPrimaryArabicFont,
                                                          // ),
                                                        ),
                                                      ),
                                                      width: 371,
                                                      height: 60,
                                                      padding:
                                                          const EdgeInsets.all(
                                                              14),
                                                    ),
                                                    Container(
                                                      height: 60,
                                                      width: 164,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Color(
                                                                0xffDEE2E6)),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          '${_cubit.subscribeDetails!.data.where((element) => element.id == id).first.package.classCount}',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                mPrimaryArabicFont,
                                                          ),
                                                          textDirection:
                                                              TextDirection.rtl,
                                                        ),
                                                      ),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                    ),
                                                    Container(
                                                      width: 193,
                                                      height: 60,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Color(
                                                                0xffDEE2E6)),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          '${_cubit.subscribeDetails!.data.where((element) => element.id == id).first.subscription.info!.restClassCount}',
                                                          style: TextStyle(),
                                                          textDirection:
                                                              TextDirection.rtl,
                                                        ),
                                                      ),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              15),
                                                    ),
                                                    Container(
                                                      width: 135,
                                                      height: 60,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Color(
                                                                0xffDEE2E6)),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          '${_cubit.subscribeDetails!.data.where((element) => element.id == id).first.subscription.info!.startIn.toString().substring(0, 10)}',
                                                          maxLines: 1,
                                                          style: TextStyle(),
                                                          textDirection:
                                                              TextDirection.rtl,
                                                        ),
                                                      ),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              15),
                                                    ),
                                                    Container(
                                                      height: 60,
                                                      width: 140,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Color(
                                                                0xffDEE2E6)),
                                                      ),
                                                      child: Center(
                                                        child: Text(
                                                          '${_cubit.subscribeDetails!.data.where((element) => element.id == id).first.subscription.info!.endIn.toString().substring(0, 10)}',
                                                          style: TextStyle(),
                                                          textDirection:
                                                              TextDirection.rtl,
                                                        ),
                                                      ),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              15),
                                                    ),
                                                    Container(
                                                      width: 117,
                                                      height: 60,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Color(
                                                                0xffDEE2E6)),
                                                      ),
                                                      child: Center(
                                                        child: MaterialButton(
                                                          onPressed: () {
                                                            Transitioner(
                                                              context: context,
                                                              child:
                                                                  PaymentSubDetail(
                                                                id: id,
                                                              ),
                                                              animation:
                                                                  AnimationType
                                                                      .fadeIn, // Optional value
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      300), // Optional value
                                                              replacement:
                                                                  true, // Optional value
                                                              curveType: CurveType
                                                                  .decelerate, // Optional value
                                                            );
                                                          },
                                                          child: Text(
                                                            'عرض',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  mPrimaryArabicFont,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            textDirection:
                                                                TextDirection
                                                                    .rtl,
                                                          ),
                                                          color:
                                                              Color(0xff0E6EFD),
                                                          height: 20,
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(0),
                                                        ),
                                                      ),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              15),
                                                    ),
                                                    Container(
                                                      width: 140,
                                                      height: 60,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color: Color(
                                                                0xffDEE2E6)),
                                                      ),
                                                      child: Center(
                                                        child: MaterialButton(
                                                          onPressed: () {
                                                            Transitioner(
                                                              context: context,
                                                              child:
                                                                  AttendDetail(
                                                                id: id,
                                                              ),
                                                              animation:
                                                                  AnimationType
                                                                      .fadeIn, // Optional value
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      300), // Optional value
                                                              replacement:
                                                                  true, // Optional value
                                                              curveType: CurveType
                                                                  .decelerate, // Optional value
                                                            );
                                                          },
                                                          child: Text(
                                                            'عرض',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  mPrimaryArabicFont,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            textDirection:
                                                                TextDirection
                                                                    .rtl,
                                                          ),
                                                          color:
                                                              Color(0xff0E6EFD),
                                                          height: 20,
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(0),
                                                        ),
                                                      ),
                                                      padding:
                                                          const EdgeInsets.all(
                                                              15),
                                                    ),
                                                  ],
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        scrollDirection: Axis.horizontal,
                                        reverse: true,
                                      ),
                                    ),
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  textDirection: TextDirection.rtl,
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
}
