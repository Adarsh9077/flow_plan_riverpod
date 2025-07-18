import 'package:flow_plan/features/todo/pages/update_tasks.dart';
import 'package:flow_plan/features/todo/widgets/todo_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../common/models/task_modal.dart';
import '../../../common/utils/constants.dart';
import '../controllers/todo/todo_provider.dart';

class TodayTask extends ConsumerWidget {
  const TodayTask({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Task> listData = ref.watch(todoStateProvider);
    String today = ref.read(todoStateProvider.notifier).getToday();
    var todayData = listData
        .where(
          (element) =>
              element.isCompleted == 0 && element.date!.contains(today),
        )
        .toList();
    return ListView.builder(
      itemBuilder: (context, index) {
        final data = todayData[index];
        bool isCompleted = ref.read(todoStateProvider.notifier).getStatus(data);
        dynamic color = ref.read(todoStateProvider.notifier).getRandomColor();
        return TodoTile(
          title: data.title,
          description: data.desc,
          clr: color,
          start: data.startTime,
          end: data.endTime,
          switcher: Switch(
            value: isCompleted,
            onChanged: (value) {
              isCompleted = value;
              // print()
              ref
                  .read(todoStateProvider.notifier)
                  .markAsCompleted(
                    data.id ?? 0,
                    data.title.toString(),
                    data.desc.toString(),
                    1,
                    data.date.toString(),
                    data.startTime.toString(),
                    data.endTime.toString(),
                    data.reminder ?? 0,
                    data.repeat.toString(),
                  );
            },
          ),
          delete: () {
            ref.read(todoStateProvider.notifier).deleteTodo(data.id ?? 0);
          },
          editWidget: GestureDetector(
            onTap: () {
              titles = data.title.toString();
              descs = data.desc.toString();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UpdateTask(id: data.id ?? 0),
                ),
              );
            },
            child: Icon(MaterialCommunityIcons.circle_edit_outline),
          ),
        );
      },
      itemCount: todayData.length,
    );
  }
}
