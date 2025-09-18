import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/utils/logger_manager.dart';
import '../../../models/device_model.dart';

part 'devicemultiselectstate.g.dart';

@riverpod
class DeviceMultiSelectsState extends _$DeviceMultiSelectsState {
  @override
  List<DeviceModel> build() => [];

  /// 选中/取消选中
  void select(DeviceModel deviceModel, bool selected) {
    state = state
        .map(
          (t) => t.id == deviceModel.id ? deviceModel.copyWith(selectedInAddDevice: selected) : t,
        )
        .toList();
    LoggerManager().d("DeviceMultiSelectsState select: $state");
  }

  /// 添加设备
  void addDevice(DeviceModel device) {
    state = [...state, device];
  }

  /// 移除设备
  void removeDevice(String id) {
    state = state.where((t) => t.id != id).toList();
  }

  /// 清空
  void clear() {
    state = [];
  }
}
