import 'package:firebase_core/firebase_core.dart';
import 'package:flow_plan/common/utils/constants.dart';
import 'package:flow_plan/features/onboarding/pages/onboarding.dart';
import 'package:flow_plan/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'features/todo/pages/homepage.dart';
import 'package:dynamic_color/dynamic_color.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ProviderScope(child: MyApp()));
  // sha1_key 07:5D:DC:C4:73:74:82:A9:A5:D5:6A:94:DE:F1:19:92:7B:1A:54:12
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
              home: Onboarding(),
              // home: HomePage(),
            );
          },
        );
      },
    );
  }
}
