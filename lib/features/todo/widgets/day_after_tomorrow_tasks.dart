import 'package:flow_plan/common/utils/constants.dart';
import 'package:flow_plan/common/widgets/expansion_tile_custom.dart';
import 'package:flow_plan/features/todo/controllers/expansion_provider.dart';
import 'package:flow_plan/features/todo/controllers/todo/todo_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
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
      onExpansionChanged: (bool expanded) {
        ref.read(expansionState1Provider.notifier).setStart(!expanded);
      },
      trailing: Padding(
        padding: EdgeInsets.only(right: 12),
        child: ref.watch(expansionState1Provider)
            ? Icon(AntDesign.circledown, color: AppConst.kLight)
            : Icon(AntDesign.closecircleo, color: AppConst.kBlueLight),
      ),
      children: [],
    );
  }
} // 07:42:00
