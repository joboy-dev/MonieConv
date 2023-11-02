import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

EdgeInsets kAppPadding() => EdgeInsets.only(left: 15.r, right: 15.r, top: 10.r);

Color kPrimaryColor = const Color(0xFFF56E56);
Color kSecondaryColor = const Color(0xFFD0D0D0);
const kRedColor = Color.fromARGB(255, 206, 15, 15);

// ANIMATION DURATION
Duration kAnimationDurationMs(int ms) => Duration(milliseconds: ms);
Duration kAnimationDurationSecs(int seconds) => Duration(seconds: seconds);

const kAppbarTextStyle = TextStyle(fontWeight: FontWeight.bold);

TextStyle kTextFieldTextStyle() => TextStyle(fontSize: 17.sp, color: Colors.black);
TextStyle kNormalTextStyle(BuildContext context) => TextStyle(fontSize: 17.sp, color: Colors.white);
