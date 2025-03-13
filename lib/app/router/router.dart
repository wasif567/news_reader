import 'package:flutter/material.dart';
import 'package:reader/app/router/router_constant.dart';
import 'package:reader/src/presentation/view/bottom_nav_view/bottom_nav_view.dart';
import 'package:reader/src/presentation/view/splash/splash_view.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Splash
      case RouterConstant.splashRoute:
        return MaterialPageRoute<SplashView>(builder: (_) => const SplashView());

      // BottomNav View
      case RouterConstant.bottomNavRoute:
        return MaterialPageRoute<BottomNavView>(builder: (_) => const BottomNavView());

      default:
        return MaterialPageRoute<Scaffold>(
          builder: (_) => Scaffold(body: Center(child: Text("No route defined for ${settings.name}"))),
        );
    }
  }
}
