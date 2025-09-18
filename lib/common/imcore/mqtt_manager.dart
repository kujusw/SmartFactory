import 'dart:convert';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../utils/logger_manager.dart';
import 'msgreceiveutil.dart';

class MqttManager {
  // 静态变量，保存单例对象
  static MqttManager? _instance;

  // 工厂构造函数，返回单例对象
  factory MqttManager(String server, String clientIdentifier, {String? username, String? password}) {
    _instance ??= MqttManager._internal(server, clientIdentifier, username: username, password: password);
    return _instance!;
  }

  // MQTTClient 对象
  MqttServerClient? client;
  // 私有构造函数，初始化 MQTTClient 对象
  MqttManager._internal(String server, String clientIdentifier, {String? username, String? password}) {
    LoggerManager()
        .d('MQTT connect server:$server clientId:$clientIdentifier  username:$username password :$password ');
    // if (kIsWeb) {
    //   client = MqttBrowserClient(server, clientIdentifier);
    // } else {
    client = MqttServerClient(server, clientIdentifier);
    // }
    if (username != null && password != null) {
      client?.port = 8083;
      client?.setProtocolV311();
      client?.keepAlivePeriod = 60;
      client?.connectTimeoutPeriod = 3000;
      client?.logging(on: false);
      final connMess = MqttConnectMessage()
          .withClientIdentifier(clientIdentifier)
          // .authenticateAs(username, password)
          // .withWillTopic('willtopic')
          // .withWillMessage('My Will message')
          .withWillQos(MqttQos.atMostOnce)
          .startClean();
      LoggerManager().d('Mosquitto client connecting....');
      client?.connectionMessage = connMess;
    }
    client?.onConnected = onConnected;
    client?.onDisconnected = onDisconnected;
    client?.onSubscribed = onSubscribed;
    client?.onUnsubscribed = onUnsubscribed;
    client?.onSubscribeFail = onSubscribeFail;
    client?.pongCallback = pong;
  }

  // 连接到服务器的方法
  Future<bool> connect(Ref ref) async {
    try {
      await client?.connect();
      recvMessage(ref);
      subscribe("device/state");
      subscribe("device/energy");
      return true;
    } catch (e) {
      LoggerManager().e('Exception: $e');
      disconnect();
      return false;
    }
  }

  void recvMessage(Ref ref) {
    client?.updates?.listen((event) {
      var recvMessage = event[0].payload as MqttPublishMessage;
      // 字符串格式的消息
      var message = const Utf8Decoder().convert(recvMessage.payload.message);
      MsgReceiveUtils().handlerReceiveMessage(ref, message, event[0].topic);
      LoggerManager().d("接收到了主题${event[0].topic}的消息： ${const Utf8Decoder().convert(recvMessage.payload.message)}");
    });
  }

  // 断开连接的方法
  void disconnect() {
    LoggerManager().d('Disconnecting');
    client?.disconnect();
  }

  // 订阅主题的方法
  void subscribe(String topic) {
    client?.subscribe(topic, MqttQos.atMostOnce);
  }

  // 取消订阅主题的方法
  void unsubscribe(String topic) {
    client?.unsubscribe(topic);
  }

  // 发布消息的方法
  Future<int?> publish(String? topic, String? message) async {
    if (client?.connectionStatus?.state == MqttConnectionState.connected) {
      return publishMessage(message, topic);
    }
    return 0;
  }

  int? publishMessage(String? message, String? topic) {
    if (message != null && topic != null) {
      final builder = MqttClientPayloadBuilder();
      builder.addString(message);
      return client?.publishMessage(topic, MqttQos.atMostOnce, builder.payload!);
    } else {
      LoggerManager().d('message or topic is null');
      return 0;
    }
  }

  // 连接成功的回调
  void onConnected() {
    LoggerManager().d('OnConnected');
  }

  // 断开连接的回调
  void onDisconnected() {
    LoggerManager().d('onDisconnected');
  }

  // 订阅成功的回调
  void onSubscribed(String topic) {
    LoggerManager().d('OnSubscribed: $topic');
  }

  // 取消订阅成功的回调
  void onUnsubscribed(String? topic) {
    LoggerManager().d('OnUnsubscribed: $topic');
  }

  // 订阅失败的回调
  void onSubscribeFail(String topic) {
    LoggerManager().d('OnSubscribeFail: $topic');
  }

  // 收到 PING 响应的回调
  void pong() {
    LoggerManager().d('Ping response received');
  }

  // clean
  void clean() {
    client?.connectionMessage = null;
    client = null;
    _instance = null;
  }
}
