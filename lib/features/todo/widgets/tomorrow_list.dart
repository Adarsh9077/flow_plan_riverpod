import 'package:flow_plan/common/utils/constants.dart';
import 'package:flow_plan/features/todo/controllers/todo/todo_provider.dart';
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
    var tomorrowList = todos.forEach(
      (element) => element.date!.contains(tomorrow),
    );
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
        TodoTile(
          start: "11:00",
          end: "04:00",
          switcher: Switch(
            value: true,
            onChanged: (value) {
              // setState(() {
              //   value = !value;
              // });
            },
          ),
        ),
      ],
    );
  }
} // 07:32:45