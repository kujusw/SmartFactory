import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';
import '../../models/logentity.dart';
import '../values/constant.dart';

Future<String> createDirectory() async {
  final Directory directory = await getApplicationDocumentsDirectory();
  var file = Directory("${directory.path}/logger");

  try {
    bool exist = await file.exists();
    if (exist == false) {
      await file.create();
    }
  } catch (e) {
    LoggerManager().d("createDirectory error");
  }

  return file.path;
}

class LoggerManager {
  //私有构造函数
  LoggerManager._internal() {
    initLogger();
  }
  final int maxLogCount = 300;
  //保存单例
  static final LoggerManager _singleton = LoggerManager._internal();

  //工厂构造函数
  factory LoggerManager() => _singleton;

  late Logger logger;

  // log初始化设置
  void initLogger() {
    // FileOutput fileOutPut = FileOutput();
    ConsoleOutput consoleOutput = ConsoleOutput();
    // List<LogOutput> multiOutput = Constant.isUser ? [consoleOutput] : [fileOutPut, consoleOutput];
    List<LogOutput> multiOutput = [consoleOutput];
    logger = Logger(
      filter: DevelopmentFilter(),
      // Use the default LogFilter (-> only log in debug mode)
      // printer: SimplePrinter(
      //   colors: true,
      //   printTime: true,
      // ),
      // printer: HybridPrinter(
      //   PrettyPrinter(
      //     noBoxingByDefault: false,
      //     methodCount: 2,
      //     // number of method calls to be displayed
      //     errorMethodCount: 8,
      //     // number of method calls if stacktrace is provided
      //     lineLength: 120,
      //     // width of the output
      //     colors: true,
      //     // Colorful log messages
      //     printEmojis: false,
      //     // Print an emoji for each log message
      //     printTime: true, // Should each log print contain a timestamp
      //   ),
      //   debug: SimplePrinter(printTime: true),
      // ),

      // printer: PrefixPrinter(PrettyPrinter(
      //   noBoxingByDefault: true,
      //   methodCount: 2,
      //   // number of method calls to be displayed
      //   errorMethodCount: 8,
      //   // number of method calls if stacktrace is provided
      //   lineLength: 120,
      //   // width of the output
      //   colors: true,
      //   // Colorful log messages
      //   printEmojis: false,
      //   // Print an emoji for each log message
      //   printTime: true, // Should each log print contain a timestamp
      // )),

      printer: PrettyPrinter(
        noBoxingByDefault: false,
        methodCount: 2,
        // number of method calls to be displayed
        errorMethodCount: 8,
        // number of method calls if stacktrace is provided
        lineLength: 120,
        // width of the output
        colors: true,
        // Colorful log messages
        printEmojis: false,
        // Print an emoji for each log message
        printTime: true, // Should each log print contain a timestamp
      ),
      // Use the PrettyPrinter to format and print log
      output: MultiOutput(
        multiOutput,
      ), // Use the default LogOutput (-> send everything to console)
      // output: fileOutPut,
    );
  }

  // Debug
  void d(String message) {
    logger.d(message);
    Constant.loggers.add(LogEntity(type: "d", log: message));
    if (Constant.loggers.length > maxLogCount) {
      Constant.loggers.removeAt(0);
    }
  }

  // info
  void i(String message) {
    logger.i(message);
    Constant.loggers.add(LogEntity(type: "i", log: message));
    if (Constant.loggers.length > maxLogCount) {
      Constant.loggers.removeAt(0);
    }
  }

  // warning
  void w(String message) {
    logger.w(message);
    Constant.loggers.add(LogEntity(type: "w", log: message));
    if (Constant.loggers.length > maxLogCount) {
      Constant.loggers.removeAt(0);
    }
  }

  // error
  void e(String message) {
    logger.e(message);
    Constant.loggers.add(LogEntity(type: "e", log: message));
    if (Constant.loggers.length > maxLogCount) {
      Constant.loggers.removeAt(0);
    }
  }

  String sliverListToString() {
    List<String> textItems = [];
    for (var element in Constant.loggers) {
      textItems.add("${element.time} : ${element.log}\n");
    }
    return textItems.join('');
  }
}

/// Writes the log output to a file.
class FileOutput extends LogOutput {
  final bool overrideExisting;
  final Encoding encoding;
  IOSink? _sink;

  File? file;
  String? _currentDate;

  FileOutput({
    this.overrideExisting = false,
    this.encoding = utf8,
  });

  Future<void> getDirectoryForLogRecord() async {
    String currentDate = getCurrentDay();
    if (currentDate != _currentDate) {
      final String fileDir = await createDirectory();
      file = File('$fileDir/$currentDate.log');

      _sink = file!.openWrite(
        mode: overrideExisting ? FileMode.writeOnly : FileMode.writeOnlyAppend,
        // encoding: encoding,
      );

      _currentDate = currentDate;
    }
  }

  String getCurrentDay() {
    String currentDate = DateFormat('yyyyMMdd').format(DateTime.now());
    return currentDate;
  }

  @override
  Future<void> init() async {
    directoryLogRecord(onCallback: () {});
  }

  void directoryLogRecord({required Function onCallback}) {
    unawaited(getDirectoryForLogRecord().whenComplete(() {
      onCallback();
    }));
  }

  @override
  void output(OutputEvent event) {
    directoryLogRecord(onCallback: () {
      if (_sink != null) {
        if (Level.debug == event.level ||
            Level.info == event.level ||
            Level.warning == event.level ||
            Level.error == event.level) {
          _sink?.writeAll(event.lines, '\n');
          _sink?.writeln();
        }
      }
    });
  }

  @override
  Future<void> destroy() async {
    await _sink?.flush();
    await _sink?.close();
  }
}
