import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/fonts.dart';

Widget myPrimaryButton({
  required VoidCallback? onClick(),
  required String? title,
  String? fontFamily = mPrimaryArabicFont,
  FontWeight? fontWeight = FontWeight.bold,
  Color? bgColor = mPrimaryColor,
  Color? textColor = Colors.white,
  double? height = 50,
  double? width = double.infinity,
}) {
  return MaterialButton(
    onPressed: onClick,
    minWidth: width,
    height: height,
    child: Text(
      '$title',
      style: TextStyle(
        color: textColor,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
      ),
    ),
    color: bgColor,
  );
}
