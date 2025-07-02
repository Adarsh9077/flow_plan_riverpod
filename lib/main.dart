import 'package:flow_plan/common/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'features/todo/pages/homepage.dart';
import 'package:dynamic_color/dynamic_color.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final defaultLightColorScheme = ColorScheme.fromSwatch(
    primarySwatch: Colors.blue,
  );
  static final defaultDarkColorScheme = ColorScheme.fromSwatch(
    primarySwatch: Colors.blue,
    brightness: Brightness.dark,
  );

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      designSize: Size(375, 825),
      minTextAdapt: true,
      builder: (context, child) {
        return DynamicColorBuilder(
          builder: (lightColorScheme, darkColorScheme) {
            return MaterialApp(
              title: 'Flow plan',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                scaffoldBackgroundColor: AppConst.kBKDark,
                colorScheme: lightColorScheme ?? defaultLightColorScheme,
              ),
              darkTheme: ThemeData(
                colorScheme: darkColorScheme ?? defaultLightColorScheme,
                useMaterial3: true,
              ),
              themeMode: ThemeMode.dark,
              // home: TestPage(),
              home: HomePage(),
            );
          },
        );
      },
    );
  }
}
