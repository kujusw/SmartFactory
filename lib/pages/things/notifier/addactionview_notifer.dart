import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'addactionview_notifer.g.dart';

@riverpod
class AddDeviceName extends _$AddDeviceName {
  @override
  String build() => "";

  void set(String name) => state = name;
}
