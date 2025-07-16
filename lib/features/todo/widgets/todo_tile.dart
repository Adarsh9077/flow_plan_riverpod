import 'package:flow_plan/common/utils/constants.dart';
import 'package:flow_plan/common/widgets/app_style.dart';
import 'package:flow_plan/common/widgets/height_spacer.dart';
import 'package:flow_plan/common/widgets/reusable_text.dart';
import 'package:flow_plan/common/widgets/width_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    super.key,
    this.title,
    this.description,
    this.clr,
    this.start,
    this.end,
    this.editWidget,
    this.delete,
    this.switcher,
  });

  final String? title;
  final String? description;
  final Color? clr;
  final String? start;
  final String? end;
  final Widget? editWidget;
  final Widget? switcher;
  final void Function()? delete;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(8.h),
            width: AppConst.kWidth,
            decoration: BoxDecoration(
              color: AppConst.kGreyLight,
              borderRadius: BorderRadius.circular(AppConst.kRadius),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      width: 5,
                      height: 80,
                      decoration: BoxDecoration(color: clr ?? AppConst.kRed),
                    ),
                    WidthSpacer(width: 15),
                    Padding(
                      padding: EdgeInsets.all(8.h),
                      child: SizedBox(
                        width: AppConst.kWidth * 0.6,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ReusableText(
                              text: title ?? "Title of TODO",
                              style: appStyle(
                                18,
                                AppConst.kLight,
                                FontWeight.bold,
                              ),
                            ),
                            HeightSpacer(height: 2),
                            ReusableText(
                              text: description ?? "Description of TODO",
                              style: appStyle(
                                14,
                                AppConst.kLight,
                                FontWeight.bold,
                              ),
                            ),
                            HeightSpacer(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: AppConst.kWidth * 0.3,
                                  height: 25.h,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 0.3,
                                      color: AppConst.kGreyBK,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                      AppConst.kRadius,
                                    ),
                                    color: AppConst.kBKDark,
                                  ),
                                  child: Center(
                                    child: ReusableText(
                                      text: "$start | $end",
                                      style: appStyle(
                                        12,
                                        AppConst.kLight,
                                        FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),
                                WidthSpacer(width: 20),
                                Row(
                                  children: [
                                    SizedBox(child: editWidget),
                                    WidthSpacer(width: 20),
                                    GestureDetector(
                                      onTap: delete,
                                      child: Icon(
                                        MaterialCommunityIcons.delete_circle,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(padding: EdgeInsets.only(bottom: 0),child: switcher,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
