import 'package:flow_plan/features/onboarding/pages/onboarding.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String onBoarding = 'onBoarding';
  static const String login = 'login';
  static const String otp = 'otp';
  static const String home = 'home';

  static Route<dynamic> onGenrateRoute(RouteSettings setting) {
    switch (setting.name) {
      case onBoarding:
        return MaterialPageRoute(builder: (context) => Onboarding());
    }
  }
} // 08:48:15
