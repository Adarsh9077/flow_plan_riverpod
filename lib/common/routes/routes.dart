import 'package:flow_plan/features/auth/pages/loginPage.dart';
import 'package:flow_plan/features/auth/pages/otp_page.dart';
import 'package:flow_plan/features/onboarding/pages/onboarding.dart';
import 'package:flow_plan/features/todo/pages/homepage.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String onBoarding = 'onBoarding';
  static const String login = 'login';
  static const String otp = 'otp';
  static const String home = 'home';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case onBoarding:
        return MaterialPageRoute(builder: (context) => Onboarding());
      case login:
        return MaterialPageRoute(builder: (context) => LoginPage());
      case otp:
        final Map args = settings.arguments as Map;
        return MaterialPageRoute(
          builder: (context) =>
              OtpPage(phone: args["phone"], smsCodeId: args["smsCodeId"]),
        );
      case home:
        return MaterialPageRoute(builder: (context) => HomePage());
      default:
        return MaterialPageRoute(builder: (context) => HomePage());
    }
  }
}
