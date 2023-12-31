import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:monie_conv/shared/constants.dart';

class MyEffects {
  static List<Effect> fadeSlide({Offset offset= const Offset(0, -0.02)}) => [
    FadeEffect(duration: kAnimationDurationMs(700)),
    SlideEffect(duration: kAnimationDurationMs(500), begin: offset),
  ];

  static List<Effect> slideShake({Offset offset= const Offset(0, -0.1)}) => [
    SlideEffect(duration: kAnimationDurationMs(500), begin: offset),
    ShakeEffect(duration: kAnimationDurationMs(500)),
  ];
}
