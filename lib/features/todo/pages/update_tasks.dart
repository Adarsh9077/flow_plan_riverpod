import 'package:flow_plan/common/utils/constants.dart';
import 'package:flow_plan/common/widgets/app_style.dart';
import 'package:flow_plan/common/widgets/custom_otl_btn.dart';
import 'package:flow_plan/common/widgets/custom_text.dart';
import 'package:flow_plan/common/widgets/height_spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart'
    as picker;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controllers/dates/dates_provider.dart';
import '../controllers/todo/todo_provider.dart';

class UpdateTask extends ConsumerStatefulWidget {


  const UpdateTask({
    super.key,
    required this.id,
  });

  final int id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UpdateTaskState();
}

class _UpdateTaskState extends ConsumerState<UpdateTask> {
  final TextEditingController titleController = TextEditingController(
    text: titles,
  );

  final TextEditingController descController = TextEditingController(
    text: descs,
  );

  @override
  Widget build(BuildContext context) {
    var scheduleDate = ref.watch(dateStateProvider);
    var scheduleStartTime = ref.watch(startTimeStateProvider);
    var scheduleFinishTime = ref.watch(finishTimeStateProvider);

    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ListView(
          children: [
            HeightSpacer(height: 30),
            CustomTextField(
              controller: titleController,
              hintText: "",
              hintStyle: appStyle(16, AppConst.kGreyLight, FontWeight.w600),
            ),
            HeightSpacer(height: 30),
            CustomTextField(
              controller: descController,
              hintText: "",
              hintStyle: appStyle(14, AppConst.kGreyLight, FontWeight.w400),
            ),
            HeightSpacer(height: 20),
            CustomOutlineBtn(
              width: AppConst.kWidth,
              height: 52.h,
              color: AppConst.kLight,
              text: scheduleDate == "" ? "Set Date" : scheduleDate.substring(0,10),
              color2: AppConst.kBlueLight,
              onTap: () {
                picker.DatePicker.showDatePicker(
                  context,
                  showTitleActions: true,
                  minTime: DateTime.now(),
                  theme: picker.DatePickerTheme(
                    doneStyle: TextStyle(color: AppConst.kGreen, fontSize: 16),
                  ),
                  onConfirm: (date) {
                    // print('confirm $date');
                    ref
                        .read(dateStateProvider.notifier)
                        .setDate(date.toString());
                  },
                  currentTime: DateTime.now(),
                  locale: picker.LocaleType.en,
                );
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
                  text: scheduleStartTime == ""
                      ? "Start Time"
                      : scheduleStartTime.substring(11,16),
                  color2: AppConst.kBlueLight,
                  onTap: () {
                    picker.DatePicker.showDateTimePicker(
                      context,
                      showTitleActions: true,
                      onConfirm: (date) {
                        // print('confirm $date');
                        ref
                            .read(startTimeStateProvider.notifier)
                            .setStartTime(date.toString());
                      },
                      currentTime: DateTime.now(),
                      locale: picker.LocaleType.en,
                    );
                  },
                ),
                CustomOutlineBtn(
                  width: AppConst.kWidth * 0.4,
                  height: 52.h,
                  color: AppConst.kLight,
                  text: scheduleFinishTime == ""
                      ? "End TIme"
                      : scheduleFinishTime.substring(11,16),
                  color2: AppConst.kBlueLight,
                  onTap: () {
                    picker.DatePicker.showDateTimePicker(
                      context,
                      showTitleActions: true,
                      onConfirm: (date) {
                        // print('confirm $date');
                        ref
                            .read(finishTimeStateProvider.notifier)
                            .setFinishTime(date.toString());
                      },
                      currentTime: DateTime.now(),
                      locale: picker.LocaleType.en,
                    );
                  },
                ),
              ],
            ),
            HeightSpacer(height: 30),
            CustomOutlineBtn(
              width: AppConst.kWidth,
              height: 52.h,
              color: AppConst.kLight,
              text: "Submit",
              color2: AppConst.kGreen,
              onTap: () {
                if (titleController.text.isNotEmpty &&
                    descController.text.isNotEmpty &&
                    scheduleDate.isNotEmpty &&
                    scheduleStartTime.isNotEmpty &&
                    scheduleFinishTime.isNotEmpty) {
                  ref
                      .read(todoStateProvider.notifier)
                      .updateItem(
                        widget.id,
                        titleController.text,
                        descController.text,
                        0,
                        scheduleDate,
                        scheduleStartTime.substring(10, 16),
                        scheduleFinishTime.substring(10, 16),
                        0,
                        "yes",
                      );
                  ref.read(dateStateProvider.notifier).setDate("");
                  ref.read(startTimeStateProvider.notifier).setStartTime("");
                  ref.read(finishTimeStateProvider.notifier).setFinishTime("");
                  Navigator.pop(context);
                } else {
                  print("Failed to add Task12");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}