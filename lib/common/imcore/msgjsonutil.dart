class MsgJsonUtils {
  MsgJsonUtils._internal();

  factory MsgJsonUtils() => _instance;

  static final MsgJsonUtils _instance = MsgJsonUtils._internal();

  /// 这个api是用来设备退网的
  /// msgId String 是 UUID
  /// msgType String 是 device_exclusion
  /// sn String 是 ⾯板序列号
  /// userId String 是 ⽤户 ID

  // Map<String, dynamic>? getDeviceExclusionToJson(String gatewaysn) {
  //   try {
  //     Map<String, dynamic> object = {
  //       "msgId": const Uuid().v4(),
  //       "msgType": "device_exclusion",
  //       "sn": gatewaysn,
  //       "userId": UserStore.to.profile.info?.userId ?? "",
  //     };
  //     return object;
  //   } catch (e) {
  //     LoggerManager().e(e.toString());
  //   }
  //   return null;
  // }
}
