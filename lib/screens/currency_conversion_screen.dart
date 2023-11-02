// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:monie_conv/provider/currency_provider.dart';
import 'package:monie_conv/shared/animations.dart';
import 'package:monie_conv/shared/button.dart';
import 'package:monie_conv/shared/constants.dart';
import 'package:monie_conv/shared/custom_appbar.dart';
import 'package:monie_conv/shared/logger.dart';
import 'package:monie_conv/shared/snackbar.dart';
import 'package:monie_conv/shared/text_field.dart';
import 'package:monie_conv/utils/api.dart';
import 'package:provider/provider.dart';

class CurrencyConversionScreen extends StatefulWidget {
  const CurrencyConversionScreen({super.key});

  @override
  State<CurrencyConversionScreen> createState() => _CurrencyConversionScreenState();
}

class _CurrencyConversionScreenState extends State<CurrencyConversionScreen> {
  String? selectedCurrencyFrom ;
  String? selectedCurrencyTo ;

  // currency to convert from
  String amount = '';
  double result = 0.00;

  bool isLoading = false;

  final _formKey = GlobalKey<FormState>();

  validateFrom() async {
    if (_formKey.currentState!.validate()) {  
      setState(() {
        isLoading = true;
      });

      showSnackbar(context, 'Converting...');
      var data = await convertCurrency(selectedCurrencyFrom!, selectedCurrencyTo!, amount);

      if (data == null || data == '') {
        setState(() {
          isLoading = false;
        });

        showSnackbar(context, 'An error occured. Please try again.');
      } else {
        setState(() {
          result = data;
          isLoading = false;
        });
        showSnackbar(context, 'Conversion complete');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // get all currencies from provider
    final currencyList = context.watch<CurrencyProvider>().currencies;
    final currencyMap = context.watch<CurrencyProvider>().currencyMap;

    return Scaffold(
      appBar: const CustomAppbar(title: 'MonieConv'),
      body: SingleChildScrollView(
        child: Padding(
          padding: kAppPadding(),
          child: SafeArea(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image(
                      width: 70.w,
                      height: 70.h,
                      image: const AssetImage('assets/images/appicon.png'),
                    ),
                  ),
                  
                  SizedBox(height: 20.h),
                  
                  Text(
                    'Convert', 
                    style: kNormalTextStyle(context).copyWith(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  
                  Column(
                    children: [
                      DropDownFormField(
                        value: selectedCurrencyFrom, 
                        items: currencyList.map(
                          (currency) => DropdownMenuItem(
                            value: currency,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  currency, 
                                  style: kNormalTextStyle(context).copyWith(
                                    color: kPrimaryColor.withOpacity(0.7),
                                    fontWeight: FontWeight.bold
                                  )
                                ),
                                Text(
                                  '- ${currencyMap[currency]}', 
                                  style: kNormalTextStyle(context).copyWith(
                                    color: kSecondaryColor,
                                    fontSize: 12.sp,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            )
                          )
                        ).toList(), 
                        onChanged: (value) {
                          setState(() {
                            selectedCurrencyFrom = value;
                          });
                          logger(selectedCurrencyFrom!);
                        }, 
                        labelText: 'Select Currency',
                        enabledBorderColor: Colors.transparent, 
                        focusedBorderColor: Colors.transparent, 
                        errorBorderColor: kRedColor, 
                        focusedErrorBorderColor: kRedColor, 
                        errorTextStyleColor: kRedColor, 
                        iconColor: kPrimaryColor, 
                        prefixIcon: FontAwesomeIcons.buildingColumns
                      ),
            
                      NormalTextField(
                        hintText: 'Enter value', 
                        onChanged: (value) {
                          setState(() {
                            amount = value!;
                          });
                        }, 
                        textInputType: TextInputType.number,
                        filled: true,
                        fillColor: kPrimaryColor.withOpacity(0.2),
                        enabledBorderColor: Colors.transparent, 
                        focusedBorderColor: Colors.transparent, 
                        errorBorderColor: kRedColor, 
                        focusedErrorBorderColor: kRedColor, 
                        errorTextStyleColor: kRedColor, 
                        iconColor: kPrimaryColor, 
                        cursorColor: kPrimaryColor, 
                        prefixIcon: Icons.monetization_on_outlined
                      ),
                    ],
                  ),
                  
                  Text(
                    'To', 
                    style: kNormalTextStyle(context).copyWith(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  
                  Column(
                    children: [
                      DropDownFormField(
                        value: selectedCurrencyTo, 
                        items: currencyList.map(
                          (currency) => DropdownMenuItem(
                            value: currency,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  currency, 
                                  style: kNormalTextStyle(context).copyWith(
                                    color: kPrimaryColor.withOpacity(0.7),
                                    fontWeight: FontWeight.bold
                                  )
                                ),
                                Text(
                                  '- ${currencyMap[currency]}', 
                                  style: kNormalTextStyle(context).copyWith(
                                    color: kSecondaryColor,
                                    fontSize: 12.sp,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            )
                          )
                        ).toList(), 
                        onChanged: (value) {
                          setState(() {
                            selectedCurrencyTo = value;
                          });
                          logger(selectedCurrencyTo!);
                        }, 
                        labelText: 'Select Currency',
                        enabledBorderColor: Colors.transparent, 
                        focusedBorderColor: Colors.transparent, 
                        errorBorderColor: kRedColor, 
                        focusedErrorBorderColor: kRedColor, 
                        errorTextStyleColor: kRedColor, 
                        iconColor: kPrimaryColor, 
                        prefixIcon: FontAwesomeIcons.buildingColumns
                      ),
            
                      Padding(
                        padding: EdgeInsets.only(bottom: 20.r),
                        child: Container(
                          width: double.infinity,
                          height: 55.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            color: kPrimaryColor.withOpacity(0.2)
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 25.r, left: 15.r),
                                  child: Icon(
                                    Icons.monetization_on_outlined,
                                    size: 30.r,
                                    color: kPrimaryColor,
                                  ),
                                )
                              ),
                              Expanded(
                                flex: 4,
                                child: Text(
                                  result.toString(),
                                  style: kNormalTextStyle(context).copyWith(
                                    color: kPrimaryColor,
                                    fontWeight: FontWeight.bold,
                                  )
                                )
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  Center(
                    child: Button(
                      buttonText: isLoading ? 'Converting...' : 'Convert', 
                      onPressed: () {
                        validateFrom();
                      }, 
                      buttonColor: kPrimaryColor, 
                      inactive: isLoading,
                    ),
                  )
                ].animate(
                  interval: kAnimationDurationMs(200),
                  effects: MyEffects.fadeSlide()
                ),
              ),
            )
          ),
        ),
      ),
    );
  }
}