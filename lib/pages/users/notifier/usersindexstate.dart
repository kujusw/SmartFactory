import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'usersindexstate.g.dart';

@riverpod
class UsersIndexState extends _$UsersIndexState {
  @override
  int build() => 0;

  /// 设置索引
  void setIndex(int index) {
    state = index;
  }
}
