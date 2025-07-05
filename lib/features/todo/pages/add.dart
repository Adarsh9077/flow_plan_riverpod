import 'package:flow_plan/common/utils/constants.dart';
import 'package:flow_plan/common/widgets/app_style.dart';
import 'package:flow_plan/common/widgets/custom_otl_btn.dart';
import 'package:flow_plan/common/widgets/custom_text.dart';
import 'package:flow_plan/common/widgets/height_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart' as picker;

class AddTask extends ConsumerStatefulWidget {
  AddTask({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddTaskState();
}

class _AddTaskState extends ConsumerState<AddTask> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            HeightSpacer(height: 30),
            CustomTextField(
              controller: titleController,
              hintText: "Add Title",
              hintStyle: appStyle(16, AppConst.kGreyLight, FontWeight.w600),
            ),
            HeightSpacer(height: 20.w),
            CustomTextField(
              controller: descController,
              hintText: "Add Description",
              hintStyle: appStyle(16, AppConst.kGreyLight, FontWeight.w600),
            ),
            HeightSpacer(height: 20.h),
            CustomOutlineBtn(
              width: AppConst.kWidth,
              height: 52.h,
              color: AppConst.kLight,
              text: "Set Date",
              color2: AppConst.kBlueLight,
              onTap: (){
                picker.DatePicker.showDatePicker(context,
                    showTitleActions: true,
                    theme: picker.DatePickerTheme(
                        doneStyle:
                        TextStyle(color: AppConst.kGreen, fontSize: 16)),
                    onChanged: (date) {
                      print('change $date in time zone ' +
                          date.timeZoneOffset.inHours.toString());
                    }, onConfirm: (date) {
                      print('confirm $date');
                    }, currentTime: DateTime.now(), locale: picker.LocaleType.en);
              },
            ),
            HeightSpacer(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomOutlineBtn(
                  width: AppConst.kWidth * 0.4,
                  height: 52.h,
                  color: AppConst.kLight,
                  text: "Start Time",
                  color2: AppConst.kBlueLight,
                ),
                CustomOutlineBtn(
                  width: AppConst.kWidth * 0.4,
                  height: 52.h,
                  color: AppConst.kLight,
                  text: "End Time",
                  color2: AppConst.kBlueLight,
                ),
              ],
            ),
            HeightSpacer(height: 20.h),
            CustomOutlineBtn(
              width: AppConst.kWidth,
              height: 52.w,
              color: AppConst.kLight,
              text: "Submit",
              color2: AppConst.kGreen,
            ),
          ],
        ),
      ),
    );
  }
} // 06:42:25
