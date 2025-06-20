import 'package:flow_plan/common/utils/constants.dart';
import 'package:flow_plan/common/widgets/custom_otl_btn.dart';
import 'package:flow_plan/common/widgets/height_spacer.dart';
import 'package:flutter/material.dart';

import '../../auth/pages/loginPage.dart';

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
          CustomOutlineBtn(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
            width: AppConst.kWidth * 0.9,
            height: AppConst.kHeight * 0.06,
            color: AppConst.kLight,
            text: "Login with a phone number",
          ),
        ],
      ),
    );
  }
}


