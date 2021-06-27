import 'dart:async';
import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:horse_app/constants/keys.dart';
import 'package:horse_app/helpers/shared_helper_Screen.dart';
import 'package:horse_app/screens/home_screen.dart';
import '../constants/colors.dart';
import 'package:transitioner/transitioner.dart';
import 'on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  startTime() async {
    var duration = new Duration(seconds: 3);
    return new Timer(duration, route);
  }

  route() {
    Transitioner(
      context: context,
      child: SharedHelper.getCacheData(key: TOKEN) == null
          ? OnBoardingScreen()
          : HomeScreen(),
      animation: AnimationType.fadeIn, // Optional value
      duration: Duration(milliseconds: 1000), // Optional value
      replacement: true, // Optional value
      curveType: CurveType.decelerate, // Optional value
    );
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => OnBoardingScreen(),
    //   ),
    // );
  }
}

initScreen(BuildContext context) {
  return Scaffold(
    body: Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            'assets/images/bg.jpg',
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        LayoutBuilder(
          builder: (context, constraint) {
            double localHeight = constraint.maxHeight;
            double localWidth = constraint.maxWidth;
            return Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  Container(
                    width: localWidth,
                    height: localHeight / 3.9,
                    child: Image.asset(
                      'assets/images/logo.png',
                      filterQuality: FilterQuality.high,
                    ),
                  ),
                  AutoSizeText(
                    'مرحباً بكم...',
                    maxLines: 1,
                    style: TextStyle(
                      fontFamily: 'NotoKufiArabic',
                      fontSize: 30,
                      color: mPrimaryColor,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                  AutoSizeText(
                    'في اسطبل العساكر',
                    maxLines: 1,
                    style: TextStyle(
                      fontFamily: 'NotoKufiArabic',
                      fontSize: 30,
                      color: mPrimaryColor,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ],
              ),
            );
          },
        ),
      ],
    ),
  );
}
