import 'package:flow_plan/common/helpers/db_helper.dart';
import 'package:flow_plan/common/models/task_modal.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_provider.g.dart';

@riverpod
class TodoState extends _$TodoState {
  @override
  List<Task> build() {
    return [];
  }

  void refresh() async {
    final data = await DBHelper.getItems();
    state = data.map((e) => Task.fromJson(e)).toList();
  }

  void addItem(Task task) async {
    await DBHelper.createItem(task);
    refresh();
  }

  void updateItem(
    int id,
    String title,
    String desc,
    int isCompleted,
    String date,
    String startTime,
    String endTime,
    int reminder,
    String repeat,
  ) async {
    await DBHelper.updateItem(
      id,
      title,
      desc,
      isCompleted,
      date,
      startTime,
      endTime,
      reminder,
      repeat,
    );
    refresh();
  }

  Future<void> deleteTodo(int id) async {
    await DBHelper.deleteItem(id);
    refresh();
  }

  void markAsCompleted(
    int id,
    String title,
    String desc,
    int isCompleted,
    String date,
    String startTime,
    String endTime,
    int reminder,
    String repeat,
  ) async {
    await DBHelper.updateItem(
      id,
      title,
      desc,
      1,
      date,
      startTime,
      endTime,
      reminder,
      repeat,
    );
  }
} // 06:10:00