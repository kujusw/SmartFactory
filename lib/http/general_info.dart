import '../common/utils/logger_manager.dart';
import '../common/values/constant.dart';
import '../models/general_globalinfo_model.dart';
import 'http.dart';

class GeneralInfoAPI {
  static Future<GeneralGlobalInfoResponseEntity> getGeneralGlobalInfo({
    String? path,
    String? token,
  }) async {
    try {
      var response = await HttpUtil(url: (Constant.HOST), token: token).get(path!);
      LoggerManager().d("GeneralInfoAPI.getGeneralGlobalInfo response: $response");
      return GeneralGlobalInfoResponseEntity.fromJson(response);
    } catch (e) {
      return GeneralGlobalInfoResponseEntity();
    }
  }
}
