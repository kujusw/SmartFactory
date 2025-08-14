import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/utils/logger_manager.dart';
import '../../../models/device_model.dart';

class DeviceMultiSelectsState extends StateNotifier<List<DeviceModel>> {
  DeviceMultiSelectsState() : super([]);

  //选中
  DeviceMultiSelectsState select(DeviceModel deviceModel, bool selected) {
    state = state.map((t) => t.id == deviceModel.id ? deviceModel.copyWith(selectedInAddDevice: selected) : t).toList();
    LoggerManager().d("DeviceMultiSelectsState select: ${state}");
    return this;
  }
}
