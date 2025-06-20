import 'package:flow_plan/common/utils/constants.dart';
import 'package:flow_plan/common/widgets/app_style.dart';
import 'package:flow_plan/common/widgets/reusable_text.dart';
import 'package:flow_plan/common/widgets/width_spacer.dart';
import 'package:flow_plan/features/onboarding/widgets/page_one.dart';
import 'package:flow_plan/features/onboarding/widgets/page_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: AlwaysScrollableScrollPhysics(),
            controller: pageController,
            children: [PageOne(), PageTwo()],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      pageController.nextPage(
                        duration: Duration(milliseconds: 600),
                        curve: Curves.ease,
                      );
                    },
                    child: Row(
                      children: [
                        Icon(
                          Ionicons.chevron_forward_circle,
                          size: 30,
                          color: AppConst.kLight,
                        ),
                        WidthSpacer(width: 5),
                        ReusableText(
                          text: "Skip",
                          style: appStyle(16, AppConst.kLight, FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      pageController.nextPage(
                        duration: Duration(milliseconds: 600),
                        curve: Curves.ease,
                      );
                    },
                    child: SmoothPageIndicator(
                      controller: pageController,
                      count: 2,
                      effect: WormEffect(
                        dotHeight: 12,
                        dotWidth: 16,
                        spacing: 10,
                        dotColor: AppConst.kYellow,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// 1:09:00
