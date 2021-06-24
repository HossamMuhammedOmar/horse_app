import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:horse_app/bloc/home/cubit.dart';
import 'package:horse_app/bloc/home/states.dart';
import 'package:horse_app/constants/colors.dart';
import 'package:horse_app/constants/fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        HomeCubit _cubit = HomeCubit.get(context);
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Container(
            height: 75.0,
            width: 75.0,
            child: FittedBox(
              child: FloatingActionButton(
                elevation: 0,
                backgroundColor: Colors.white,
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Image.asset('assets/images/home.png'),
                ),
              ),
            ),
          ),
          bottomNavigationBar: Container(
            height: 85,
            child: BottomAppBar(
              color: mPrimaryColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print('Contact Us');
                      },
                      child: Image.asset(
                        'assets/images/mail_bulk.png',
                        width: 35,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print('Account Info');
                      },
                      child: Image.asset(
                        'assets/images/chalkboard.png',
                        width: 35,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/bg.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Stack(
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
                                  '1',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          'assets/images/logo.png',
                          width: 150,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100.0),
                          child: Image.asset(
                            'assets/images/hore_image.jpeg',
                            width: 70,
                          ),
                        ),
                      ],
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'إشتراك ',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: mPrimaryArabicFont,
                          color: mPrimaryColor,
                        ),
                        children: const <TextSpan>[
                          TextSpan(
                            text: 'فعال',
                            style: TextStyle(
                              color: Color(0xff079606),
                            ),
                          ),
                          TextSpan(text: ' ( 10 )'),
                          TextSpan(text: ' '),
                          TextSpan(text: ' إشتراك '),
                          TextSpan(
                            text: 'منتهي ',
                            style: TextStyle(
                              color: Color(0xffEE1313),
                            ),
                          ),
                          TextSpan(text: '( 0 )'),
                        ],
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      width: double.infinity,
                      height: 0.5,
                      color: Color(0xff707070),
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Colors.grey.withOpacity(0.9),
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: DecoratedBox(
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(3.0),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(
                              iconEnabledColor: mPrimaryColor,
                              items: _cubit.service.map(
                                (s) {
                                  return DropdownMenuItem(
                                    value: s,
                                    child: Container(
                                      child: AutoSizeText(
                                        s,
                                        maxLines: 1,
                                        style: TextStyle(
                                          color: mPrimaryColor,
                                          fontFamily: mPrimaryArabicFont,
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ).toList(),
                              value: _cubit.selectedService,
                              onChanged: (value) {
                                _cubit.selecteService(value.toString());
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
