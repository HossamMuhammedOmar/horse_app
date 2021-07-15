import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horse_app/bloc/home/cubit.dart';
import 'package:horse_app/bloc/home/states.dart';
import 'package:horse_app/constants/colors.dart';
import 'package:horse_app/constants/fonts.dart';
import 'package:horse_app/screens/new_attend_screen.dart';
import 'package:horse_app/screens/subscribe_detail.dart';
import 'package:transitioner/transitioner.dart';
import 'notification_screen.dart';
import 'trainer_reservation_list_screen.dart';

class AttendDetail extends StatelessWidget {
  final name;
  final classCount;
  final classR;
  final startDate;
  final endDate;
  final List? attends;
  final trainerName;

  const AttendDetail({
    this.name,
    this.classCount,
    this.classR,
    this.startDate,
    this.endDate,
    this.attends,
    this.trainerName,
  });
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
                                      child: SubscribeDetail(
                                        name: name,
                                        classCount: classCount,
                                        classR: classR,
                                        startDate: startDate,
                                        endDate: endDate,
                                        attends: attends,
                                      ),
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
                                  'جميع طلبات حضور الحصص التدريبية',
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
                        Expanded(
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: MaterialButton(
                                  onPressed: () {
                                    Transitioner(
                                      context: context,
                                      child: NewAttendScreen(
                                        name: name,
                                        classCount: classCount,
                                        classR: classR,
                                        startDate: startDate,
                                        endDate: endDate,
                                        attends: attends,
                                        trainerName: trainerName,
                                      ),
                                      animation: AnimationType.fadeIn,
                                      duration: Duration(milliseconds: 300),
                                      replacement: true,
                                      curveType: CurveType.decelerate,
                                    );
                                  },
                                  color: Color(0xff30A401),
                                  minWidth: double.infinity,
                                  height: 50,
                                  child: Text(
                                    'طلب حضور جديد',
                                    style: TextStyle(
                                      fontFamily: 'Cairo',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  width: double.infinity,
                                  child: Center(
                                    child: AutoSizeText(
                                      'المتبقي لديك من الحصص التدريبية ( $classR )  يمكنك الغاء الحضور اخر موعد قبل الحضور بـ 5 ساعات ',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontFamily: 'Cairo',
                                      ),
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                    color: Color(0xffD1E7DD),
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                              ),
                              SizedBox(height: 20),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    width: 1200,
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          'assets/images/attends_detail.png',
                                          width: 1200,
                                        ),
                                        Expanded(
                                          child: Container(
                                            height: double.infinity,
                                            // height: 500,
                                            child: ListView.builder(
                                              itemBuilder: (context, index) =>
                                                  _buildItem(
                                                attends![index],
                                                context,
                                              ),
                                              itemCount: attends!.length,
                                            ),
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
        );
      },
    );
  }

  Widget _buildItem(item, context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xffDEE2E6),
            ),
          ),
          child: Text(
            '${item.day}',
            maxLines: 1,
            textDirection: TextDirection.rtl,
            // style: TextStyle(
            //   fontFamily: mPrimaryArabicFont,
            // ),
          ),
          width: 140,
          height: 50,
          padding: const EdgeInsets.all(14),
        ),
        Container(
          width: 165,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffDEE2E6)),
          ),
          child: Text(
            '${item.date.toString().substring(0, 10)}',
            maxLines: 1,
            textDirection: TextDirection.rtl,
          ),
          padding: const EdgeInsets.all(10),
        ),
        Container(
          width: 152,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffDEE2E6)),
          ),
          child: Text(
            '${item.time}',
            textDirection: TextDirection.rtl,
          ),
          padding: const EdgeInsets.all(15),
        ),
        Container(
          width: 253,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffDEE2E6)),
          ),
          child: Text(
            '$trainerName',
            style: TextStyle(),
            textDirection: TextDirection.rtl,
          ),
          padding: const EdgeInsets.all(15),
        ),
        Container(
          width: 450,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffDEE2E6)),
          ),
          child: Text(
            '${item.statueAr}',
            style: TextStyle(
              fontFamily: '29ltbukrabold',
              fontWeight: FontWeight.normal,
              fontSize: 12,
            ),
            maxLines: 1,
            textDirection: TextDirection.rtl,
          ),
          padding: const EdgeInsets.all(15),
        ),
      ],
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.start,
    );
  }
}
