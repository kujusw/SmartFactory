import 'package:intl/intl.dart';

import '../../models/boards_tab_model.dart';
import '../../models/device_energy_model.dart';
import 'logger_manager.dart';

getTimeMMMDDYHHMMSSA(int timestamp) {
  if (timestamp == 0) {
    return "N/A";
  }
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  String formattedDate = DateFormat('yyyy MM dd HH:mm:ss').format(dateTime);
  return formattedDate;
}

getTimeDMMM(int timestamp) {
  if (timestamp == 0) {
    return "N/A";
  }
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  String formattedDate = DateFormat('d.MMM', 'en_US').format(dateTime);
  // formattedDate = formattedDate[0].toUpperCase() + formattedDate.substring(1);
  return formattedDate;
}

getTimeDMMMHH(int timestamp) {
  if (timestamp == 0) {
    return "N/A";
  }
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
  String formattedDate = DateFormat('d.MMM.HH', 'en_US').format(dateTime);
  // formattedDate = formattedDate[0].toUpperCase() + formattedDate.substring(1);
  return formattedDate;
}

//  DateFormat('EEEE MMMM dd.y @HH:mm:ss').format(DateTime.now());

//字符串时间戳转换 try catch

String getTimeEEEEMMMMDDYHHMMSS(String timestamp) {
  if (timestamp == "0") {
    return "N/A";
  }
  try {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp));
    String formattedDate = DateFormat('EEEE MMMM dd.y @HH:mm:ss', 'en_US').format(dateTime);
    return formattedDate;
  } catch (e) {
    LoggerManager().e("getTimeDMMMHHMMSS error: $e");
    return "N/A";
  }
}

String getTimeEEEEMMMMDDYHHMMSSInt(int timestamp) {
  if (timestamp == 0) {
    return "N/A";
  }
  try {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    String formattedDate = DateFormat('E MMM dd.y HH:mm:ss', 'en_US').format(dateTime);
    return formattedDate;
  } catch (e) {
    LoggerManager().e("getTimeDMMMHHMMSS error: $e");
    return "N/A";
  }
}

DateFormat dayFormat = DateFormat('E', "en_US"); // 使用'E'格式化日期为英文简写
List<Map<String, dynamic>> getLastWeekHourlyTimeData() {
  DateTime now = DateTime.now();
  DateTime oneWeekAgo = now.subtract(Duration(days: 7));
  List<Map<String, dynamic>> timeData = [];
  // Add hours from 0 to the initial hour
  //第一天的数据不是从0点开始的，就补齐 从0点开始的数据
  for (int i = 0; i < now.hour; i++) {
    DateTime currentTime = oneWeekAgo.add(Duration(hours: 0));
    timeData.add({
      'hour': i,
      'day': currentTime.day,
      'month': currentTime.month,
      'year': currentTime.year,
      'energy': 0,
    });
  }
  for (int i = 0; i <= 7 * 24; i++) {
    DateTime currentTime = oneWeekAgo.add(Duration(hours: i));
    int hour = currentTime.hour;
    int day = currentTime.day;
    timeData.add({
      'hour': hour,
      'day': day,
      'month': currentTime.month,
      'year': currentTime.year,
      'energy': 0,
    });
  }
  return timeData;
}

List<Map<String, dynamic>> getLastWeekDayTimeData() {
  DateTime now = DateTime.now();
  DateTime lastSunday = now.subtract(Duration(days: now.weekday));
  DateTime previousSunday = lastSunday.subtract(Duration(days: 7));
  List<Map<String, dynamic>> timeData = [];

  for (int i = 0; i < 7; i++) {
    DateTime currentTime = previousSunday.add(Duration(days: i));
    String day = dayFormat.format(currentTime);
    int month = currentTime.month;
    int year = currentTime.year;
    timeData.add({
      'hour': 0,
      'day': day,
      'month': month,
      'year': year,
      'energy': 0,
    });
  }
  return timeData;
}

