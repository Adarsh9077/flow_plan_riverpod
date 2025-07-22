import 'package:flow_plan/common/utils/constants.dart';
import 'package:flow_plan/common/widgets/app_style.dart';
import 'package:flow_plan/common/widgets/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

showAlertDialog({
  required BuildContext context,
  required message,
  String? btnText,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Text(
          message,
          style: appStyle(18, AppConst.kLight, FontWeight.w600),
        ),
        contentPadding: EdgeInsets.fromLTRB(20.w, 20.h, 20.w, 0.h),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              btnText ?? "OK",
              style: appStyle(14, AppConst.kGreyLight, FontWeight.w400),
            ),
          ),
        ],
      );
    },
  );
}
