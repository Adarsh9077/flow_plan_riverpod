import 'package:flow_plan/common/utils/constants.dart';
// import 'package:flow_plan/features/auth/pages/test_page.dart';
/// @ import 'package:flow_plan/features/onboarding/pages/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'features/todo/pages/homepage.dart';

/// !import 'features/todo/pages/homepage.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: Size(375, 825),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Flow plan',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppConst.kBKDark,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          themeMode: ThemeMode.dark,
          // home: TestPage(),
          home: HomePage(),
        );
      },
    );
  }
}
