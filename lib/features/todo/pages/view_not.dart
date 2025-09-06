import 'package:flow_plan/common/widgets/app_style.dart';
import 'package:flow_plan/common/widgets/height_spacer.dart';
import 'package:flow_plan/common/widgets/reusable_text.dart';
import 'package:flow_plan/common/widgets/width_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/utils/constants.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key, this.payLoad});

  final String? payLoad;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: SafeArea(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Container(
                width: AppConst.kWidth,
                height: AppConst.kHeight * 0.7,
                decoration: BoxDecoration(
                  color: AppConst.kBKLight,
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ReusableText(
                      text: "Reminder",
                      style: appStyle(40, AppConst.kLight, FontWeight.bold),
                    ),
                    HeightSpacer(height: 5),
                    Container(
                      width: AppConst.kWidth,
                      padding: EdgeInsets.only(left: 5),
                      decoration: BoxDecoration(
                        color: AppConst.kYellow,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ReusableText(
                            text: "Today",
                            style: appStyle(
                              14,
                              AppConst.kBKDark,
                              FontWeight.bold,
                            ),
                          ),
                          WidthSpacer(width: 15),
                          ReusableText(
                            text: "From : start To: end",
                            style: appStyle(
                              15,
                              AppConst.kBKDark,
                              FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    HeightSpacer(height: 10),
                    ReusableText(
                      text: "Title",
                      style: appStyle(30, AppConst.kBKDark, FontWeight.bold),
                    ),
                    HeightSpacer(height: 10),
                    Text(
                      "Sub Title Dummy Words.........",
                      maxLines: 8,
                      style: appStyle(16, AppConst.kBKDark, FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              right: 12,
              top: -10,
              child: Image.asset(
                "assets/images/bell.png",
                width: 70,
                height: 70,
              ),
            ),
            Positioned(
              bottom: -AppConst.kHeight*0.143,
              left: 0,
              right: 0,
              child: Image.asset(
                "assets/images/notification.png",
                width: AppConst.kWidth * 0.8,
                height: AppConst.kHeight * 0.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
} // 10:38:45
