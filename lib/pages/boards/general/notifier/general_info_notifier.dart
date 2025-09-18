import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:smart_factory/models/general_globalinfo_model.dart';

import '../../../../http/general_info.dart';
import '../../../login/notifier/login_notifier.dart';

part 'general_info_notifier.g.dart';

@riverpod
Future<Overview> getGeneralGlobalInfo(Ref ref) async {
  final token = ref.read(loginProvider).data?.token;
  final GeneralGlobalInfoResponseEntity generalGlobalInfo =
      await GeneralInfoAPI.getGeneralGlobalInfo(path: "api/v1/devices/statistics", token: token);
  return generalGlobalInfo.data?.overview ?? Overview();
}
