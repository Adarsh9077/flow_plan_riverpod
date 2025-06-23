import 'package:flow_plan/common/widgets/app_style.dart';
import 'package:flow_plan/common/widgets/height_spacer.dart';
import 'package:flow_plan/common/widgets/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/utils/constants.dart';

// class Test extends
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(85),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ReusableText(
                      text: "Dashboard",
                      style: appStyle(18, AppConst.kLight, FontWeight.bold),
                    ),
                    Container(
                      width: 25.w,
                      height: 25.w,
                      decoration: BoxDecoration(
                        color: AppConst.kLight,
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: GestureDetector(
                        onTap: () {},
                        child: Icon(Icons.add, color: AppConst.kBKDark),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ReusableText(
              text: "Flow Plan with RiverPods",
              style: appStyle(28, Colors.redAccent, FontWeight.bold),
            ),
            HeightSpacer(height: 30),
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
