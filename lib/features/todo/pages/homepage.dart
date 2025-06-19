import 'package:flow_plan/common/widgets/app_style.dart';
import 'package:flow_plan/common/widgets/height_spacer.dart';
import 'package:flow_plan/common/widgets/reusable_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ReusableText(
              text: "Flow Plan with RiverPods",
              style: appStyle(28, Colors.redAccent, FontWeight.bold),
            ),HeightSpacer(height: 30),
            ReusableText(
              text: "Flow Plan with RiverPods",
              style: appStyle(28, Colors.redAccent, FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
