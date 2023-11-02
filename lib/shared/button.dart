import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monie_conv/shared/constants.dart';

class Button extends StatelessWidget {
  final String buttonText;
  final Function() onPressed;
  final Color buttonColor;
  final bool inactive;
  final double? width;
  final Color? textColor;
  final double? borderRadius;

  const Button({
    super.key, 
    required this.buttonText,
    required this.onPressed,
    required this.buttonColor,
    required this.inactive,
    this.width,
    this.textColor,
    this.borderRadius
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      minWidth: width ?? 200.w,
      height: 50.h,
      color: inactive ? kSecondaryColor : buttonColor,
      focusColor: inactive
          ? kSecondaryColor.withOpacity(0.5)
          : buttonColor.withOpacity(0.5),
      elevation: inactive ? 1.0 : 2.0,
      focusElevation: 0.5,
      splashColor: inactive
          ? kSecondaryColor.withOpacity(0.5)
          : buttonColor.withOpacity(0.5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius ?? 25.r),
      ),
      child: Text(
        buttonText,
        style: TextStyle(
          color: textColor ?? Colors.white,
          fontSize: 17.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}