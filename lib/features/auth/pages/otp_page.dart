import 'package:flow_plan/common/utils/constants.dart';
import 'package:flow_plan/common/widgets/app_style.dart';
import 'package:flow_plan/common/widgets/height_spacer.dart';
import 'package:flow_plan/common/widgets/reusable_text.dart';
import 'package:flow_plan/features/auth/controllers/auth_controller.dart';
import 'package:flow_plan/features/todo/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pinput/pinput.dart';

class OtpPage extends ConsumerWidget {
  const OtpPage({super.key, required this.phone, required this.smsCodeId});

  final String smsCodeId;
  final String phone;

  void verifyOtpCode(BuildContext context, WidgetRef ref, String smsCode) {
    ref
        .read(authControllerProvider)
        .verifyOtpCode(
          context: context,
          smsCodeId: smsCodeId,
          smsCode: smsCode,
          mounted: true,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    return verifyOtpCode(context, ref, value);
                  }
                },
                onSubmitted: (value) {
                  if (value.length == 6) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                    return verifyOtpCode(context, ref, value);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
} // 10:11:30
