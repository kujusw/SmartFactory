import '../common/utils/logger_manager.dart';
import '../common/values/constant.dart';
import '../models/audit_manager_model.dart';
import 'http.dart';

class AuditAPI {
  static Future<AuditsResponseEntity> getAudits({
    Map<String, dynamic>? parameter,
    String? path,
    String? token,
  }) async {
    try {
      var response = await HttpUtil(url: Constant.HOST, token: token).get(path!, queryParameters: parameter);
      LoggerManager().d("AuditAPI.getAudits response: $response");
      return AuditsResponseEntity.fromJson(response);
    } catch (e) {
      return AuditsResponseEntity();
    }
  }
}
