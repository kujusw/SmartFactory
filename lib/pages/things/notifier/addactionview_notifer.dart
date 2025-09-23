import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'addactionview_notifer.g.dart';

@Riverpod(keepAlive: true)
class AddDeviceName extends _$AddDeviceName {
  @override
  String build() => "";

  void set(String name) => state = name;
}

@riverpod
class AddWarningYellowThreshold extends _$AddWarningYellowThreshold {
  @override
  double build() => 0;

  void set(double threshold) => state = threshold;
}

@riverpod
class AddWarningRedThreshold extends _$AddWarningRedThreshold {
  @override
  double build() => 0;

  void set(double threshold) => state = threshold;
}
