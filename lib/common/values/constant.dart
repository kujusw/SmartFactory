import 'package:flutter_floating/floating/floating.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/logentity.dart';

abstract class Constant {
  //平台
  static String PLATFORM = "";

  /// BaseEntity
  static const String data = 'data';
  static const String errorCode = 'errorCode';
  static const String errorMsg = 'errorMsg';

  /// PageEntity
  static const String datas = 'datas';
  static const String curPage = "curPage";
  static const String offset = "offset";
  static const String over = "over";
  static const String pageCount = "pageCount";
  static const String size = "size";
  static const String total = "total";

  //正式环境
  // static String HOST = "https://mpiot.com.hk/";
  // static String HOST_MQTT = "ws://mpiot.com.hk:8083/mqtt";

  //测试环境
  // static String HOST = "http://47.119.160.142/";
  // static String HOST_MQTT = "ws://47.119.160.142:8083/mqtt";

  //测试环境
  static String HOST = "http://8.138.251.245/";

  //是否是测试环境
  static const bool isUser = true;
  static Floating? floating;

  static List<LogEntity> loggers = <LogEntity>[];

  static double add_testSP = 4.sp;

  static double textSP_4 = 4.sp + add_testSP;
  static double textSP_6 = 6.sp + add_testSP;
  static double textSP_8 = 8.sp + add_testSP;
  static double textSP_12 = 12.sp + add_testSP;
  static double textSP_14 = 14.sp + add_testSP;
  static double textSP_16 = 16.sp + add_testSP;
  static double textSP_18 = 18.sp + add_testSP;
  static double textSP_20 = 20.sp + add_testSP;
  static double textSP_24 = 24.sp + add_testSP;
  static double textSP_30 = 30.sp + add_testSP;
  static double textSP_42 = 42.sp + add_testSP;
}
