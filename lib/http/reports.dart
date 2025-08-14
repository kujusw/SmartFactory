import '../common/values/constant.dart';
import '../models/report_model.dart';
import 'http.dart';

class ReportsAPI {
  static Future<ReportsResponseEntity> getReports({
    String? path,
    String? token,
  }) async {
    try {
      var response = await HttpUtil(url: Constant.HOST, token: token).get(path!);
      // LoggerManager().d("ReportsAPI.getReports response: $response");
      return ReportsResponseEntity.fromJson(response);
    } catch (e) {
      // LoggerManager().e("ReportsAPI.getReports error: $e");
      return ReportsResponseEntity(code: 404, message: e.toString());
    }
  }
}
