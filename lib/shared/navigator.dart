import 'package:flutter/material.dart';

navigatorPop(BuildContext context) {
  Navigator.of(context).pop();
}

navigatorPushReplacement(BuildContext context, Widget screen) {
  Navigator.of(context).pushReplacement(screenRoute(screen));
}

navigatorPush(BuildContext context, Widget screen) {
  Navigator.of(context).push(screenRoute(screen));
}

Route screenRoute(Widget screen) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => screen,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final tween = Tween(begin: 0.0, end: 1.0); 
      final scaleAnimation = animation.drive(tween);
      return ScaleTransition(
        scale: scaleAnimation,
        child: child
      );
    },
  );
}
