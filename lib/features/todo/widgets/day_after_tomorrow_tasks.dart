import 'package:flow_plan/common/widgets/expansion_tile_custom.dart';
import 'package:flow_plan/features/todo/controllers/todo/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DayAfterTomorrowTasks extends ConsumerWidget {
  const DayAfterTomorrowTasks({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var todos = ref.watch(todoStateProvider);
    String dayAfterTomorrow = ref
        .read(todoStateProvider.notifier)
        .getDayAfterTomorrow();
    var dayAfterTomorrowTask = todos.where(
      (element) => element.date!.contains(dayAfterTomorrow),
    );
    return ExpansionTileCustom(
      title: dayAfterTomorrow.substring(5),
      subTitle: "Day After Tomorrow Tasks",
      children: [],
    );
  }
} // 07:42:00