List<Map<String, dynamic>> getCurrentMonthDailyTimeData() {
  DateTime now = DateTime.now();
  int currentMonth = now.month;
  int currentYear = now.year;
  int currentDay = now.day;
  List<Map<String, dynamic>> timeData = [];
  for (int day = 1; day <= currentDay; day++) {
    timeData.add({
      'hour': 0,
      'day': day,
      'month': currentMonth,
      'year': currentYear,
      'energy': 0, // 初始化 energy 为 0
    });
  }
  return timeData;
}

List<Map<String, dynamic>> getCurrentYearMonthlyData() {
  DateTime now = DateTime.now();
  int currentMonth = now.month;
  int currentYear = now.year;
  List<Map<String, dynamic>> timeData = [];
  for (int month = 1; month <= currentMonth; month++) {
    DateTime currentTime = DateTime(currentYear, month);
    String monthName = DateFormat('MMM', 'en_US').format(currentTime);
    LoggerManager().d("monthName  $monthName");
    timeData.add({
      'hour': 0,
      'day': 0,
      'month': monthName,
      'year': currentYear,
      'energy': 0, // 初始化 energy 为 0
    });
  }
  return timeData;
}

getJsonDataByChartWidgetModel(BoardsChartWidgetModel chartWidgetModel, List<DeviceEnergy> data) {
  if (chartWidgetModel.reading == "energy_hourly" && chartWidgetModel.period == "7d") {
    var timeData = getLastWeekHourlyTimeData();
    for (var i = 0; i < timeData.length; i++) {
      for (var deviceEnergy in data) {
        var day = DateTime.fromMillisecondsSinceEpoch((deviceEnergy.timestamp ?? 0) * 1000).day;
        var hour = DateTime.fromMillisecondsSinceEpoch((deviceEnergy.timestamp ?? 0) * 1000).hour;
        if (timeData[i]['hour'] == hour && timeData[i]['day'] == day) {
          timeData[i]['energy'] = double.parse((deviceEnergy.energy ?? 0).toDouble().toStringAsFixed(2));
        }
      }
    }
    return timeData;
  } else if (chartWidgetModel.reading == "energy_daily" && chartWidgetModel.period == "last_week") {
    var timeData = getLastWeekDayTimeData();
    LoggerManager().d("timeData: $timeData");
    LoggerManager().d("timeData: $data");
    for (var i = 0; i < timeData.length; i++) {
      for (var deviceEnergy in data) {
        // deviceEnergy.timestamp 转换为 使用'E'格式化日期为英文简写 然后比较
        DateTime day = DateTime.fromMillisecondsSinceEpoch((deviceEnergy.timestamp ?? 0) * 1000);
        if (timeData[i]['day'] == dayFormat.format(day)) {
          timeData[i]['energy'] = double.parse((deviceEnergy.energy ?? 0).toDouble().toStringAsFixed(2));
        }
      }
    }
    return timeData;
  } else if (chartWidgetModel.reading == "energy_daily" && chartWidgetModel.period == "month") {
    var timeData = getCurrentMonthDailyTimeData();
    for (var i = 0; i < timeData.length; i++) {
      for (var deviceEnergy in data) {
        var day = DateTime.fromMillisecondsSinceEpoch((deviceEnergy.timestamp ?? 0) * 1000).day;
        if (timeData[i]['day'] == day) {
          timeData[i]['energy'] = double.parse((deviceEnergy.energy ?? 0).toDouble().toStringAsFixed(2));
        }
      }
    }
    return timeData;
  } else if (chartWidgetModel.reading == "energy_monthly" && chartWidgetModel.period == "year") {
    var timeData = getCurrentYearMonthlyData();
    for (var i = 0; i < timeData.length; i++) {
      for (var deviceEnergy in data) {
        DateTime month = DateTime.fromMillisecondsSinceEpoch((deviceEnergy.timestamp ?? 0) * 1000);
        // deviceEnergy.timestamp 转换为  使用'MMM'格式化月份为英文简写 然后比较
        if (timeData[i]['month'] == DateFormat('MMM', 'en_US').format(month)) {
          timeData[i]['energy'] = double.parse((deviceEnergy.energy ?? 0).toDouble().toStringAsFixed(2));
        }
      }
    }
    return timeData;
  } else {
    return [];
  }
}
