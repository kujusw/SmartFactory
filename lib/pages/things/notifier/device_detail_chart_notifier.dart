import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'device_detail_chart_notifier.g.dart';

@riverpod
class ChartDataType extends _$ChartDataType {
  @override
  String build() => "day";

  void set(String value) => state = value;
}

@riverpod
class ChartDataStart extends _$ChartDataStart {
  @override
  String? build() => "";

  void set(String value) => state = value;
}

@riverpod
class ChartDataEnd extends _$ChartDataEnd {
  @override
  String? build() => "";

  void set(String value) => state = value;
}
