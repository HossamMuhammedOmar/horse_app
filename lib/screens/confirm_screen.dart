import 'package:flutter/material.dart';
import 'package:horse_app/bloc/home/cubit.dart';
import 'package:horse_app/constants/colors.dart';
import 'package:horse_app/constants/fonts.dart';
import 'package:horse_app/screens/subscribe_screen.dart';
import 'package:transitioner/transitioner.dart';

class ConfirmScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'تم أرسال طلب اشتراك بالباقة نرجو متابعى الطلب عبر طلباتي',
              maxLines: 2,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontFamily: mPrimaryArabicFont,
              ),
            ),
            SizedBox(height: 30),
            MaterialButton(
              onPressed: () {
                HomeCubit.get(context).getMyPackages();
                Transitioner(
                  context: context,
                  child: SubscibeScreen(),
                  animation: AnimationType.fadeIn, // Optional value
                  duration: Duration(milliseconds: 300), // Optional value
                  replacement: true, // Optional value
                  curveType: CurveType.decelerate, // Optional value
                );
              },
              child: Text(
                'متابعه',
                style: TextStyle(
                  fontFamily: mPrimaryArabicFont,
                ),
              ),
              color: mPrimaryColor,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
