import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horse_app/bloc/home/cubit.dart';
import 'package:horse_app/bloc/home/states.dart';
import 'package:horse_app/constants/colors.dart';
import 'package:horse_app/constants/fonts.dart';
import 'package:transitioner/transitioner.dart';

import 'home_screen.dart';
import 'profile_screen.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit _cubit = HomeCubit.get(context);
        return state is! GetUserNotificationLoading
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
                    Image.asset(
                      'assets/images/bg.jpg',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10,
                      ),
                      child: LayoutBuilder(
                        builder: (context, constraint) {
                          return Column(
                            textDirection: TextDirection.rtl,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: IconButton(
                                        onPressed: () {
                                          _cubit.getUserNotification();
                                          Transitioner(
                                            context: context,
                                            child: HomeScreen(),
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
                                  SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Center(
                                      child: AutoSizeText(
                                        'الإشعارات',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: mPrimaryColor,
                                          fontFamily: mSecondArabicFont,
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
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 25),
                                    child: Container(
                                      child: ListView.separated(
                                        itemBuilder: (context, index) =>
                                            _buildItem(_cubit.notificationModel!
                                                .data![index]),
                                        separatorBuilder: (context, index) =>
                                            Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20),
                                          child: Container(
                                              width: 100,
                                              height: 1,
                                              color:
                                                  Colors.grey.withOpacity(0.3)),
                                        ),
                                        itemCount: _cubit
                                            .notificationModel!.data!.length,
                                      ),
                                      height: double.infinity,
                                    ),
                                  ),
                                ),
                              )
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

  Widget _buildItem(item) {
    return SingleChildScrollView(
      reverse: true,
      scrollDirection: Axis.horizontal,
      child: Container(
        child: Row(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              textDirection: TextDirection.rtl,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.rtl,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: mPrimaryColor.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  textDirection: TextDirection.rtl,
                  children: [
                    AutoSizeText(
                      '${item.content.toString().trim()}',
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: mPrimaryArabicFont,
                      ),
                    ),
                    SizedBox(height: 10),
                    AutoSizeText(
                      '${item.createdAt.toString().substring(0, 10)}',
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // if (item.seen == '0')
            //   Padding(
            //     padding: const EdgeInsets.only(top: 40),
            //     child: TextButton(
            //       child: AutoSizeText('تعليم كمقروء'),
            //       onPressed: () {
            //         print(item.id);
            //       },
            //     ),
            //   ),
          ],
          crossAxisAlignment: CrossAxisAlignment.center,
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      ),
    );
  }
}
