import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'expansion_provider.g.dart';
@riverpod
class ExpansionState extends _$ExpansionState {
  // @riverpod
  @override
  bool build(){
    return false ;
  }

  void setStart (bool newState){
    state = newState;
  }

}

@riverpod
class ExpansionState0 extends _$ExpansionState0 {
  // @riverpod
  @override
  bool build(){
    return true ;
  }

  void setStart (bool newState){
    state = newState;
  }

}