import 'package:flow_plan/common/widgets/app_style.dart';
import 'package:flow_plan/common/widgets/height_spacer.dart';
import 'package:flow_plan/common/widgets/reusable_text.dart';
import 'package:flow_plan/features/todo/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../common/utils/constants.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: AppConst.kLight),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeightSpacer(height: AppConst.kHeight * 0.15),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Image.asset(
                  "assets/images/todo.png",
                  width: AppConst.kWidth * 0.65,
                ),
              ),
              HeightSpacer(height: 26),
              ReusableText(
                text: "Enter your OTP Code",
                style: appStyle(18, AppConst.kLight, FontWeight.bold),
              ),
              HeightSpacer(height: 10),
              Pinput(
                length: 6,
                showCursor: true,
                onChanged: (value) {
                  if (value.length == 6) {
                    print("Picka Chu...");
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  }
                },
                onSubmitted: (value) {
                  if (value.length == 6) {}
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//2:34:00
