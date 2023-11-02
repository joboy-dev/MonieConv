// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:monie_conv/screens/currency_conversion_screen.dart';
import 'package:monie_conv/shared/constants.dart';
import 'package:monie_conv/shared/loader.dart';
import 'package:monie_conv/shared/logger.dart';
import 'package:monie_conv/shared/navigator.dart';
import 'package:monie_conv/shared/snackbar.dart';
import 'package:monie_conv/utils/api.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoading = false;

  loadData() async {
    setState(() {
        _isLoading = true;
    });
      
    var data = await getAllCurrencies(context); 

    if (data == null || data == '') {
      setState(() {
        _isLoading = false;
      });

      showSnackbar(context, 'Unable to load data at this time. Please try again.');
    } else {
      setState(() {
        _isLoading = false;
      });

      logger(data);

      navigatorPushReplacement(context, const CurrencyConversionScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                width: 200.w,
                height: 300.h,
                image: const AssetImage('assets/images/logo.png')
              ),

              _isLoading ? const Loader() : const SizedBox()
            ],
          ),
        ).animate(
          onComplete: (controller) {
            loadData();
          },
        ).scale(duration: kAnimationDurationMs(1000)),
      ),
    );
  }
}