import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:horse_app/screens/login_screen.dart';
import 'package:horse_app/screens/register_screen.dart';
import 'package:horse_app/widgets/reusable_widgets.dart';
import 'package:transitioner/transitioner.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint) {
          return Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                child: Image.asset(
                  'assets/images/bg.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        width: 200,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      myPrimaryButton(
                        title: 'دخـــــول',
                        onClick: () {
                          Transitioner(
                            context: context,
                            child: LoginScreen(),
                            animation: AnimationType.fadeIn, // Optional value
                            duration:
                                Duration(milliseconds: 500), // Optional value
                            replacement: true, // Optional value
                            curveType: CurveType.decelerate, // Optional value
                          );
                        },
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      myPrimaryButton(
                        title: 'تسجيل',
                        onClick: () {
                          Transitioner(
                            context: context,
                            child: RegisterScreen(),
                            animation: AnimationType.fadeIn, // Optional value
                            duration:
                                Duration(milliseconds: 500), // Optional value
                            replacement: true, // Optional value
                            curveType: CurveType.decelerate, // Optional value
                          );
                        },
                      ),
                      // SizedBox(
                      //   height: 25,
                      // ),
                      // myPrimaryButton(
                      //   title: 'تخطي',
                      //   onClick: () {},
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
