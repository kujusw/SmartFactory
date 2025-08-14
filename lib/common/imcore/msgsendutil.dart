import 'dart:convert';
import '../utils/logger_manager.dart';

class MsgSendUtils {
  MsgSendUtils._internal();

  factory MsgSendUtils() => _instance;

  static final MsgSendUtils _instance = MsgSendUtils._internal();

  void sendMessageToGateway(Map<String, dynamic>? jsonSend, {Function(String)? callback}) {
    LoggerManager().d("sendMessage: ${json.encode(jsonSend)}");
    // LoggerManager().d("sendMessage: ${this.hashCode}");

    // if (Get.findOrNull<HomeController>()?.state.mqttState.value == "OnConnected") {
    //   Get.findOrNull<HomeController>()
    //       ?.state
    //       .mqttManager
    //       ?.publishMessage(json.encode(jsonSend), "${Constant.currentGatewayModel.value.gatewaySn!}_gateway");
    // } else {
    //   if (callback != null) {
    //     callback(tr(Strings.gatewaycloudconnectiondisconnected));
    //   }
    // }
  }
}
