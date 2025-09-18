import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/general_device_info_model.dart';
import '../utils/logger_manager.dart';
import '../utils/time_utils.dart';
import '../utils/validator.dart';

class MsgReceiveUtils {
  MsgReceiveUtils._internal();
  factory MsgReceiveUtils() => _instance;
  static final MsgReceiveUtils _instance = MsgReceiveUtils._internal();

  // static final StreamController<String> _messageStreamMqttController = StreamController<String>.broadcast();

  // Stream<String> get messageStream => _messageStreamMqttController.stream;

  handlerReceiveMessage(Ref ref, String recvMsg, String topic) {
    LoggerManager().d("handlerReceiveMessage: $recvMsg");
    // _messageStreamMqttController.add(recvMsg);
    // if (topic == "device/energy") {
    //   Map<String, dynamic> jsonMap = json.decode(recvMsg);
    //   refreshDeviceInfos(ref, jsonMap, itemsGeneralDeviceProvider);
    //   refreshDeviceInfos(ref, jsonMap, itemsDeviceInfosProvider);
    // }
  }

  void refreshDeviceInfos(Ref ref, Map<String, dynamic> jsonMap, dynamic itemsDeviceInfosProvider) {
    List<GeneralDeviceInfoModel> deviceInfosModel = ref.read(itemsDeviceInfosProvider);
    if (jsonMap["deviceId"] == deviceInfosModel[0].id) {
      for (var item in deviceInfosModel) {
        if (item.id == jsonMap["deviceId"] && item.type == "Current") {
          item.value = stringToDouble(jsonMap["current"].toString()).toString() + "A";
          item.time = getTimeMMMDDYHHMMSSA(jsonMap["time"]).toString();
        }
        if (item.id == jsonMap["deviceId"] && item.type == "Energy") {
          item.value = stringToDouble(jsonMap["energy"].toString()).toString() + "kWh";
          item.time = getTimeMMMDDYHHMMSSA(jsonMap["time"]).toString();
        }
        if (item.id == jsonMap["deviceId"] && item.type == "Power") {
          item.value = stringToDouble(jsonMap["power"].toString()).toString() + "kW";
          item.time = getTimeMMMDDYHHMMSSA(jsonMap["time"]).toString();
        }
        if (item.id == jsonMap["deviceId"] && item.type == "Status") {
          item.value = "Connected";
          item.time = getTimeMMMDDYHHMMSSA(jsonMap["time"]).toString();
        }
        if (item.id == jsonMap["deviceId"] && item.type == "Hourly Total Energy") {
          item.value = stringToDouble(jsonMap["energy_hourly"].toString()).toString() + "kWh";
          item.time = getTimeMMMDDYHHMMSSA(jsonMap["time"]).toString();
        }
        if (item.id == jsonMap["deviceId"] && item.type == "Daily Total Energy") {
          item.value = stringToDouble(jsonMap["energy_daily"].toString()).toString() + "kWh";
          item.time = getTimeMMMDDYHHMMSSA(jsonMap["time"]).toString();
        }
        if (item.id == jsonMap["deviceId"] && item.type == "Monthly Total Energy") {
          item.value = stringToDouble(jsonMap["energy_monthly"].toString()).toString() + "kWh";
          item.time = getTimeMMMDDYHHMMSSA(jsonMap["time"]).toString();
        }
        if (item.id == jsonMap["deviceId"] && item.type == "Weekly Energy Diff") {
          item.value = stringToDouble(jsonMap["energy_weekly_diff"].toString()).toString() + "kWh";
          item.time = getTimeMMMDDYHHMMSSA(jsonMap["time"]).toString();
        }
        if (item.id == jsonMap["deviceId"] && item.type == "Weekly Total Energy") {
          item.value = stringToDouble(jsonMap["energy_weekly"].toString()).toString() + "kWh";
          item.time = getTimeMMMDDYHHMMSSA(jsonMap["time"]).toString();
        }
      }
      ref.read(itemsDeviceInfosProvider.notifier).setList(deviceInfosModel);
    }
  }
}
