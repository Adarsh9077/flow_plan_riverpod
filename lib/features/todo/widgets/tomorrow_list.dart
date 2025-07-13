import 'package:flow_plan/common/utils/constants.dart';
import 'package:flow_plan/features/todo/controllers/todo/todo_provider.dart';
import 'package:flow_plan/features/todo/pages/update_tasks.dart';
import 'package:flow_plan/features/todo/widgets/todo_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/widgets/expansion_tile_custom.dart';
import '../controllers/expansion_provider.dart';

class TomorrowList extends ConsumerWidget {
  const TomorrowList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoStateProvider);
    String tomorrow = ref.read(todoStateProvider.notifier).getTomorrow();
    var tomorrowTasks = todos.where(
      (element) => element.date!.contains(tomorrow),
    );
    var color = ref.read(todoStateProvider.notifier).getRandomColor();
    return ExpansionTileCustom(
      title: "Tomorrow's Task",
      subTitle: "Tomorrow's Task are shawn here",
      onExpansionChanged: (bool expanded) {
        ref.read(expansionStateProvider.notifier).setStart(!expanded);
      },
      trailing: Padding(
        padding: const EdgeInsets.only(right: 12.0),
        child: ref.watch(expansionStateProvider)
            ? Icon(AntDesign.circledown, color: AppConst.kLight)
            : Icon(AntDesign.closecircleo, color: AppConst.kBlueLight),
      ),
      children: [
        for (final todo in tomorrowTasks)
          TodoTile(
            title: todo.title,
            description: todo.desc,
            clr: color,
            start: todo.startTime,
            end: todo.endTime,
            delete: () {
              ref.read(todoStateProvider.notifier).deleteTodo(todo.id ?? 0);
            },
            editWidget: GestureDetector(
              onTap: () {
                titles = todo.title.toString();
                descs = todo.desc.toString();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UpdateTask(
                      id: todo.id ?? 0,
                      title: titles,
                      desc: descs,
                      date: todo.date.toString(),
                      startTime: todo.startTime.toString(),
                      endTime: todo.endTime.toString(),
                    ),
                  ),
                );
              },
              child: Icon(MaterialCommunityIcons.circle_edit_outline),
            ),
            switcher: SizedBox.shrink(),
          ),
      ],
    );
  }
} // 07:42:00
