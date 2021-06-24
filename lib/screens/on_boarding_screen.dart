import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:horse_app/constants/colors.dart';
import 'package:horse_app/constants/fonts.dart';
import 'package:horse_app/constants/keys.dart';
import 'package:horse_app/helpers/shared_helper_Screen.dart';
import 'package:horse_app/models/on_boarding_model.dart';
import 'package:horse_app/screens/welcome_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:transitioner/transitioner.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final pageController = PageController();

  bool _isLastPage = false;

  // Helper Methods
  void submit() {
    SharedHelper.cacheData(key: ONBOARDING, value: true).then(
      (value) => {
        Transitioner(
          context: context,
          child: WelcomeScreen(),
          animation: AnimationType.slideTop, // Optional value
          duration: Duration(milliseconds: 1000), // Optional value
          replacement: true, // Optional value
          curveType: CurveType.elastic, // Optional value
        ),
        // Navigator.pushAndRemoveUntil(
        //   context,
        //   MaterialPageRoute(builder: (c) => LoginScreen()),
        //   (route) => false,
        // ),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<OnBoardingModel> onBoardingdata = [
      OnBoardingModel(
        imageUrl: 'assets/images/card1.jpg',
        title: 'متخصصون في اساسيات الفروسية والقفز',
        shortTitle: '',
        description: 'لدينا مهارات عالية في تدريب جميع الاعمار',
      ),
      OnBoardingModel(
        imageUrl: 'assets/images/card2.jpg',
        title: 'كن فارس المستقبل',
        shortTitle: 'حقق احلامك',
        description: 'نقوم بتدريب جميع الفئات العمرية والاطفال',
      ),
      OnBoardingModel(
        imageUrl: 'assets/images/card3.jpg',
        title: 'برامج تدريبيه وحصص خاصه',
        shortTitle: 'أختر برنامجك الآن',
        description:
            'يمكنك الآن حجز حصص خاصة أو الإشتراك بأحد البرامج التدريبية',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffFFFBF3),
        elevation: 0,
        leading: TextButton(
          onPressed: submit,
          child: AutoSizeText(
            'تخطي',
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.center,
            maxLines: 1,
            style: TextStyle(
              color: Colors.black,
              fontFamily: mPrimaryArabicFont,
            ),
          ),
        ),
        actions: [
          _isLastPage
              ? TextButton(
                  onPressed: submit,
                  child: AutoSizeText(
                    'إستمرار',
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.rtl,
                    maxLines: 1,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: mPrimaryArabicFont,
                    ),
                  ),
                )
              : Text(''),
        ],
      ),
      backgroundColor: Color(0xffFFFBF3),
      body: Padding(
        padding: const EdgeInsets.only(
          bottom: 30,
          right: 10,
          left: 10,
        ),
        child: LayoutBuilder(
          builder: (context, constraint) {
            double localHeight = constraint.maxHeight;
            double localWidth = constraint.maxWidth;
            return Column(
              textDirection: TextDirection.rtl,
              children: [
                Expanded(
                  child: PageView.builder(
                    onPageChanged: (int index) {
                      if (index == onBoardingdata.length - 1) {
                        setState(() {
                          _isLastPage = true;
                        });
                      } else {
                        setState(() {
                          _isLastPage = false;
                        });
                      }
                    },
                    controller: pageController,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            Container(
                              child: Image.asset(
                                '${onBoardingdata[index].imageUrl}',
                                width: localWidth,
                              ),
                              width: localWidth,
                              height: localHeight / 1.7,
                            ),
                            SizedBox(height: 20.0),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: AutoSizeText(
                                '${onBoardingdata[index].title}',
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontFamily: mPrimaryArabicFont,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            if (onBoardingdata[index].shortTitle.length == 0)
                              SizedBox(height: 0.0),
                            if (onBoardingdata[index].shortTitle.length != 0)
                              SizedBox(height: 15.0),
                            AutoSizeText(
                              '${onBoardingdata[index].shortTitle}',
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: mPrimaryArabicFont,
                                color: mPrimaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 15.0),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: AutoSizeText(
                                '${onBoardingdata[index].description}',
                                style: TextStyle(
                                  fontSize: 18.0,
                                ),
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.center,
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: onBoardingdata.length,
                  ),
                ),
                SizedBox(height: 40.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmoothPageIndicator(
                      controller: pageController,
                      count: onBoardingdata.length,
                      effect: JumpingDotEffect(
                        activeDotColor: mPrimaryColor,
                      ),
                    ),
                    // Spacer(),
                    // FloatingActionButton(
                    //   backgroundColor: mPrimaryColor,
                    //   onPressed: () {
                    //     if (_isLastPage) {
                    //       submit();
                    //     } else {
                    //       pageController.nextPage(
                    //         duration: Duration(milliseconds: 750),
                    //         curve: Curves.ease,
                    //       );
                    //     }
                    //   },
                    //   child: Icon(Icons.keyboard_arrow_right),
                    // )
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
