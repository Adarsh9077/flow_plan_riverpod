import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_provider.g.dart';

@riverpod
class CodeState01 extends _$CodeState01 {
  @override
  String build() {
    return "";
  }

  void setStart(String newState) {
    state = newState;
  }
}
