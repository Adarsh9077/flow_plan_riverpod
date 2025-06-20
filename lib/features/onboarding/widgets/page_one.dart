import 'package:flow_plan/common/utils/constants.dart';
import 'package:flow_plan/common/widgets/app_style.dart';
import 'package:flow_plan/common/widgets/height_spacer.dart';
import 'package:flow_plan/common/widgets/reusable_text.dart';
import 'package:flutter/cupertino.dart';

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConst.kHeight,
      width: AppConst.kWidth,
      color: AppConst.kBKLight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Image.asset("assets/images/todo.png"),
          ),
          HeightSpacer(height: 100),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ReusableText(
                text: "Flow Plan with RiverPod",
                style: appStyle(30, AppConst.kLight, FontWeight.w600),
              ),
              HeightSpacer(height: 30),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  "Welcome!! Do You want to create a task fast and with ease",
                  textAlign: TextAlign.center,
                  style: appStyle(16, AppConst.kLight, FontWeight.normal),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
