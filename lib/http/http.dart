import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import '../common/utils/logger_manager.dart';
import '../common/values/cache.dart';
import '../common/values/constant.dart';

/*
  * http 操作类
  *
  * 手册
  * https://github.com/flutterchina/dio/blob/master/README-ZH.md
  *
  * 从 3 升级到 4
  * https://github.com/flutterchina/dio/blob/master/migration_to_4.x.md
*/
class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil({required String url, Duration? connectTimeout, Duration? receiveTimeout, String? token}) {
    if (connectTimeout != null) {
      _instance.dio.options.connectTimeout = connectTimeout;
    }
    if (receiveTimeout != null) {
      _instance.dio.options.receiveTimeout = receiveTimeout;
    }
    if (token != null) {
      _instance.dio.options.headers['Authorization'] = 'Bearer $token';
    }
    _instance.dio.options.baseUrl = url;

    return _instance;
  }

  late Dio dio;
  CancelToken cancelToken = CancelToken();
  BaseOptions baseOptions = BaseOptions(
    baseUrl: Constant.HOST,
    connectTimeout: const Duration(milliseconds: 10000),
    receiveTimeout: const Duration(milliseconds: 10000),
    headers: {},
    contentType: 'application/json; charset=utf-8',
    responseType: ResponseType.json,
  );
  HttpUtil._internal() {
    dio = Dio(baseOptions);
    // 添加拦截器
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        return handler.next(options); //continue
      },
      onResponse: (response, handler) {
        return handler.next(response); // continue
      },
      onError: (DioException e, handler) {
        if (e.response?.statusCode == 404) {
          // 处理404错误
          LoggerManager().d('error.code -> 404, error.message -> ${e.response?.data}');
        }
        ErrorEntity eInfo = createErrorEntity(e);
        onError(eInfo);
        return handler.next(e); //
      },
    ));
  }

  /*
   * error统一处理
   */

  // 错误处理
  void onError(ErrorEntity eInfo) {
    LoggerManager().d('error.code -> &${eInfo.code}, error.message -> ${eInfo.message}');
    switch (eInfo.code) {
      case 401:
        LoggerManager().e("Error Info: ${eInfo.message}");
        break;
      case 100002:
      case 100003:
      case 100004:
      case 100005:
      case 100006:
      case 100007:
      case 100008:
      case 100104:
      case 100201:
      case 100202:
      case 100203:
      case 110001:
      case 110002:
      case 110003:
      case 110004:
      case 110005:
      case 110101:
      case 110201:
        unawaited(SmartDialog.showToast(eInfo.message));
        break;
      default:
        //未知错误 提示 错误类型： code
        LoggerManager().e("Error Info: ${eInfo.toString()}");
    }
  }

  // 错误信息
  ErrorEntity createErrorEntity(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        //英文
        return ErrorEntity(code: -1, message: "Request Cancelled");
      case DioExceptionType.sendTimeout:
        //英文
        return ErrorEntity(code: -1, message: "Request Timeout");
      case DioExceptionType.receiveTimeout:
        return ErrorEntity(code: -1, message: "Response Timeout");
      default:
        {
          return ErrorEntity(code: -1, message: error.message ?? "");
        }
    }
  }

  /*
   * 取消请求
   *
   * 同一个cancel token 可以用于多个请求，当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
   * 所以参数可选
   */
  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }

  /// 读取本地配置
  Map<String, dynamic>? getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    // if (Get.isRegistered<UserStore>() && UserStore.to.hasToken == true) {
    //   headers['Authorization'] = 'Bearer ${UserStore.to.token}';
    // }
    return headers;
  }

  /// restful get 操作
  /// refresh 是否下拉刷新 默认 false
  /// noCache 是否不缓存 默认 true
  /// list 是否列表 默认 false
  /// cacheKey 缓存key
  /// cacheDisk 是否磁盘缓存
  Future get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    bool refresh = false,
    bool noCache = !CACHE_ENABLE,
    bool list = false,
    String cacheKey = '',
    bool cacheDisk = false,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.extra ??= {};
    requestOptions.extra!.addAll({
      "refresh": refresh,
      "noCache": noCache,
      "list": list,
      "cacheKey": cacheKey,
      "cacheDisk": cacheDisk,
    });
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    try {
      var response = await dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioException catch (e) {
      //e.response?.data 是服务器拦截返回的错误信息 例如：{"code":401,"message":"Unauthorized"} 直接返回它
      //但是做前置判断 try catch 会捕获到错误信息，所以需要在这里返回
      //解析 e.response?.data 为json格式
      LoggerManager().e('error.response -> ${e.response}');
      int? code = e.response?.statusCode;
      String? message = e.response?.data.toString();
      try {
        code = e.response?.data['code'];
        message = e.response?.data['message'];
      } catch (error) {
        LoggerManager().d('error.code -> ${e.response?.statusCode}, error.message -> ${e.response?.data}');
      }
      onError(ErrorEntity(code: code ?? -1, message: message ?? ""));
      return {"code": code, "message": message};
    }
  }

  /// restful post 操作
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    try {
      var response = await dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: requestOptions,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioException catch (e) {
      int? code = e.response?.statusCode;
      String? message = e.response?.data.toString();
      try {
        code = e.response?.data['code'];
        message = e.response?.data['message'];
      } catch (error) {
        LoggerManager().d('error.code -> ${e.response?.statusCode}, error.message -> ${e.response?.data}');
      }
      onError(ErrorEntity(code: code ?? -1, message: message ?? ""));
      return {"code": code, "message": message};
    }
  }

  /// restful put 操作
  Future put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    try {
      var response = await dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: requestOptions,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioException catch (e) {
      int? code = e.response?.statusCode;
      String? message = e.response?.data.toString();
      try {
        code = e.response?.data['code'];
        message = e.response?.data['message'];
      } catch (error) {
        LoggerManager().d('error.code -> ${e.response?.statusCode}, error.message -> ${e.response?.data}');
      }
      onError(ErrorEntity(code: code ?? -1, message: message ?? ""));
      return {"code": code, "message": message};
    }
  }

  /// restful patch 操作
  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    try {
      var response = await dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: requestOptions,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioException catch (e) {
      int? code = e.response?.statusCode;
      String? message = e.response?.data.toString();
      try {
        code = e.response?.data['code'];
        message = e.response?.data['message'];
      } catch (error) {
        LoggerManager().d('error.code -> ${e.response?.statusCode}, error.message -> ${e.response?.data}');
      }
      onError(ErrorEntity(code: code ?? -1, message: message ?? ""));
      return {"code": code, "message": message};
    }
  }

  /// restful delete 操作
  Future delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    try {
      var response = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: requestOptions,
        cancelToken: cancelToken,
      );
      return response.data;
    } on DioException catch (e) {
      int? code = e.response?.statusCode;
      String? message = e.response?.data.toString();
      try {
        code = e.response?.data['code'];
        message = e.response?.data['message'];
      } catch (error) {
        LoggerManager().d('error.code -> ${e.response?.statusCode}, error.message -> ${e.response?.data}');
      }
      //拦截处理错误
      onError(ErrorEntity(code: code ?? -1, message: message ?? ""));
      return {"code": code, "message": message};
    }
  }

  /// restful post form 表单提交操作
  Future postForm(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    var response = await dio.post(
      path,
      data: FormData.fromMap(data),
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  /// restful post Stream 流数据
  Future postStream(
    String path, {
    dynamic data,
    int dataLength = 0,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    requestOptions.headers!.addAll({
      Headers.contentLengthHeader: dataLength.toString(),
    });
    var response = await dio.post(
      path,
      data: Stream.fromIterable(data.map((e) => [e])),
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response.data;
  }

  // static Future<void> downloadReport(String urlPath, String fileName, String token) async {
  //   final url = Uri.parse(urlPath);
  //   final response = await http.get(url, headers: {'Authorization': 'Bearer $token'});
  //   if (response.statusCode == 200) {
  //     final blob = html.Blob([response.bodyBytes]);
  //     final url = html.Url.createObjectUrlFromBlob(blob);
  //     // final anchor = html.AnchorElement(href: url)
  //     html.AnchorElement(href: url)
  //       ..setAttribute("download", fileName)
  //       ..click();
  //     html.Url.revokeObjectUrl(url);
  //   } else {
  //     // Handle error
  //     LoggerManager().e('Failed to download report: ${response.statusCode} ${response.body}');
  //   }
  // }
}

class ApiResponse<T> {
  final int statusCode;
  final T? data;
  ApiResponse(this.statusCode, this.data);
}

// 异常处理
class ErrorEntity implements Exception {
  int code = -1;
  String message = "";
  ErrorEntity({required this.code, required this.message});

  @override
  String toString() {
    if (message == "") return "Exception";
    return "Exception: code $code, $message";
  }
}
