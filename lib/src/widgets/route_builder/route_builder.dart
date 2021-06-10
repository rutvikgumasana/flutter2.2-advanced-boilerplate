import 'package:flutter/material.dart';

Route createRoute(Widget route) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => route,
    transitionsBuilder: (c, anim, a2, child) =>
        FadeTransition(opacity: anim, child: child),
    transitionDuration: Duration(milliseconds: 1),
  );
}
