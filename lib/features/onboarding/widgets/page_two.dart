import 'package:flow_plan/common/utils/constants.dart';
import 'package:flow_plan/common/widgets/height_spacer.dart';
import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConst.kWidth,
      height: AppConst.kHeight,
      color: AppConst.kBKDark,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Image.asset("assets/images/todo.png"),
          ),
          HeightSpacer(height: 100),
          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     ReusableText(
          //       text: "text",
          //       style: appStyle(30, AppConst.kLight, FontWeight.w600),
          //     ),
          //     HeightSpacer(height: 30),
          //     Text(
          //       "data",
          //       textAlign: TextAlign.center,
          //       style: appStyle(16, AppConst.kLight, FontWeight.normal),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}

// 1:29:00
