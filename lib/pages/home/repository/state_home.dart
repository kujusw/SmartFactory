import 'dart:async';
import 'dart:math';

import '../../../common/imcore/mqtt_manager.dart';

class HomeState {
// 单例对象
  MqttManager? mqttManager;

  late Timer? myTimer;

  int getRandom() {
    Random random = Random();
    int min = 100000; // 六位数的最小值
    int max = 999999; // 六位数的最大值
    int randomNumber = min + random.nextInt(max - min);
    return randomNumber;
  }
}
