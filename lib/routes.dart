import 'package:flutter/material.dart';
import 'package:ui_demo/presentations/login_screen.dart';
import 'package:ui_demo/presentations/swipe_delete_screen.dart';

Route onGenerateRoute(RouteSettings routeSettings) {
  final arguments = routeSettings.arguments;
  switch (routeSettings.name) {
    case '/':
      return MaterialPageRoute(
        builder: (_) => const SlideToDelete(),
      );

    case '/LogIn':
      return MaterialPageRoute(
        builder: (_) => const LogInScreen(),
      );

    default:
      return MaterialPageRoute(builder: (_) => Container());
  }
}
