import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monie_conv/shared/constants.dart';

class NormalTextField extends StatelessWidget {
  const NormalTextField({
    super.key,
    this.initialValue,
    required this.hintText,
    required this.onChanged,
    this.obscureText = false,
    required this.enabledBorderColor,
    required this.focusedBorderColor,
    required this.errorBorderColor,
    required this.focusedErrorBorderColor,
    required this.errorTextStyleColor,
    required this.iconColor,
    required this.cursorColor,
    required this.prefixIcon,
    this.suffixIcon,
    this.readonly,
    this.fontSize,
    this.textInputType,
    this.textColor,
    this.suffixIconOTap,
    this.labelText,
    this.maxLines,
    this.fillColor,
    this.filled=false,
    this.borderRadius,
    this.validator,
  });

  final String? initialValue;
  final String? labelText;
  final String hintText;
  final bool? readonly;
  final Function(String? value) onChanged;
  final Function()? suffixIconOTap;
  final String? Function(String? value)? validator;
  final Color enabledBorderColor;
  final bool obscureText;
  final Color? textColor;
  final bool? filled;
  final Color? fillColor;
  final Color focusedBorderColor;
  final Color errorBorderColor;
  final Color focusedErrorBorderColor;
  final Color errorTextStyleColor;
  final Color iconColor;
  final Color cursorColor;
  final IconData prefixIcon;
  final IconData? suffixIcon;
  final double? fontSize;
  final TextInputType? textInputType;
  final int? maxLines;
  final double? borderRadius;
  // Function(String? newValue) onSaved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.r),
      child: TextFormField(
        readOnly: readonly ?? false,
        initialValue: initialValue,
        minLines: 1,
        maxLines: maxLines ?? 1,
        style: kNormalTextStyle(context).copyWith(
          fontSize: fontSize ?? 17.sp, 
          color: textColor ?? kPrimaryColor,
        ),
        cursorColor: cursorColor,
        obscureText: obscureText,
        keyboardType: textInputType ?? TextInputType.text,
        decoration: InputDecoration(
          hintText: hintText,
          filled: filled,
          fillColor: fillColor,
          hintStyle: kNormalTextStyle(context).copyWith(
              color: kPrimaryColor.withOpacity(0.5), 
              fontSize: fontSize ?? 17.sp,
              fontWeight: FontWeight.bold,
            ),
          prefixIcon: Padding(
            padding: EdgeInsets.only(right: 25.r, left: 15.r),
            child: Icon(
              prefixIcon,
              color: iconColor,
              size: 30.r,
            ),
          ),
          suffixIcon: GestureDetector(
            onTap: suffixIconOTap ?? () {},
            child: Padding(
              padding: EdgeInsets.only(right: 20.r),
              child: Icon(suffixIcon, color: kPrimaryColor),
            ),
          ),
          // labelText: labelText ?? hintText,
          labelStyle: TextStyle(
            color: kPrimaryColor,
            fontWeight: FontWeight.normal,
            fontSize: 17.sp,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: enabledBorderColor, width: 1.w),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 20.r)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: focusedBorderColor, width: 1.w),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 20.r)),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: errorBorderColor, width: 1.w),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 20.r)),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: focusedErrorBorderColor, width: 1.w),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 20.r)),
          ),
          errorStyle: TextStyle(
            color: errorTextStyleColor,
            fontSize: 15.sp,
          ),
        ),
        // onSaved: onSaved,
        onChanged: onChanged,
        validator: validator ??  (value) {
          if (value!.isEmpty ) {
            return 'This field cannot be empty';
          } else {
            return null;
          }
        },
      ),
    );
  }
}

class DropDownFormField extends StatelessWidget {

  const DropDownFormField({
    super.key,
    required this.value,
    required this.items,
    this.labelText,
    this.iconSize,
    this.fontSize,
    this.padding,
    required this.onChanged,
    required this.prefixIcon,
    required this.iconColor, 
    required this.enabledBorderColor, 
    required this.focusedBorderColor, 
    required this.errorBorderColor, 
    required this.focusedErrorBorderColor, 
    required this.errorTextStyleColor,
    this.borderRadius,
    // this.onTap,
    // this.onSaved,
  });

  final dynamic value;
  final String? labelText;
  final List<DropdownMenuItem> items;
  final double? fontSize;
  final double? iconSize;
  final EdgeInsets? padding;
  final IconData prefixIcon;
  final Color iconColor;
  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final Color errorBorderColor;
  final Color focusedErrorBorderColor;
  final Color errorTextStyleColor;
  final void Function(dynamic value)? onChanged;
  // final void Function(dynamic newValue)? onSaved;
  // final void Function()? onTap;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: value,
      items: items,
      style: kNormalTextStyle(context).copyWith(fontSize: fontSize ?? 15.sp),
      onChanged: onChanged,
      iconEnabledColor: kPrimaryColor,
      dropdownColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 2,
      padding: padding ?? const EdgeInsets.only(bottom: 20.0),
      decoration: InputDecoration(
        hintText: labelText,
        hintStyle: kNormalTextStyle(context).copyWith(
          color: kSecondaryColor, 
          fontSize: fontSize ?? 15.sp,
          fontWeight: FontWeight.normal,
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 10.r, right: 10.r),
          child: Icon(
            prefixIcon,
            color: iconColor,
            size: iconSize ?? 30.r,
          ),
        ),
        // labelText: labelText ?? 'Category',
        labelStyle: TextStyle(
          color: kPrimaryColor,
          fontWeight: FontWeight.normal,
          fontSize: 17.sp,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: enabledBorderColor, width: 1.w),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 20.r)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: focusedBorderColor, width: 1.w),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 20.r)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: errorBorderColor, width: 1.w),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 20.r)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: focusedErrorBorderColor, width: 1.w),
          borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 20.r)),
        ),
        errorStyle: TextStyle(
          color: errorTextStyleColor,
          fontSize: 17.sp,
        ),
      ),
      validator: (value) {
        if (value == null) {
          return 'Make a choice';
        } else {
          return null;
        }
      },
      // onTap: onTap ?? () {
        
      // },
      // onSaved: onSaved ?? (dynamic newValue) {
        
      // },
    );
  }
}