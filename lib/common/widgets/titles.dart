import 'package:flow_plan/common/utils/constants.dart';
import 'package:flow_plan/common/widgets/app_style.dart';
import 'package:flow_plan/common/widgets/height_spacer.dart';
import 'package:flow_plan/common/widgets/reusable_text.dart';
import 'package:flow_plan/common/widgets/width_spacer.dart';
import 'package:flow_plan/features/todo/controllers/todo/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class BottomTitles extends StatelessWidget {
  const BottomTitles({
    super.key,
    required this.title,
    required this.subTitle,
    this.clr,
  });

  final String title;
  final String subTitle;
  final Color? clr;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // CustomPaint(painter: _TitlesPainter()),
            Consumer(
              builder: (context, ref, child) {
                var color = ref
                    .read(todoStateProvider.notifier)
                    .getRandomColor();
                return Container(
                  height: 80,
                  width: 5,
                  decoration: BoxDecoration(
                    //  TODO: ADD DYNAMIC COLORS
                    // color: clr,
                    color: color,
                    borderRadius: BorderRadius.circular(AppConst.kRadius),
                  ),
                );
              },
            ),
            WidthSpacer(width: 15),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                    text: title,
                    style: appStyle(24, AppConst.kLight, FontWeight.bold),
                  ),
                  HeightSpacer(height: 10),
                  ReusableText(
                    text: subTitle,
                    style: appStyle(14, AppConst.kLight, FontWeight.normal),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
