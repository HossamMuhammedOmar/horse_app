import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horse_app/bloc/home/cubit.dart';
import 'package:horse_app/bloc/home/states.dart';
import 'package:horse_app/constants/colors.dart';
import 'package:horse_app/constants/fonts.dart';
import 'package:horse_app/screens/home_screen.dart';
import 'package:transitioner/transitioner.dart';

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
                padding: const EdgeInsets.symmetric(vertical: 10),
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
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        AutoSizeText(
                                          'هنا الشروط لكن مازالت هناك مشكله في الapi',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: mPrimaryArabicFont,
                                          ),
                                          textDirection: TextDirection.rtl,
                                        ),
                                        SizedBox(width: 10),
                                        Container(
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                            color: mPrimaryColor,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                      ],
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
                                                DropdownButton(
                                                  iconSize: 0,
                                                  items: _cubit
                                                      .trainersModel!.data!
                                                      .map(
                                                    (s) {
                                                      return DropdownMenuItem(
                                                        value: s.name,
                                                        child: Container(
                                                          child: AutoSizeText(
                                                            s.name!
                                                                .trim()
                                                                .toString(),
                                                            textAlign:
                                                                TextAlign.start,
                                                            textDirection:
                                                                TextDirection
                                                                    .rtl,
                                                            maxLines: 1,
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  mPrimaryArabicFont,
                                                              fontSize: 15,
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).toList(),
                                                  value:
                                                      _cubit.selectedTrainner,
                                                  onChanged: (value) {
                                                    _cubit
                                                        .selecteTrainner(value);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Radio(
                                              value: 'حر',
                                              groupValue:
                                                  _cubit.colorGroupValue,
                                              onChanged: (val) {
                                                _cubit.changeRadio(val);
                                              },
                                            ),
                                            SizedBox(width: 10),
                                            AutoSizeText(
                                              'حر ( يمكنك الحضور في اي وقت للإسطبل )',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: mPrimaryArabicFont,
                                              ),
                                            ),
                                          ],
                                          textDirection: TextDirection.rtl,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                        ),
                                        Row(
                                          children: [
                                            Radio(
                                              value: 'تحديد أيام',
                                              groupValue:
                                                  _cubit.colorGroupValue,
                                              onChanged: (val) {
                                                _cubit.changeRadio(val);
                                              },
                                            ),
                                            AutoSizeText(
                                              'تحديد أيام',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: mPrimaryArabicFont,
                                              ),
                                            ),
                                          ],
                                          textDirection: TextDirection.rtl,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: mPrimaryColor,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: AutoSizeText(
                                      'الحسابات البنكيه',
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
                                  SizedBox(height: 25),
                                  Image.asset('assets/images/group_56843.jpg'),
                                  SizedBox(height: 30),
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
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Column(
                                      children: [
                                        AutoSizeText(
                                          'أرفق صوره التحويل',
                                          style: TextStyle(
                                            fontFamily: mPrimaryArabicFont,
                                            fontSize: 18,
                                            color: Color(0xffC10002),
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        Image.asset('assets/images/choose.jpg'),
                                      ],
                                      textDirection: TextDirection.rtl,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                    ),
                                  ),
                                  SizedBox(height: 40),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 20, left: 20, bottom: 50),
                                      child: Container(
                                        child: MaterialButton(
                                          onPressed: () {},
                                          child: AutoSizeText(
                                            'إشترك الآن',
                                            style: TextStyle(
                                              fontFamily: 'Cairo',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
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
