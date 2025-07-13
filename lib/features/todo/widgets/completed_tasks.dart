import 'package:flow_plan/common/utils/constants.dart';
import 'package:flow_plan/features/todo/controllers/todo/todo_provider.dart';
import 'package:flow_plan/features/todo/widgets/todo_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/models/task_modal.dart';

class CompletedTasks extends ConsumerWidget {
  const CompletedTasks({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Task> listData = ref.watch(todoStateProvider);
    List lastMonth = ref.read(todoStateProvider.notifier).last30days();
    var completedList = listData
        .where(
          (element) =>
              element.isCompleted == 1 ||
              lastMonth.contains(element.date!.substring(0, 9)),
        )
        .toList();
    return ListView.builder(
      itemBuilder: (context, index) {
        final data = completedList[index];
        // bool isCompleted = ref.read(todoStateProvider.notifier).getStatus(data);
        dynamic color = ref.read(todoStateProvider.notifier).getRandomColor();
        return TodoTile(
          title: data.title,
          description: data.desc,
          clr: color,
          start: data.startTime,
          end: data.endTime,
          switcher: Icon(AntDesign.checkcircle, color: AppConst.kGreen),
          delete: () {
            ref.read(todoStateProvider.notifier).deleteTodo(data.id ?? 0);
          },
          editWidget: SizedBox.shrink(),
        );
      },
      itemCount: completedList.length,
    );
  }
} // 08: 01:00
