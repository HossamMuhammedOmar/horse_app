import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horse_app/bloc/home/cubit.dart';
import 'package:horse_app/bloc/home/states.dart';
import 'package:horse_app/constants/colors.dart';
import 'package:horse_app/constants/fonts.dart';
import 'package:transitioner/transitioner.dart';
import 'profile_screen.dart';
import 'trainer_reservation_list_screen.dart';

class TrainerSubscribeFollow extends StatelessWidget {
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
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
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
                                  'اشتراكات المدربين',
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
                        state is! GetMySubscribTrainerLoading
                            ? Expanded(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: MaterialButton(
                                        onPressed: () {
                                          Transitioner(
                                            context: context,
                                            child:
                                                TrainerReservationListScreen(),
                                            animation: AnimationType.fadeIn,
                                            duration:
                                                Duration(milliseconds: 300),
                                            replacement: true,
                                            curveType: CurveType.decelerate,
                                          );
                                        },
                                        color: Color(0xff30A401),
                                        minWidth: double.infinity,
                                        height: 50,
                                        child: Text(
                                          'طلب إشتراك جديد',
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
                                    Expanded(
                                      child: SingleChildScrollView(
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          width: 1200,
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                'assets/images/trainer_row.png',
                                                width: 1200,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  height: double.infinity,
                                                  // height: 500,
                                                  child: ListView.builder(
                                                    itemBuilder: (context,
                                                            index) =>
                                                        _buildItem(_cubit
                                                            .myTrainerSubscribeModel!
                                                            .data![index]),
                                                    itemCount: _cubit
                                                        .myTrainerSubscribeModel!
                                                        .data!
                                                        .length,
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
                              )
                            : Center(
                                child: CircularProgressIndicator(
                                    color: mPrimaryColor),
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

  Widget _buildItem(item) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xffDEE2E6),
            ),
          ),
          child: Text(
            '${item.statueAr}',
            maxLines: 1,
            textDirection: TextDirection.rtl,
            // style: TextStyle(
            //   fontFamily: mPrimaryArabicFont,
            // ),
          ),
          width: 116,
          padding: const EdgeInsets.all(14),
        ),
        Container(
          width: 236,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffDEE2E6)),
          ),
          child: Text(
            '${item.trainer.name}',
            style: TextStyle(
              fontFamily: mPrimaryArabicFont,
            ),
            textDirection: TextDirection.rtl,
          ),
          padding: const EdgeInsets.all(10),
        ),
        Container(
          width: 137,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffDEE2E6)),
          ),
          child: Text(
            '${item.dateFrom.toString().substring(0, 10)}',
            style: TextStyle(),
            textDirection: TextDirection.rtl,
          ),
          padding: const EdgeInsets.all(15),
        ),
        Container(
          width: 141,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffDEE2E6)),
          ),
          child: Text(
            '${item.dateTo.toString().substring(0, 10)}',
            style: TextStyle(),
            textDirection: TextDirection.rtl,
          ),
          padding: const EdgeInsets.all(15),
        ),
        Container(
          width: 118,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffDEE2E6)),
          ),
          child: Text(
            '${item.timeFrom}',
            style: TextStyle(),
            textDirection: TextDirection.rtl,
          ),
          padding: const EdgeInsets.all(15),
        ),
        Container(
          width: 139,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffDEE2E6)),
          ),
          child: Text(
            '${item.timeTo}',
            style: TextStyle(),
            textDirection: TextDirection.rtl,
          ),
          padding: const EdgeInsets.all(15),
        ),
        Container(
          width: 147,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffDEE2E6)),
          ),
          child: Text(
            '4',
            style: TextStyle(),
            textDirection: TextDirection.rtl,
          ),
          padding: const EdgeInsets.all(15),
        ),
        Container(
          width: 125,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffDEE2E6)),
          ),
          child: MaterialButton(
            onPressed: () {},
            child: Text(
              'بيانات الدفع',
              style: TextStyle(
                fontFamily: mPrimaryArabicFont,
                color: Colors.white,
              ),
              textDirection: TextDirection.rtl,
            ),
            color: Color(0xff0E6EFD),
            height: 20,
            padding: const EdgeInsets.all(0),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
        ),
      ],
      textDirection: TextDirection.rtl,
      mainAxisAlignment: MainAxisAlignment.start,
    );
  }
}
