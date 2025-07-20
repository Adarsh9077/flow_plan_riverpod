import 'package:flow_plan/common/helpers/db_helper.dart';
import 'package:flow_plan/common/models/user_modal.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userProvider = StateNotifierProvider<UserState, List<UserModal>>(
  (ref) => UserState(),
);

class UserState extends StateNotifier<List<UserModal>> {
  UserState() : super([]);

  void refresh() async {
    final data = await DBHelper.getUsers();
    state = data.map((e) => UserModal.fromJson(e)).toList();
  }
}
